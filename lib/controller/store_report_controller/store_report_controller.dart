import 'dart:convert';
import 'dart:html';

import 'package:canteen_superadmin_website/core/constant/const.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_pdf/pdf.dart';

//Local imports

class StoreReportController extends GetxController {
  validateStartandEndCalender(
      {required DateTime startTime,
      required DateTime? endTime,
      required BuildContext context}) {
    final addedEndDate = endTime!.add(const Duration(days: 1));
    if (startTime.isBefore(addedEndDate)) {
      generateInvoice(
          context: context,
          type: '4',
          startTime: startTime,
          endTime: addedEndDate);
    } else {
      showToast(msg: "The Start date should not be after the end date");
    }
  }

  Future<void> generateInvoice({
    required BuildContext context,
    required String type,
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    //Create a PDF document.
    final PdfDocument document = PdfDocument();
    //Add page to the PDF
    final PdfPage page = document.pages.add();
    //Get page client size
    final Size pageSize = page.getClientSize();
    //Draw rectangle
    page.graphics.drawRectangle(
        bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
        pen: PdfPen(PdfColor(142, 170, 219)));
    //Generate PDF grid.
    final PdfGrid grid = getGrid();


    // for (int i = 0; i < 3; i++) {
    //   // For example, add 10 rows with dummy data
    //   addProducts(
    //       ' ${i + 1}',
    //       'Product Name ${i + 1}',
    //       ' Size${i + 1}',
    //       'Unit ${i + 1}',
    //       'Quantity1${i + 1}',
    //       // 'Amount1${i + 1}',
    //       'Quantity2${i + 1}',
    //       // 'Amount2${i + 1}',
    //       'Quantity3${i + 1}',
    //       // 'Amount3${i + 1}',
    //       // 'Quantity4${i + 1}',
    //       // 'Amount4${i + 1}',
    //       // 'Remarks${i + 1}',
    //       grid);
    // }

    final storeData = await dataserver
        .collection('Storehistory')
        .orderBy('addedDate', descending: true)
        .get();

    final storeList = storeData.docs
        .map((e) => AllProductDetailModel.fromMap(e.data()))
        .toList();
    int index = 0;
    DateTime currentDate = DateTime.now();

    for (AllProductDetailModel productData in storeList) {
      DateTime productDate = DateTime.parse(productData.addedDate);

      if (type == '1') {
        if (currentDate.day == productDate.day &&
            currentDate.month == productDate.month &&
            currentDate.year == productDate.year) {
          index++;
          addProducts(
              index.toString(),
              productData.productname,
              productData.companyName,
              dateConveter(DateTime.parse(productData.addedDate)),
              productData.quantityinStock.toString(),
              productData.inPrice.toString(),
              productData.outPrice.toString(),
              grid);
        }
      } else if (type == '2') {
        if (DateTime.parse(productData.addedDate)
            .isAfter(DateTime.now().subtract(const Duration(days: 7)))) {
          index++;
          addProducts(
              index.toString(),
              productData.productname,
              productData.companyName,
              dateConveter(DateTime.parse(productData.addedDate)),
              productData.quantityinStock.toString(),
              productData.inPrice.toString(),
              productData.outPrice.toString(),
              grid);
        }
      } else if (type == '3') {
        if (productDate
            .isAfter(DateTime.now().subtract(const Duration(days: 30)))) {
          index++;
          addProducts(
              index.toString(),
              productData.productname,
              productData.companyName,
              dateConveter(DateTime.parse(productData.addedDate)),
              productData.quantityinStock.toString(),
              productData.inPrice.toString(),
              productData.outPrice.toString(),
              grid);
        }
      } else if (type == '4') {
        if (productDate.isAfter(startTime!) && productDate.isBefore(endTime!) ||
            productDate.isAtSameMomentAs(startTime) ||
            productDate.isAtSameMomentAs(endTime!)) {
          index++;
          addProducts(
              index.toString(),
              productData.productname,
              productData.companyName,
              dateConveter(DateTime.parse(productData.addedDate)),
              productData.quantityinStock.toString(),
              productData.inPrice.toString(),
              productData.outPrice.toString(),
              grid);
        }
      }
    }

    //Draw the header section by creating text element
    final PdfLayoutResult result = drawHeader(page, pageSize, grid);
    //Draw grid
    drawGrid(page, grid, result);

    final List<int> bytes = await document.save();



    //Save and launch the file.
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", "output.pdf")
      ..click();

    document.dispose();
  }



//Draws the invoice header
  PdfLayoutResult drawHeader(
      PdfPage page, Size pageSize, PdfGrid grid, ) {
    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
    //final PdfFont headingFont = PdfStandardFont(PdfFontFamily.timesRoman, 10);

    const String invoiceNumber = 'Date:18-Jan-24\r\n \r\n';
    final Size contentSize = contentFont.measureString(invoiceNumber);

    String address =
        '''Challan No. JUMERASH\r\n\r\n Ref No.IN3402601\r\n\r\n ''';

    String heading =
        '''AL BUSTAN BAKERY & SWEETS LLC\r\n\r\n         Al Qusais Industrial Area 3\r\n\r\n                 Emiates Dubai\r\n\r\n''';
    String secondHeading = '''                MATERIAL IN                ''';


    PdfTextElement(text: invoiceNumber, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 30), 10,
            contentSize.width + 30, pageSize.height - 10));
    PdfTextElement(text: address, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(30, 10, pageSize.width - (contentSize.width + 30),
            pageSize.height - 10))!;
    PdfTextElement(text: heading, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(200, 45,
            pageSize.width - (contentSize.width + 30), pageSize.height - 50))!;

    return PdfTextElement(text: secondHeading, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(200, 150,
            pageSize.width - (contentSize.width + 30), pageSize.height - 100))!;
  }

//Draws the grid
  void drawGrid(PdfPage page, PdfGrid grid, PdfLayoutResult result) {
    Rect? totalPriceCellBounds;
    Rect? quantityCellBounds;
    //Invoke the beginCellLayout event.
    grid.beginCellLayout = (Object sender, PdfGridBeginCellLayoutArgs args) {
      final PdfGrid grid = sender as PdfGrid;
      if (args.cellIndex == grid.columns.count - 1) {
        totalPriceCellBounds = args.bounds;
      } else if (args.cellIndex == grid.columns.count - 2) {
        quantityCellBounds = args.bounds;
      }
    };
    //Draw the PDF grid and get the result.
    result = grid.draw(
        page: page, bounds: Rect.fromLTWH(0, result.bounds.bottom + 40, 0, 0))!;


               page.graphics.drawString('AL BUSTAN BAKERY & SWEETS LLC\n',
        PdfStandardFont(PdfFontFamily.helvetica, 8, ),
        bounds: Rect.fromLTWH(
            quantityCellBounds!.left-90,
            result.bounds.bottom + 380,
            quantityCellBounds!.width+140,
            quantityCellBounds!.height));

             page.graphics.drawString('Authorised Signatory\n',
        PdfStandardFont(PdfFontFamily.helvetica, 6.5, ),
        bounds: Rect.fromLTWH(
            quantityCellBounds!.left-90,
            result.bounds.bottom + 410,
            quantityCellBounds!.width+140,
            quantityCellBounds!.height));
 
  }
//Draw the invoice footer data.


//Create PDF grid and return
  PdfGrid getGrid() {
    
    //Create a PDF grid
    final PdfGrid grid = PdfGrid();
    //Secify the columns count to the grid.
    grid.columns.add(count: 7);
    //Create the header row of the grid.

    //Set style
// Create the header row of the grid.
    final PdfGridRow headerRow = grid.headers.add(2)[0];

// Set style
    headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
    headerRow.style.textBrush = PdfBrushes.white;

// Set values for the "S.no" column
    headerRow.cells[0].value = 'S.no';
    headerRow.cells[1].value = 'Product Name';
    headerRow.cells[2].value = 'Supplier Name';

// Create the first cell of the second row and set its value
    final PdfGridCell productCell = headerRow.cells[3];
    headerRow.cells[3].stringFormat.alignment = PdfTextAlignment.center;

    productCell.value = 'Quantity';
    // productCell.columnSpan = 1;
/////////////////////////////////////Wareh
    final PdfGridCell warehouse = headerRow.cells[4];
    headerRow.cells[4].stringFormat.alignment = PdfTextAlignment.center;

    warehouse.value = 'In Price';
    // warehouse.columnSpan = 1;

    /////////////////////////////////////Wareh
    final PdfGridCell outerwarehouse = headerRow.cells[5];

    outerwarehouse.value = 'Out Prince';

    //Apply the table built-in style
    grid.applyBuiltInStyle(PdfGridBuiltInStyle.gridTable1Light);
    //Set gird columns width
    grid.columns[0].width = 30;
    grid.columns[1].width = 127.5;
    grid.columns[2].width = 127.5;
    grid.columns[3].width = 60;
    grid.columns[4].width = 60;
    grid.columns[5].width = 60;

    for (int i = 0; i < headerRow.cells.count; i++) {
      headerRow.cells[i].style.cellPadding =
          PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
    }
    for (int i = 0; i < grid.rows.count; i++) {
      final PdfGridRow row = grid.rows[i];
      for (int j = 0; j < row.cells.count; j++) {
        final PdfGridCell cell = row.cells[j];
        if (j == 0) {
          cell.stringFormat.alignment = PdfTextAlignment.center;
        }
        cell.style.cellPadding =
            PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
      }
    }
    return grid;
  }

//Create and row for the grid.
  void addProducts(
      String sno,
      String productName,
      String supplierName,
      String date,
      String quantity,
      String inPrice,
      String outPrince,
      PdfGrid grid) {
    final PdfGridRow row = grid.rows.add();
    row.cells[0].value = sno;
    row.cells[1].value = productName;
    row.cells[2].value = supplierName;
    row.cells[3].value = quantity;
    row.cells[4].value = inPrice;
    row.cells[5].value = outPrince;
  }


//Get the total amount.
}
