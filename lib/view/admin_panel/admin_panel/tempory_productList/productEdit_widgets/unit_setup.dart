import 'package:canteen_superadmin_website/controller/tempProduct_controller.dart/tempProduct_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:canteen_superadmin_website/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnitNameEditWidget extends StatelessWidget {
  UnitNameEditWidget({super.key, required this.data});

  final getTemp = Get.put(TempProductController());
  final DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    getTemp.unitCtr.clear();

    return SizedBox(
      height: 48,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              getTemp.unitCtr.text = data['unit'];
              customShowDilogBox(
                  context: context,
                  title: 'UNIT',
                  children: [
                    TextFormFiledContainerWidget(
                        controller: getTemp.unitCtr,
                        hintText: 'UNIT',
                        title: 'UNIT',
                        width: 200)
                  ],
                  actiontext: 'UPDATE',
                  actiononTapfuction: () async {
                    getTemp.unitEdit(getTemp.unitCtr.text, data['docId']);
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
