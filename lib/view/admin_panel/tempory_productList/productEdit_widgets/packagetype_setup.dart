import 'package:canteen_superadmin_website/controller/tempProduct_controller.dart/tempProduct_controller.dart';
import 'package:canteen_superadmin_website/model/packagetype_model.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageSetUpWidget extends StatelessWidget {
  final TempProductController tempProductController =
      Get.put(TempProductController());
  final int index;
  final data;
  PackageSetUpWidget({
    Key? key,
    required this.index,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? Colors.grey.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
          border: Border.all(color: cGrey.withOpacity(0.2))),
      child: Center(
          child: DropdownSearch<PackageTypeModel>(
        autoValidateMode: AutovalidateMode.always,
        asyncItems: (value) {
          tempProductController.packageTypeModel.clear();

          return tempProductController.fetchPackagetypeModel();
        },
        itemAsString: (value) => value.typevalue,
        onChanged: (value) async {
          if (value != null) {
            tempProductController.packageTypeName.value = value.typevalue;
            tempProductController.packageTypeID.value = value.docid;

            tempProductController.packageTypeEdit(
                value.typevalue, data['docId']);
          }
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}
