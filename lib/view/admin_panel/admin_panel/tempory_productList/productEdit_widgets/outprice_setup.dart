import 'package:canteen_superadmin_website/controller/tempProduct_controller.dart/tempProduct_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:canteen_superadmin_website/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutPriceSetupWidget extends StatelessWidget {
  OutPriceSetupWidget({
    super.key,
    required this.data,
  });

  final getTemp = Get.put(TempProductController());
  final DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getTemp.outPriceCtr.clear();
        customShowDilogBox(
            context: context,
            title: 'Out Price',
            children: [
              TextFormFiledContainerWidget(
                  controller: getTemp.outPriceCtr,
                  hintText: 'Out Price',
                  title: 'Out Price',
                  width: 200)
            ],
            actiontext: 'UPDATE',
            actiononTapfuction: () async {
              getTemp.productOutPriceEdit(
                  getTemp.outPriceCtr.text, data['docId']);
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
