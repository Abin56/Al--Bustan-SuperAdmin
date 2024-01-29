import 'dart:developer';

import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/model/user_model/user_model.dart';
import 'package:canteen_superadmin_website/model/user_role/user_role.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  List<UserRoleModel> userRoleList = [];
  RxString userRoleValue = ''.obs;

  Future<List<UserRoleModel>> fetchUserRoles() async {
    final firebase = await dataserver.collection('UserRole').get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => UserRoleModel.fromMap(e.data())).toList();
      userRoleList.add(list[i]);
    }
    return userRoleList;
  }

  Future<void> updateUserRole(UserModel datalist) async {
    try {
      await dataserver
          .collection('AllUsersCollection')
          .doc(datalist.docid)
          .update({'userrole': ''});
    } catch (e) {
      log(e.toString());
    }
  }
   Future<void> updateUserAccess(UserModel datalist,bool bool) async {
    try {
      await dataserver
          .collection('AllUsersCollection')
          .doc(datalist.docid)
          .update({'activate': bool});
    } catch (e) {
      log(e.toString());
    }
  }
}
