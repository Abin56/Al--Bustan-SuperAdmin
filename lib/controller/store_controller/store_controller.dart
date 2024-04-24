import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:canteen_superadmin_website/model/category_model.dart';
import 'package:canteen_superadmin_website/model/product_model.dart';
import 'package:canteen_superadmin_website/model/product_request_model.dart';
import 'package:canteen_superadmin_website/core/constant/const.dart';
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

  TextEditingController categoryCtr = TextEditingController();
  TextEditingController subcategotyCtr = TextEditingController();
  TextEditingController quantityCtr = TextEditingController();

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

  addCategory(String category) async {
    final uuid = const Uuid().v1();
    String docName = category + uuid;

    final data = {"docid": docName, "categoryName": category};
    fireStore
        .collection("ProductCategory")
        .doc(docName)
        .set(data)
        .then((value) {
      showToast(msg: "New Category Added");
      Get.back();
      categoryCtr.clear();
    });
  }

  editCategory(String category, String docId) async {
    final data = {"categoryName": category};
    fireStore
        .collection("ProductCategory")
        .doc(docId)
        .update(data)
        .then((value) {
      showToast(msg: "Category Updated");
      Get.back();
      categoryCtr.clear();
    });
  }

  addSubCategory(String subcategory) async {
    final uuid = const Uuid().v1();
    String docName = subcategory + uuid;

    final data = {"docid": docName, "subcategoryName": subcategory};
    fireStore.collection("Subcategory").doc(docName).set(data).then((value) {
      showToast(msg: "New Subcategory Added");
      Get.back();
      subcategotyCtr.clear();
    });
  }

  editSubcategory(String subcategory, String docId) async {
    final data = {"subcategoryName": subcategory};
    fireStore.collection("Subcategory").doc(docId).update(data).then((value) {
      showToast(msg: "Subcategory Updated");
      Get.back();
      subcategotyCtr.clear();
    });
  }

  addQuantity(String quantitytypeName) async {
    final uuid = const Uuid().v1();
    String docName = quantitytypeName + uuid;

    final data = {"docid": docName, "value": quantitytypeName};
    fireStore.collection("UnitCategory").doc(docName).set(data).then((value) {
      showToast(msg: "New Quantity type Added");
      Get.back();
      quantityCtr.clear();
    });
  }

  editQuantity(String category, String docId) async {
    final data = {"value": category};
    fireStore.collection("UnitCategory").doc(docId).update(data).then((value) {
      showToast(msg: "Quantity Type Updated");
      Get.back();
      quantityCtr.clear();
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

  addTempProductToDB(List<DocumentSnapshot> dataList) async {
    for (int i = 0; i < dataList.length; i++) {
      ProductAddingModel data = ProductAddingModel.fromMap(dataList[i]);
      // String docID = data.docId;
      if (data.barcodeNumber != "" &&
          data.productname != "" &&
          data.categoryName != "" &&
          data.categoryID != "") {
        await fireStore
            .collection('pendingProducts')
            .doc(data.barcodeNumber)
            .set(data.toMap())
            .then((value) async {
          await fireStore
              .collection('temporaryCollection')
              .doc(data.docId)
              .delete();
          showToast(msg: "Added");
        });
      }
    }
  }

  allProductAddToLowStockAlert() async {
    try {
      final availableProductList = await getAvailableProductList();

      for (AllProductDetailModel data in availableProductList) {
        if (data.quantityinStock <= data.limit) {
          dataserver
              .collection('LowStockAlert')
              .doc(data.docId)
              .set(data.toMap());
        }
      }
    } catch (e) {
      showToast(msg: 'Error occure in all product low stock checking ');
    }
  }

  Future<List<AllProductDetailModel>> getAvailableProductList() async {
    final avilableStockData =
        await dataserver.collection('AvailableProducts').get();

    final availableProdcutList = avilableStockData.docs
        .map((e) => AllProductDetailModel.fromMap(e.data()))
        .toList();
    return availableProdcutList;
  }
}
