import 'package:canteen_superadmin_website/view/constant/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class StoreController extends GetxController {
  final fireStore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getProductDataFromDB() {
    final data = fireStore.collection('AllProduct').snapshots();
    return data;
  }

  addCategory(String category, BuildContext context) async {
    final uuid = const Uuid().v1();
    String docName = category + uuid;

    final data = {"docid": docName, "categoryName": category};
    fireStore
        .collection("ProductCategory")
        .doc(docName)
        .set(data)
        .then((value) {
      showToast(msg: "Category Add");
      Navigator.pop(context);
    });
  }
}
