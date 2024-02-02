import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AllProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController inPriceController = TextEditingController();
  final TextEditingController limitCtr = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final Uuid uuid = const Uuid();
  RxList<AllProductDetailModel> searchList = <AllProductDetailModel>[].obs;

  Future<void> addProduct({
    required String barcodeNumber,
    required String productname,
    required String categoryID,
    required String categoryName,
    required String subcategoryID,
    required String subcategoryName,
    required int inPrice,
    required int outPrice,
    required int quantityinStock,
    required String expiryDate,
    required String authuid,
    required String unitcategoryID,
    required String unitcategoryName,
    required String packageType,
    required String packageTypeID,
    required String companyName,
    required String companyNameID,
    required String returnType,
    required String itemcode,
    required bool outofstock,
    required bool isavailable,
  }) async {
    try {
      String uuid = this.uuid.v1();
      String docName = '$productname-$uuid';
      final time = DateTime.now().toString();

      // map product details
      Map<String, dynamic> productData = {
        'docId': docName,
        'barcodeNumber': barcodeNumber,
        'productname': productname,
        'categoryID': categoryID,
        'categoryName': categoryName,
        'subcategoryID': subcategoryID,
        'subcategoryName': subcategoryName,
        'inPrice': inPrice,
        'outPrice': outPrice,
        'quantityinStock': quantityinStock,
        'expiryDate': expiryDate,
        'addedDate': time,
        'authuid': authuid,
        'unitcategoryID': unitcategoryID,
        'unitcategoryName': unitcategoryName,
        'packageType': packageType,
        'packageTypeID': packageTypeID,
        'companyName': companyName,
        'companyNameID': companyNameID,
        'returnType': returnType,
        'itemcode': itemcode,
        'outofstock': outofstock,
        'isavailable': isavailable,
      };

      // Add the product data to the collection
      await firestore
          .collection('AllProductStockCollection')
          .doc(docName)
          .set(productData);

      print('Product added successfully!');
    } catch (e) {
      print('Error adding product: $e');
    }
  }

// edit
  Future<void> editProductList(
    String docId,
    String newName,
    String newExpiry,
    int newInPrice,
    int newLimit,
    String companyName,
    String companyId,
    String categoryName,
    String categoryID,
    String subcategoryID,
    String subcategoryName,
    String unitcategoryID,
    String unitcategoryName,
    String packageTypeID,
    String packageType,
  ) async {
    try {
      final data = {
        'productname': newName,
        'limit': newLimit,
        'expiryDate': newExpiry,
        'inPrice': newInPrice,
        'companyName': companyName,
        'companyNameID': companyId,
        'categoryName': categoryName,
        'categoryID': categoryID,
        'subcategoryID': subcategoryID,
        'subcategoryName': subcategoryName,
        'unitcategoryID': unitcategoryID,
        'unitcategoryName': unitcategoryName,
        'packageTypeID': packageTypeID,
        'packageType': packageType,
      };

      await firestore
          .collection('AllProductStockCollection')
          .doc(docId)
          .update(data)
          .then((value) async {
        await firestore
            .collection('AvailableProducts')
            .doc(docId)
            .update(data)
            .then((value) {
          productNameController.clear();
          inPriceController.clear();
          limitCtr.clear();
          expiryDateController.clear();
          Get.back();

          print('Product limit updated successfully!');
        });
      });
    } catch (e) {
      print('Error updating product limit: $e');
      throw Exception('Failed to update product limit');
    }
  }

  search(String text) async {
    final allStockdata =
        await dataserver.collection('AllProductStockCollection').get();
    final allstocklist = allStockdata.docs
        .map((e) => AllProductDetailModel.fromMap(e.data()))
        .toList();
    searchList.value = allstocklist
        .where((element) =>
            element.productname!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    // update();
  }

  getallStockList() async {
    final allStockdata =
        await dataserver.collection('AllProductStockCollection').get();
    searchList.value = allStockdata.docs
        .map((e) => AllProductDetailModel.fromMap(e.data()))
        .toList();
  }
}
