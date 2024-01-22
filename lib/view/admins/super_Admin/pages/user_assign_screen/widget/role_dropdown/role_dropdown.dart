// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:canteen_superadmin_website/model/user_model/user_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:canteen_superadmin_website/controller/user_controller/user_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/model/user_role/user_role.dart';

class UserRoleDropDown extends StatelessWidget {
  final UserModel datalist;
  const UserRoleDropDown({
    Key? key,
    required this.datalist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              dataserver
                  .collection('AllUsersCollection')
                  .doc(datalist.docid)
                  .update({
                'userrole': Get.find<UserController>().userRoleValue.value =
                    value.value
              });
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
