import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:flutter/material.dart';

class BarcodeSetup extends StatelessWidget {
  final int index;
  const BarcodeSetup({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? Colors.grey.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
          border: Border.all(color: cGrey.withOpacity(0.2))),
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 80,
            decoration: const BoxDecoration(
              color: themeColorBlue,
              borderRadius: BorderRadius.horizontal(),
            ),
            height: 25,
            child: Center(
              child: GooglePoppinsWidgets(
                textAlign: TextAlign.center,
                color: cWhite,
                fontWeight: FontWeight.bold,
                text: "Type",
                fontsize: 10,
              ),
            ),
          ),
          Container(
            width: 85,
            decoration: const BoxDecoration(
              color: themeColorBlue,
              borderRadius: BorderRadius.horizontal(),
            ),
            height: 25,
            child: Center(
              child: GooglePoppinsWidgets(
                textAlign: TextAlign.center,
                color: cWhite,
                fontWeight: FontWeight.bold,
                text: "Auto Genrate",
                fontsize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
