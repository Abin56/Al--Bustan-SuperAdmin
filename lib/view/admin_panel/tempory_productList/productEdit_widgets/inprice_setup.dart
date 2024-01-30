import 'package:canteen_superadmin_website/controller/tempProduct_controller.dart/tempProduct_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:canteen_superadmin_website/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InPriceSetupWidget extends StatelessWidget {
  InPriceSetupWidget({
    super.key,
    required this.data,
  });

  final getTemp = Get.put(TempProductController());
  final DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getTemp.inPriceCtr.clear();
        customShowDilogBox(
            context: context,
            title: 'In Price',
            children: [
              TextFormFiledContainerWidget(
                  controller: getTemp.inPriceCtr,
                  hintText: 'In Price',
                  title: 'In Price',
                  width: 200)
            ],
            actiontext: 'UPDATE',
            actiononTapfuction: () async {
              getTemp.productInPriceEdit(
                  getTemp.inPriceCtr.text, data['docId']);
            },
            doyouwantActionButton: true);
      },
      child: SizedBox(
        height: 48,
        width: 100,
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
                  text: "Set",
                  fontsize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
