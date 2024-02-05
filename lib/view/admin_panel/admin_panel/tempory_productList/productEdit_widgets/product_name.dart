import 'package:canteen_superadmin_website/controller/tempProduct_controller.dart/tempProduct_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:canteen_superadmin_website/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductNameEditWidget extends StatelessWidget {
  ProductNameEditWidget({
    super.key,
    required this.data,
  });

  final getTemp = Get.put(TempProductController());

  final data;
  @override
  Widget build(BuildContext context) {
    getTemp.productNameCtr.clear();
    return SizedBox(
      height: 48,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              getTemp.companyNameCtr.clear();
              customShowDilogBox(
                  context: context,
                  title: 'Product Name',
                  children: [
                    TextFormFiledContainerWidget(
                        controller: getTemp.productNameCtr,
                        hintText: 'Product Name',
                        title: 'Procuct Name',
                        width: 200)
                  ],
                  actiontext: 'UPDATE',
                  actiononTapfuction: () async {
                    getTemp.productNameEdit(
                        getTemp.productNameCtr.text, data['docId']);
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
