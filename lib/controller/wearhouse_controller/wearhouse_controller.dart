import 'package:canteen_superadmin_website/core/constant/const.dart';
import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:canteen_superadmin_website/model/canteen_model.dart';
import 'package:canteen_superadmin_website/model/category_model.dart';
import 'package:canteen_superadmin_website/model/packagetype_model.dart';
import 'package:canteen_superadmin_website/model/quantity_model.dart';
import 'package:canteen_superadmin_website/model/subcategory_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class WearHouseController extends GetxController {
  List<ProductCategoryModel> productCategoryList = [];
  List<ProductSubcategoryModel> productSubCategoryList = [];
  List<UnitCategoryModel> unitCategoryList = [];
  List<PackageTypeModel> packageTypeList = [];
  List<CanteenModel> canteenList = [];
  RxString productCategoryName = ''.obs;
  RxString productCategoryID = ''.obs;
  RxBool isLoading = false.obs;

  Future<List<ProductCategoryModel>> fetchProductCategoryModel() async {
    final firebase =
        await FirebaseFirestore.instance.collection('ProductCategory').get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs
          .map((e) => ProductCategoryModel.fromMap(e.data()))
          .toList();
      productCategoryList.add(list[i]);
    }
    return productCategoryList;
  }

  productCategoryEdit(String text, String categoryId, String docId) async {
    final data = {'categoryName': text, 'categoryID': categoryId};

    await dataserver.collection('Stock').doc(docId).update(data).then((value) {
      showToast(msg: "Product category changed");
      Get.back();
    });
  }

  Future<List<ProductSubcategoryModel>> fetchProductSubCategoryModel() async {
    final firebase =
        await FirebaseFirestore.instance.collection('Subcategory').get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs
          .map((e) => ProductSubcategoryModel.fromMap(e.data()))
          .toList();
      productSubCategoryList.add(list[i]);
    }
    return productSubCategoryList;
  }

  productSubCategoryEdit(String text, String categoryId, String docId) async {
    final data = {'subcategoryName': text, 'subcategoryID': categoryId};

    await dataserver.collection('Stock').doc(docId).update(data).then((value) {
      showToast(msg: "Product subcategory changed");
      Get.back();
    });
  }

  Future<List<UnitCategoryModel>> fetchUnitCategoryModel() async {
    final firebase =
        await FirebaseFirestore.instance.collection('UnitCategory').get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs
          .map((e) => UnitCategoryModel.fromMap(e.data()))
          .toList();
      unitCategoryList.add(list[i]);
    }
    return unitCategoryList;
  }

  productUnitCategoryEdit(String text, String categoryId, String docId) async {
    final data = {'unitcategoryName': text, 'unitcategoryID': categoryId};

    await dataserver.collection('Stock').doc(docId).update(data).then((value) {
      showToast(msg: "Product unit category changed");
      Get.back();
    });
  }

  Future<List<PackageTypeModel>> fetchPackageTypeModel() async {
    final firebase = await FirebaseFirestore.instance
        .collection('PackageTypeCollection')
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => PackageTypeModel.fromMap(e.data())).toList();
      packageTypeList.add(list[i]);
    }
    return packageTypeList;
  }

  productPackageTypeEdit(String text, String categoryId, String docId) async {
    final data = {'packageType': text, 'packageTypeID': categoryId};

    await dataserver.collection('Stock').doc(docId).update(data).then((value) {
      showToast(msg: "Product Package type changed");
      Get.back();
    });
  }

  Future<List<CanteenModel>> fetchCanteenModel() async {
    final firebase =
        await FirebaseFirestore.instance.collection('CanteenList').get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => CanteenModel.fromMap(e.data())).toList();
      canteenList.add(list[i]);
    }
    return canteenList;
  }

  productCompanyEdit(String text, String categoryId, String docId) async {
    final data = {'companyName': text, 'companyNameID': categoryId};

    await dataserver.collection('Stock').doc(docId).update(data).then((value) {
      showToast(msg: "Product Package type changed");
      Get.back();
    });
  }

  addToAllStock() async {
    isLoading.value = true;
    final productList = await getTempStockList();

    for (AllProductDetailModel data in productList) {
      dataserver.collection("AllStockList").doc(data.docId).set(data.toMap());
    }
    isLoading.value = false;
    showToast(msg: "Completed");
  }

  Future<List<AllProductDetailModel>> getTempStockList() async {
    final data = await dataserver.collection('Stock').get();
    return data.docs
        .map((e) => AllProductDetailModel.fromMap(e.data()))
        .toList();
  }

  
}
