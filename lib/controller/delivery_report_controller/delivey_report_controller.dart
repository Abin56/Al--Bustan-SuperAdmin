import 'dart:convert';
import 'dart:html';

import 'package:canteen_superadmin_website/core/constant/const.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

//Local imports

class DeliveryReportController extends GetxController {
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
    // final Uint8List imageData =
    //     await _getImageData('assests/web_images/AL - Bustan.png');
    //Draw rectangle
    page.graphics.drawRectangle(
        bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
        pen: PdfPen(PdfColor(142, 170, 219)));
    //Generate PDF grid.
    final PdfGrid grid = getGrid();

    int index = 0;
    final deliverdData =
        await dataserver.collection('DeliveredList').orderBy('time').get();
    final currentDate = DateTime.now();
    for (var element in deliverdData.docs) {
      String canteen = element['canteenName'];
      int orderCount = element['orderCount'];
      String date = element['time'];
      final productDate = DateTime.parse(date);
      if (type == '1') {
        if (productDate.day == currentDate.day &&
            productDate.month == currentDate.month &&
            productDate.year == currentDate.year) {
          index++;
          addProducts(index.toString(), dateConveter(productDate), canteen,
              orderCount.toString(), '', '', '', '', grid);
          final deliverProductdata = await dataserver
              .collection('DeliveredList')
              .doc(element['docId'])
              .collection('productsDetails')
              .get();
          final deliveryProductList = deliverProductdata.docs
              .map((e) => AllProductDetailModel.fromMap(e.data()))
              .toList();
          int totalAmount = 0;
          for (AllProductDetailModel productData in deliveryProductList) {
            int totalPrice = productData.outPrice * productData.quantityinStock;
            addProducts(
                '',
                '',
                '',
                '',
                productData.productname,
                productData.quantityinStock.toString(),
                productData.outPrice.toString(),
                totalPrice.toString(),
                grid);
            totalAmount = totalAmount + totalPrice;
          }
          addProducts('', '', '', '', '', '', "Total Amount",
              totalAmount.toString(), grid);
        }
      } else if (type == '2') {
        if (productDate
            .isAfter(DateTime.now().subtract(const Duration(days: 7)))) {
          index++;
          addProducts(index.toString(), dateConveter(productDate), canteen,
              orderCount.toString(), '', '', '', '', grid);
          final deliverProductdata = await dataserver
              .collection('DeliveredList')
              .doc(element['docId'])
              .collection('productsDetails')
              .get();
          final deliveryProductList = deliverProductdata.docs
              .map((e) => AllProductDetailModel.fromMap(e.data()))
              .toList();
          int totalAmount = 0;
          for (AllProductDetailModel productData in deliveryProductList) {
            int totalPrice = productData.outPrice * productData.quantityinStock;
            addProducts(
                '',
                '',
                '',
                '',
                productData.productname,
                productData.quantityinStock.toString(),
                productData.outPrice.toString(),
                totalPrice.toString(),
                grid);
            totalAmount = totalAmount + totalPrice;
          }
          addProducts('', '', '', '', '', '', "Total Amount",
              totalAmount.toString(), grid);
        }
      } else if (type == '3') {
        if (productDate
            .isAfter(DateTime.now().subtract(const Duration(days: 30)))) {
          index++;
          addProducts(index.toString(), dateConveter(productDate), canteen,
              orderCount.toString(), '', '', '', '', grid);
          final deliverProductdata = await dataserver
              .collection('DeliveredList')
              .doc(element['docId'])
              .collection('productsDetails')
              .get();
          final deliveryProductList = deliverProductdata.docs
              .map((e) => AllProductDetailModel.fromMap(e.data()))
              .toList();
          int totalAmount = 0;
          for (AllProductDetailModel productData in deliveryProductList) {
            int totalPrice = productData.outPrice * productData.quantityinStock;
            addProducts(
                '',
                '',
                '',
                '',
                productData.productname,
                productData.quantityinStock.toString(),
                productData.outPrice.toString(),
                totalPrice.toString(),
                grid);
            totalAmount = totalAmount + totalPrice;
          }
          addProducts('', '', '', '', '', '', "Total Amount",
              totalAmount.toString(), grid);
        }
      } else if (type == '4') {
        if (productDate.isAfter(startTime!) && productDate.isBefore(endTime!) ||
            productDate.isAtSameMomentAs(startTime) ||
            productDate.isAtSameMomentAs(endTime!)) {
          index++;
          addProducts(index.toString(), dateConveter(productDate), canteen,
              orderCount.toString(), '', '', '', '', grid);
          final deliverProductdata = await dataserver
              .collection('DeliveredList')
              .doc(element['docId'])
              .collection('productsDetails')
              .get();
          final deliveryProductList = deliverProductdata.docs
              .map((e) => AllProductDetailModel.fromMap(e.data()))
              .toList();
          int totalAmount = 0;
          for (AllProductDetailModel productData in deliveryProductList) {
            int totalPrice = productData.outPrice * productData.quantityinStock;
            addProducts(
                '',
                '',
                '',
                '',
                productData.productname,
                productData.quantityinStock.toString(),
                productData.outPrice.toString(),
                totalPrice.toString(),
                grid);
            totalAmount = totalAmount + totalPrice;
          }
          addProducts('', '', '', '', '', '', "Total Amount",
              totalAmount.toString(), grid);
        }
      }
    }

    final PdfLayoutResult result = drawHeader(page, pageSize, grid);
    //Draw grid
    drawGrid(page, grid, result);

    final List<int> bytes = await document.save();

    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", "output.pdf")
      ..click();

    document.dispose();
  }

  PdfLayoutResult drawHeader(
    PdfPage page,
    Size pageSize,
    PdfGrid grid,
  ) {
    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
    //final PdfFont headingFont = PdfStandardFont(PdfFontFamily.timesRoman, 10);

    const String invoiceNumber = 'Date:18-Jan-24\r\n \r\n';
    final Size contentSize = contentFont.measureString(invoiceNumber);

    String address =
        '''Challan No. JUMERASH\r\n\r\n Ref No.IN3402601\r\n\r\n ''';

    String heading =
        '''AL BUSTAN BAKERY & SWEETS LLC\r\n\r\n         Al Qusais Industrial Area 3\r\n\r\n                 Emiates Dubai\r\n\r\n''';
    // String secondHeading =
    //     '''                MATERIAL OUT                \r\n\r\n Canteen:    Ittilhad Private School-Mamzar\r\n\r\n Emiates:                 Dubai\r\n\r\nCountry:                 UAE\r\n\r\n''';

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
          8,
        ),
        bounds: Rect.fromLTWH(
            quantityCellBounds!.left - 120,
            result.bounds.bottom + 380,
            quantityCellBounds!.width + 150,
            quantityCellBounds!.height));

    page.graphics.drawString(
        'Authorised Signatory\n',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          6.5,
        ),
        bounds: Rect.fromLTWH(
            quantityCellBounds!.left - 120,
            result.bounds.bottom + 410,
            quantityCellBounds!.width + 150,
            quantityCellBounds!.height));
  }

  PdfGrid getGrid() {
    //Create a PDF grid
    final PdfGrid grid = PdfGrid();
    grid.columns.add(count: 9);

    final PdfGridRow headerRow = grid.headers.add(2)[0];

// Set style
    headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
    headerRow.style.textBrush = PdfBrushes.white;

// Set values for the "S.no" column
    headerRow.cells[0].value = 'Sl.No';
    headerRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[1].value = 'Canteen Name';
    headerRow.cells[1].stringFormat.alignment = PdfTextAlignment.center;
    // headerRow.cells[2].value = 'Size';
    headerRow.cells[2].value = 'Count';
    headerRow.cells[2].stringFormat.alignment = PdfTextAlignment.center;

// Create the first cell of the second row and set its value
    final PdfGridCell productCell = headerRow.cells[3];
    headerRow.cells[3].stringFormat.alignment = PdfTextAlignment.center;

    productCell.value = 'Details';
    productCell.columnSpan = 4;
/////////////////////////////////////Wareh

    //Add rows
    addProducts('', '', '', '', 'Product Name', 'Quantity', 'Price/Qty',
        'Amount', grid);

    //Apply the table built-in style
    grid.applyBuiltInStyle(PdfGridBuiltInStyle.gridTable1Light);
    //Set gird columns width
    grid.columns[0].width = 30;
    grid.columns[1].width = 150;
    grid.columns[2].width = 35;
    grid.columns[3].width = 60;
    grid.columns[4].width = 60;
    grid.columns[5].width = 60;
    grid.columns[6].width = 60;

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
      String date,
      String canteenName,
      String count,
      String productName,
      String quantity,
      String price,
      String total,
      PdfGrid grid) {
    final PdfGridRow row = grid.rows.add();
    row.cells[0].value = sno;
    row.cells[1].value = canteenName;
    row.cells[2].value = count;
    row.cells[3].value = productName;
    row.cells[4].value = quantity;
    row.cells[5].value = price;
    row.cells[6].value = total;
  }

//Get the total amount.
}
