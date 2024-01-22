import 'package:canteen_superadmin_website/core/core.dart';
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
}
