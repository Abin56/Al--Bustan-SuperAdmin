import 'package:canteen_superadmin_website/model/category_model.dart';
import 'package:canteen_superadmin_website/model/product_model.dart';
import 'package:canteen_superadmin_website/model/product_request_model.dart';
import 'package:canteen_superadmin_website/view/constant/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class StoreController extends GetxController {
  final fireStore = FirebaseFirestore.instance;
  RxString productCategoryName = ''.obs;
  RxString productName = ''.obs;
  List<ProductCategoryModel> productCatList = [];

  List<DocumentSnapshot> tempProductList = [];

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

  addStoreRequest(
      {required String employeeId,
      required String productName,
      required String productId,
      required int quantity,
      required bool pending,
      required String category,
      required String employeeName,
      required BuildContext context}) {
    final uuid = const Uuid().v1();
    final time = DateTime.now();
    final data = ProductRequestModel(
        productName: productName,
        productId: productId,
        quantity: quantity,
        pending: pending,
        docId: uuid,
        category: category,
        time: time.toString(),
        employeeName: employeeName,
        employeeId: employeeId);
    fireStore
        .collection('EmployeeProfile')
        .doc(employeeId)
        .collection('storeRequest')
        .doc(uuid)
        .set(data.toMap())
        .then((value) {
      showToast(msg: "Request Added");
      Navigator.pop(context);
    });
  }

  Stream<QuerySnapshot> getProductTempData() {
    final data = fireStore.collection('temporaryCollection').snapshots();
    return data;
  }

  addTempProductToDB(List<DocumentSnapshot> dataList) {
    for (int i = 0; i < dataList.length; i++) {
      final data = ProductAddingModel.fromMap(dataList[i]);
      fireStore
          .collection('AllProduct')
          .doc(data.barcodeNumber)
          .set(data.toMap());
    }
  }
}
