import 'package:canteen_superadmin_website/controller/tempProduct_controller.dart/tempProduct_controller.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:canteen_superadmin_website/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QTYEditWidget extends StatelessWidget {
  QTYEditWidget({
    super.key,
    required this.data,
  });

  final getTemp = Get.put(TempProductController());
  final DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              getTemp.quantityCtr.clear();
              customShowDilogBox(
                  context: context,
                  title: 'Quantity',
                  children: [
                    TextFormFiledContainerWidget(
                        controller: getTemp.quantityCtr,
                        hintText: 'Quantity',
                        title: 'Quantity',
                        width: 200)
                  ],
                  actiontext: 'UPDATE',
                  actiononTapfuction: () async {
                    getTemp.quantityEdit(
                        getTemp.quantityCtr.text, data['docId']);
                  },
                  doyouwantActionButton: true);
            },
            child: Container(
              width: 50,
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
          ),
        ],
      ),
    );
  }
}
