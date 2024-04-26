import 'dart:convert';
import 'dart:html';

import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class DeliveryPrintController extends GetxController {
  Future<void> generateInvoice(
      {required BuildContext context,
      required deliveryData,
      required String collectionPath}) async {
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

    int index = 0;
    int totalAmount = 0;
    final deliveryProductData = await dataserver
        .collection(collectionPath)
        .doc(deliveryData['docId'])
        .collection('productsDetails')
        .orderBy('addedDate')
        .get();

    for (var element in deliveryProductData.docs) {
      index++;
      // String date = element['addedDate'];
      // final productDate = DateTime.parse(date);
      int amount = element['outPrice'] * element['quantityinStock'];
      totalAmount = totalAmount + amount;
      addProducts(
          index.toString(),
          dateConveter(DateTime.parse(deliveryData['time'])),
          element['productname'],
          element['outPrice'].toString(),
          element['quantityinStock'].toString(),
          amount.toString(),
          grid);
    }

    addProducts('', '', '', '', '', totalAmount.toString(), grid);

    final PdfLayoutResult result = drawHeader(
      page,
      pageSize,
      grid,
      deliveryData['canteenName'],
      deliveryData['orderId'],
    );
    //Draw grid
    drawGrid(page, grid, result, totalAmount.toString());

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
    String canteenName,
    String deliveryId,
  ) {
    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
    //final PdfFont headingFont = PdfStandardFont(PdfFontFamily.timesRoman, 10);

    String invoiceNumber = 'Date : ${dateConveter(DateTime.now())}\r\n \r\n';
    final Size contentSize = contentFont.measureString(invoiceNumber);

    String address =
        '''Challan No. JUMERASH\r\n\r\n Ref No.$deliveryId\r\n\r\n ''';

    String heading =
        '''AL BUSTAN BAKERY & SWEETS LLC\r\n\r\n         Al Qusais Industrial Area 3\r\n\r\n                 Emiates Dubai\r\n\r\n''';
    String secondHeading =
        '''                MATERIAL OUT                \r\n\r\n Canteen:   $canteenName''';
    // \r\n\r\n Emiates:                 Dubai\r\n\r\nCountry:                 UAE\r\n\r\n''';

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
  void drawGrid(
      PdfPage page, PdfGrid grid, PdfLayoutResult result, String totalAmount) {
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

    //Draw grand total.
    page.graphics.drawString('Total Price  : \n',
        PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(
            quantityCellBounds!.left,
            result.bounds.bottom + 10,
            quantityCellBounds!.width,
            quantityCellBounds!.height));
    page.graphics.drawString(
        '$totalAmount /-', //
        PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(
            totalPriceCellBounds!.left,
            result.bounds.bottom + 10,
            totalPriceCellBounds!.width,
            totalPriceCellBounds!.height));

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


//Create PDF grid and return
  PdfGrid getGrid() {
    //Create a PDF grid
    final PdfGrid grid = PdfGrid();
    grid.columns.add(count: 6);

    final PdfGridRow headerRow = grid.headers.add(2)[0];

    headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
    headerRow.style.textBrush = PdfBrushes.white;
    headerRow.cells[0].value = 'Sl.No';
    headerRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[1].value = 'Product Name';
    headerRow.cells[1].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[2].value = 'Price per Qty';
    headerRow.cells[2].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[3].value = 'Quantity';
    headerRow.cells[3].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[4].value = 'Amount';
    headerRow.cells[4].stringFormat.alignment = PdfTextAlignment.center;

    grid.applyBuiltInStyle(PdfGridBuiltInStyle.gridTable1Light);
    grid.columns[0].width = 70;
    grid.columns[1].width = 170;
    grid.columns[2].width = 70;
    grid.columns[3].width = 70;
    grid.columns[4].width = 70;

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
  void addProducts(String sno, String date, String productName, String price,
      String quantity, String amount, PdfGrid grid) {
    final PdfGridRow row = grid.rows.add();
    row.cells[0].value = sno;
    row.cells[1].value = productName;
    row.cells[2].value = price;
    row.cells[3].value = quantity;
    row.cells[4].value = amount;
  }
}
