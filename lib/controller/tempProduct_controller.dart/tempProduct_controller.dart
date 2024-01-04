import 'package:canteen_superadmin_website/model/category_model.dart';
import 'package:canteen_superadmin_website/model/packagetype_model.dart';
import 'package:canteen_superadmin_website/model/return_model.dart';
import 'package:canteen_superadmin_website/view/constant/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TempProductController extends GetxController {
  final fireStore = FirebaseFirestore.instance;

  TextEditingController productNameCtr = TextEditingController();
  TextEditingController unitCtr = TextEditingController();
  TextEditingController companyNameCtr = TextEditingController();
  TextEditingController quantityCtr = TextEditingController();
  TextEditingController barcodeCtr = TextEditingController();

  List<PackageTypeModel> packageTypeModel = [];
  RxString packageTypeName = ''.obs;
  RxString packageTypeID = ''.obs;
  List<ProductCategoryModel> productCategoryModel = [];
  RxString productCategoryName = ''.obs;
  RxString productCategoryID = ''.obs;
  List<ReturnTypeModel> returnTypeModel = [];
  RxString returnTypeID = ''.obs;
  RxString returnTypeName = ''.obs;
  Future<List<PackageTypeModel>> fetchPackagetypeModel() async {
    final firebase = await FirebaseFirestore.instance
        .collection('PackageTypeCollection')
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => PackageTypeModel.fromMap(e.data())).toList();
      packageTypeModel.add(list[i]);
    }
    return packageTypeModel;
  }

  Future<List<ProductCategoryModel>> fetchProductCategoryModel() async {
    final firebase =
        await FirebaseFirestore.instance.collection('ProductCategory').get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs
          .map((e) => ProductCategoryModel.fromMap(e.data()))
          .toList();
      productCategoryModel.add(list[i]);
    }
    return productCategoryModel;
  }

  Future<List<ReturnTypeModel>> fetchReturntypeModel() async {
    final firebase = await FirebaseFirestore.instance
        .collection('ReturnTypeCollection')
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => ReturnTypeModel.fromMap(e.data())).toList();
      returnTypeModel.add(list[i]);
    }
    return returnTypeModel;
  }

  TextEditingController inPriceCtr = TextEditingController();
  TextEditingController outPriceCtr = TextEditingController();

  RxBool barcodebool = false.obs;
  RxBool productnamebool = false.obs;
  RxBool categorybool = false.obs;
  RxBool unitbool = false.obs;
  RxBool brandbool = false.obs;
  RxBool qtybool = false.obs;
  RxBool packagetypebool = false.obs;
  RxBool inPricebool = false.obs;
  RxBool outPriceool = false.obs;

  barcodeEdit(String text, String docId) async {
    final data = {'barcodeNumber': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data).then((value) {
      showToast(msg: "Barcode changed");
      Get.back();
    });
    
  }

  productNameEdit(String text, String docId) async {
    final data = {'productname': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data);
    showToast(msg: "Product name changed");
    await fireStore
        .collection('temporaryCollection')
        .doc(docId)
        .update(data)
        .then((value) {
      Get.back();
      showToast(msg: "Product name changed");
    });
  }

  productCategoryEdit(String text, String categoryId, String docId) async {
    final data = {'categoryName': text, 'categoryID': categoryId};

    await fireStore
        .collection('temporaryCollection')
        .doc(docId)
        .update(data)
        .then((value) {
      showToast(msg: "Product category changed");
      Get.back();
    });
  }

  productInPriceEdit(String text, String docId) async {
    final data = {'inPrice': text};

    await fireStore
        .collection('temporaryCollection')
        .doc(docId)
        .update(data)
        .then((value) {
      showToast(msg: "In price changed");
      Get.back();
    });
  }

  productOutPriceEdit(String text, String docId) async {
    final data = {'outPrice': text};

    await fireStore
        .collection('temporaryCollection')
        .doc(docId)
        .update(data)
        .then((value) {
      showToast(msg: "Out price changed");
      Get.back();
    });
  }

  unitEdit(String text, String docId) async {
    final data = {'unit': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data);
    showToast(msg: "unit changed");
    await fireStore
        .collection('temporaryCollection')
        .doc(docId)
        .update(data)
        .then((value) {
      Get.back();
      showToast(msg: "Unit changed");
      unitCtr.clear();
    });
  }

  companyNameEdit(String text, String docId) async {
    final data = {'companyName': text};

    await fireStore
        .collection('temporaryCollection')
        .doc(docId)
        .update(data)
        .then((value) {
      Get.back();
      showToast(msg: "Brand name changed");
    });
  }

  packageTypeEdit(String text, String docId) async {
    final data = {'packageType': text,};

    await fireStore
        .collection('temporaryCollection')
        .doc(docId)
        .update(data)
        .then((value) {
      showToast(msg: "PackageType changed");
      Get.back();
    });
  }

  quantityEdit(String text, String docId) async {
    final data = {'quantityinStock': text};

    await fireStore
        .collection('temporaryCollection')
        .doc(docId)
        .update(data)
        .then((value) {
      Get.back();
      showToast(msg: "Quantity changed");
    });
  }

  deleteTemProduct(String docId, BuildContext context) async {
    await fireStore.collection('temporaryCollection').doc(docId).delete();
    showToast(msg: "Product deleted");
    Navigator.pop(context);
  }
}
