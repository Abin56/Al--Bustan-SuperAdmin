import 'package:canteen_superadmin_website/controller/tempProduct_controller.dart/tempProduct_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:canteen_superadmin_website/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarcodeSetup extends StatelessWidget {
  final int index;
  BarcodeSetup({
    Key? key,
    required this.index,
    required this.data,
  }) : super(key: key);

  final getTemp = Get.put(TempProductController());
  final DocumentSnapshot data;

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
          GestureDetector(
            onTap: () {
              customShowDilogBox(
                  context: context,
                  title: "Barcode",
                  children: [
                    TextFormFiledContainerWidget(
                      hintText: 'Barcode',
                      title: 'Barcode',
                      width: 200,
                      controller: getTemp.barcodeCtr,
                    )
                  ],
                  actiononTapfuction: () {
                    getTemp.barcodeEdit(
                        getTemp.barcodeCtr.text.trim(), data['docId']);
                  },
                  doyouwantActionButton: true);
            },
            child: Container(
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
          ),
          GestureDetector(
            onTap: () {
              String barcode = getRandomString(20);
              getTemp.barcodeEdit(barcode, data['docId']);
            },
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
