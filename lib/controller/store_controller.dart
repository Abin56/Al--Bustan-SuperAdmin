import 'package:canteen_superadmin_website/model/category_model.dart';
import 'package:canteen_superadmin_website/view/constant/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class StoreController extends GetxController {
  final fireStore = FirebaseFirestore.instance;
  RxString recCatDocID = ''.obs;
  RxString recCatName = ''.obs;
  List<ProductCategoryModel> productCatList = [];

  Future<List<ProductCategoryModel>> fetchProductCategory() async {
    final firebase =
        await FirebaseFirestore.instance.collection('ProductCategory').get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs
          .map((e) => ProductCategoryModel.fromMap(e.data()))
          .toList();
      productCatList.add(list[i]);
    }

    return productCatList;
  }

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
