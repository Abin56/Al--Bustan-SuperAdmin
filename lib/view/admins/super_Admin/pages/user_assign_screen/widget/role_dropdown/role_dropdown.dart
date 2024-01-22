import 'package:canteen_superadmin_website/controller/user_controller/user_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/model/user_role/user_role.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserRoleDropDown extends StatelessWidget {
  const UserRoleDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration:
          BoxDecoration(border: Border.all(color: cGrey.withOpacity(0.2))),
      child: Center(
        child: DropdownSearch<UserRoleModel>(
          autoValidateMode: AutovalidateMode.always,
          asyncItems: (value) {
            Get.find<UserController>().userRoleList.clear();

            return Get.find<UserController>().fetchUserRoles();
          },
          itemAsString: (value) => value.name,
          onChanged: (value) async {
            if (value != null) {
              Get.find<UserController>().userRoleValue.value = value.value;
            }
          },
          dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: GoogleFonts.poppins(
                  fontSize: 13, color: Colors.black.withOpacity(0.7))),
        ),
      ),
    );
  }
}
