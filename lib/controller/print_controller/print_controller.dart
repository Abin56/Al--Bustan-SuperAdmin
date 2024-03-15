import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:canteen_superadmin_website/model/delivery_model.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivered_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:usb_thermal_printer_web/usb_thermal_printer_web.dart';

class WebPrinter extends StatefulWidget {
  const WebPrinter({super.key});

  @override
  State<WebPrinter> createState() => _WebPrinterState();
}

WebThermalPrinter _printer = WebThermalPrinter();

printReceipt(String docId) async {
  print(
      'Printer Start >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
  //Pairing Device is required.
  await _printer.pairDevice(vendorId: 0x0FE6, productId: 0x811E);

  await _printer.printText('Al Bustan', bold: true, centerAlign: true);
  await _printer.printEmptyLine();

  await _printer.printRow("Delivery", "Report");
  await _printer.printEmptyLine();

  final productData = await dataserver
      .collection('DeliveredList')
      .doc(docId)
      .collection('productsDetails')
      .get();
  final productList = productData.docs
      .map((e) => AllProductDetailModel.fromMap(e.data()))
      .toList();

  for (int i = 0; i < 10; i++) {
    await _printer.printRow('   Product Name      Company Name      ',
        'Order count     Price      Total');

    for (AllProductDetailModel element in productList) {
      int totalAmount = element.quantityinStock * element.outPrice;
      // await _printer.printRow('Test Item ${i + 1}', '${(i + 1) * 510}.00 AED');
      await _printer.printRow(
          '   ${element.productname}      ${element.companyName}      ',
          '${element.quantityinStock}     ${element.outPrice}      $totalAmount');
    }

    await _printer.printEmptyLine();
  }

  await _printer.printDottedLine();
  await _printer.printEmptyLine();

  await _printer.printBarcode('');
  await _printer.printEmptyLine();

  await _printer.printEmptyLine();
  await _printer.closePrinter();
}

class _WebPrinterState extends State<WebPrinter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
