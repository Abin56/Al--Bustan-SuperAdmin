import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:get/get.dart';
import 'dart:html';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_pdf/pdf.dart';

//Local imports

class PurchaseReportController extends GetxController {
  Future<void> generateInvoice(context) async {
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

    final Uint8List imageData =
        await _getImageData('web_images/AL - Bustan.png');
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

    final storeData = await dataserver.collection('AvailableProducts').get();

    final storeList = storeData.docs
        .map((e) => AllProductDetailModel.fromMap(e.data()))
        .toList();
    int index = 0;

    for (AllProductDetailModel productData in storeList) {
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

    //Draw the header section by creating text element
    final PdfLayoutResult result = drawHeader(page, pageSize, grid, imageData);
    //Draw grid
    drawGrid(page, grid, result);
    //Add invoice footer
    // drawFooter(page, pageSize);
    //Save the PDF document
    final List<int> bytes = document.saveSync();
    page.graphics.drawImage(
      PdfBitmap(imageData),
      const Rect.fromLTWH(10, 10, 80, 80),
    );

    //Save and launch the file.
    await saveAndLaunchFile(bytes, 'Invoice.pdf');

// Dispose the document.
    document.dispose();

    // Draw the image on the PDF page
    page.graphics.drawImage(
      PdfBitmap(imageData),
      const Rect.fromLTWH(10, 10, 80, 80),
    );

    //Save and launch the file.
    await saveAndLaunchFile(bytes, 'Invoice.pdf');
  }

  Future<Uint8List> _getImageData(String imagePath) async {
    ByteData data = await rootBundle.load(imagePath);
    return data.buffer.asUint8List();
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    final blob = Blob([Uint8List.fromList(bytes)]);
    final url = Url.createObjectUrlFromBlob(blob);
    AnchorElement(href: url)
      ..target = 'webbrowser'
      ..download = fileName
      ..click();
    Url.revokeObjectUrl(url);
  }

//Draws the invoice header
  PdfLayoutResult drawHeader(
      PdfPage page, Size pageSize, PdfGrid grid, Uint8List imageData) {
    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
    //final PdfFont headingFont = PdfStandardFont(PdfFontFamily.timesRoman, 10);

    const String invoiceNumber = 'Date:18-Jan-24\r\n \r\n';
    final Size contentSize = contentFont.measureString(invoiceNumber);

    String address =
        '''Challan No. JUMERASH\r\n\r\n Ref No.IN3402601\r\n\r\n ''';

    String heading =
        '''AL BUSTAN BAKERY & SWEETS LLC\r\n\r\n         Al Qusais Industrial Area 3\r\n\r\n                 Emiates Dubai\r\n\r\n''';
    String secondHeading =
        '''                MATERIAL OUT                \r\n\r\n Canteen:    Ittilhad Private School-Mamzar\r\n\r\n Emiates:                 Dubai\r\n\r\nCountry:                 UAE\r\n\r\n''';

    page.graphics.drawImage(
      PdfBitmap(imageData),
      const Rect.fromLTWH(40, 40, 50, 50),
    );

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

    //Draw grand total.
    page.graphics.drawString('Total Price\n',
        PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(
            quantityCellBounds!.left,
            result.bounds.bottom + 10,
            quantityCellBounds!.width,
            quantityCellBounds!.height));
    page.graphics.drawString(
        '123451234 /-', //
        PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(
            totalPriceCellBounds!.left,
            result.bounds.bottom + 10,
            totalPriceCellBounds!.width,
            totalPriceCellBounds!.height));
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
    headerRow.cells[1].value = 'Date';
    headerRow.cells[2].value = 'Product Name';
    headerRow.cells[3].value = 'Supplier Name';

// Create the first cell of the second row and set its value
    final PdfGridCell productCell = headerRow.cells[4];
    headerRow.cells[1].stringFormat.alignment = PdfTextAlignment.center;

    productCell.value = 'Quantity';
    // productCell.columnSpan = 1;
/////////////////////////////////////Wareh
    final PdfGridCell warehouse = headerRow.cells[5];
    headerRow.cells[1].stringFormat.alignment = PdfTextAlignment.center;

    warehouse.value = 'In Price';
    // warehouse.columnSpan = 1;

    /////////////////////////////////////Wareh
    final PdfGridCell outerwarehouse = headerRow.cells[6];

    outerwarehouse.value = 'Out Prince';

    //Apply the table built-in style
    grid.applyBuiltInStyle(PdfGridBuiltInStyle.gridTable1Light);
    //Set gird columns width
    grid.columns[0].width = 30;
    grid.columns[1].width = 70;
    grid.columns[2].width = 105;
    grid.columns[3].width = 100;
    grid.columns[4].width = 70;
    grid.columns[5].width = 70;
    grid.columns[6].width = 70;

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
    row.cells[1].value = date;
    row.cells[2].value = productName;
    row.cells[3].value = supplierName;
    row.cells[4].value = quantity;
    row.cells[5].value = inPrice;
    row.cells[6].value = outPrince;
  }

//Get the total amount.
}
