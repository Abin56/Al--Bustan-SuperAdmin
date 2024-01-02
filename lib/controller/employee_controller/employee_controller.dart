import 'package:canteen_superadmin_website/model/employe_createprofile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class EmployeeController extends GetxController {
  RxString employeeUID = ''.obs;
  List<EmployeeProfileCreateModel> employeeList = [];
  Future<List<EmployeeProfileCreateModel>> fetchRecCategory() async {
    final firebase =
        await FirebaseFirestore.instance.collection('EmployeeProfile').get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs
          .map((e) => EmployeeProfileCreateModel.fromMap(e.data()))
          .toList();
      employeeList.add(list[i]);
    }

    return employeeList;
  }
}
