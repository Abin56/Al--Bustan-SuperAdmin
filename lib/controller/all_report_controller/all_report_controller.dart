import 'dart:convert';
import 'dart:html';

import 'package:canteen_superadmin_website/core/constant/const.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:canteen_superadmin_website/model/all_report_model/all_report_model.dart';
import 'package:canteen_superadmin_website/model/delivery_model.dart';
import 'package:canteen_superadmin_website/model/m.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_pdf/pdf.dart';

//Local imports
class AllReportController extends GetxController {
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
    required context,
    required String type,
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    int index = 0;
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

    final storeData = await dataserver.collection('Storehistory').get();
    final storeDataList = storeData.docs
        .map((e) => AllProductDetailModel.fromMap(e.data()))
        .toList();
    List<AllReportModel> allReportlist1 = storeDataList.map((e) {
      int total = e.quantityinStock * e.inPrice;
      return AllReportModel(
          productName: e.productname,
          date: e.addedDate,
          companyName: e.companyName,
          type: 'Store',
          countOrQty: e.quantityinStock,
          price: e.inPrice,
          totalPrice: total);
    }).toList();
    final deliveryData = await dataserver.collection('DeliveredList').get();
    final deliveredList =
        deliveryData.docs.map((e) => DeliveryModel.fromMap(e.data())).toList();

    final allReportlist2 = deliveredList.map((e) {
    
      return AllReportModel(
          productName: '',
          date: e.time,
          companyName: e.canteenName,
          type: 'Delivery',
          countOrQty: e.orderCount,
          price: e.price,
          totalPrice: e.price);
    });
    final currentDate = DateTime.now();
    allReportlist1.addAll(allReportlist2);

    allReportlist1.sort((a, b) => a.date.compareTo(b.date));
    for (AllReportModel data in allReportlist1) {
      final productDate = DateTime.parse(data.date);

      if (type == '1') {
        if (productDate.day == currentDate.day &&
            productDate.month == currentDate.month &&
            productDate.year == currentDate.year) {
          index++;
          addProducts(
              index.toString(),
              data.productName,
              dateConveter(DateTime.parse(data.date)),
              data.type,
              data.companyName,
              data.countOrQty.toString(),
              data.price.toString(),
              data.price.toString(),
              grid);
        }
      } else if (type == '2') {
        if (productDate
            .isAfter(DateTime.now().subtract(const Duration(days: 7)))) {
          index++;
          addProducts(
              index.toString(),
              data.productName,
              dateConveter(DateTime.parse(data.date)),
              data.type,
              data.companyName,
              data.countOrQty.toString(),
              data.price.toString(),
              data.price.toString(),
              grid);
        }
      } else if (type == '3') {
        if (productDate
            .isAfter(DateTime.now().subtract(const Duration(days: 30)))) {
          index++;
          addProducts(
              index.toString(),
              data.productName,
              dateConveter(DateTime.parse(data.date)),
              data.type,
              data.companyName,
              data.countOrQty.toString(),
              data.price.toString(),
              data.price.toString(),
              grid);
        }
      } else if (type == '4') {
        if (productDate.isAfter(startTime!) && productDate.isBefore(endTime!) ||
            productDate.isAtSameMomentAs(startTime) ||
            productDate.isAtSameMomentAs(endTime!)) {
          index++;
          addProducts(
              index.toString(),
              data.productName,
              dateConveter(DateTime.parse(data.date)),
              data.type,
              data.companyName,
              data.countOrQty.toString(),
              data.price.toString(),
              data.price.toString(),
              grid);
        }
      }
    }

    //Draw the header section by creating text element
    final PdfLayoutResult result = drawHeader(
      page,
      pageSize,
      grid,
    );
    //Draw grid
    drawGrid(page, grid, result);
    //Add invoice footer
    // drawFooter(page, pageSize);
    //Save the PDF document
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
    PdfPage page,
    Size pageSize,
    PdfGrid grid,
  ) {
    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);


    const String invoiceNumber = 'Date:18-Jan-24\r\n \r\n';
    final Size contentSize = contentFont.measureString(invoiceNumber);

    String address =
        '''Challan No. JUMERASH\r\n\r\n Ref No.IN3402601\r\n\r\n ''';

    String heading =
        '''AL BUSTAN BAKERY & SWEETS LLC\r\n\r\n         Al Qusais Industrial Area 3\r\n\r\n                 Emiates Dubai\r\n\r\n''';

    PdfTextElement(text: invoiceNumber, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 30), 10,
            contentSize.width + 30, pageSize.height - 10));
    PdfTextElement(text: address, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(30, 10, pageSize.width - (contentSize.width + 30),
            pageSize.height - 10))!;
    return PdfTextElement(text: heading, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(200, 45,
            pageSize.width - (contentSize.width + 30), pageSize.height - 50))!;

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



    page.graphics.drawString(
        'AL BUSTAN BAKERY & SWEETS LLC\n',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          7,
        ),
        bounds: Rect.fromLTWH(
            quantityCellBounds!.left-90,
            result.bounds.bottom + 380,
            quantityCellBounds!.width +100,
            quantityCellBounds!.height));

    page.graphics.drawString(
        'Authorised Signatory\n',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          6.5,
        ),
        bounds: Rect.fromLTWH(
            quantityCellBounds!.left-90,
            result.bounds.bottom + 410,
            quantityCellBounds!.width + 100,
            quantityCellBounds!.height));
  }
//Draw the invoice footer data.

//Create PDF grid and return
  PdfGrid getGrid() {
    //Create a PDF grid
    final PdfGrid grid = PdfGrid();
    //Secify the columns count to the grid.
    grid.columns.add(count: 6);
    //Create the header row of the grid.


    //Set style
// Create the header row of the grid.
    final PdfGridRow headerRow = grid.headers.add(2)[0];

// Set style
    headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
    headerRow.style.textBrush = PdfBrushes.white;

// Set values for the "S.no" column
    headerRow.cells[0].value = 'S.no';
    headerRow.cells[1].value = 'Type';
    headerRow.cells[2].value = 'Product Name';
    headerRow.cells[3].value = 'Company Name';
    headerRow.cells[4].value = 'Total';


    //Apply the table built-in style
    grid.applyBuiltInStyle(PdfGridBuiltInStyle.gridTable1Light);
    //Set gird columns width
    grid.columns[0].width = 30;
    grid.columns[1].width = 55;
    grid.columns[2].width = 160;
    grid.columns[3].width = 160;
    grid.columns[4].width = 60;

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
      String date,
      String type,
      String companyName,
      String quantity,
      String price,
      String total,
      PdfGrid grid) {
    final PdfGridRow row = grid.rows.add();
    row.cells[0].value = sno;
    row.cells[1].value = type;
    row.cells[2].value = productName;
    row.cells[3].value = companyName;
    row.cells[4].value = total;

  }
}
