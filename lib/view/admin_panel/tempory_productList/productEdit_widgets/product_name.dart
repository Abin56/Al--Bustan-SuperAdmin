import 'package:canteen_superadmin_website/controller/tempProduct_controller.dart/tempProduct_controller.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/admin_panel/tempory_productList/textformFiled_widget/textFormFiled_.dart';
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
          SizedBox(
            height: 30,
            width: 200,
            child: TextFormFiledWidget(
                controller: getTemp.productNameCtr,
                hintText: "Product Name",
                title: 'Product Name',
                width: 200),
          ),
          GestureDetector(
            onTap: () {
              getTemp.productNameEdit(
                  getTemp.productNameCtr.text, data['docId']);
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
