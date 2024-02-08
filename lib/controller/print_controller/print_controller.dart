// import 'package:flutter/material.dart';
// import 'package:usb_thermal_printer_web/usb_thermal_printer_web.dart';

// class WebPrinter extends StatefulWidget {
//   const WebPrinter({super.key});

//   @override
//   State<WebPrinter> createState() => _WebPrinterState();
// }

// WebThermalPrinter _printer = WebThermalPrinter();

// printReceipt()
// async
// {
  
//   //Pairing Device is required.
//   await _printer.pairDevice(vendorId: 0x0FE6, productId: 0x811E);
  
//   await _printer.printText('Al Bustan',
//       bold: true, centerAlign: true);
//   await _printer.printEmptyLine();
  
//   await _printer.printRow("Products", "Sale");
//   await _printer.printEmptyLine();
  
//   for (int i = 0; i < 10; i++) {
    
//     await _printer.printRow('Test Item ${i + 1}',
//         '${(i + 1) * 510}.00 AED');
//     await _printer.printEmptyLine();
    
//   }
  
//   await _printer.printDottedLine();
//   await _printer.printEmptyLine();
  
//   await _printer.printBarcode('123456');
//   await _printer.printEmptyLine();
  
//   await _printer.printEmptyLine();
//   await _printer.closePrinter();
// }


// class _WebPrinterState extends State<WebPrinter> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(),
//     );
//   }
// }