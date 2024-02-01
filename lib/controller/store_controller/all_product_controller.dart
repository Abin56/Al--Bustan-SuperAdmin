import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:uuid/uuid.dart';

class AllProductController extends GetxController {
  RxList<AllProductDetailModel> searchResults = <AllProductDetailModel>[].obs;
  final RxBool loading = true.obs;
  final RxString error = ''.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController inPriceController = TextEditingController();
  final TextEditingController limitCtr = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final Uuid uuid = const Uuid();

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
      final time = DateTime.now().toString().toLowerCase();

      // map product details
      Map<String, dynamic> productData = {
        'docId': docName,
        'barcodeNumber': barcodeNumber,
        'productname': productname.toLowerCase(),
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
        'productname': newName.toLowerCase(),
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
          .update(data);
      productNameController.clear();
      inPriceController.clear();
      limitCtr.clear();
      expiryDateController.clear();

      print('Product limit updated successfully!');
    } catch (e) {
      print('Error updating product limit: $e');
      throw Exception('Failed to update product limit');
    }
  }

// Search

  Future<void> searchProductsByName(String keyword) async {
    try {
      loading.value = true;

      if (keyword.isEmpty) {
        searchResults.clear();
      } else {
        final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('AllProductStockCollection')
            .where('productname', isGreaterThanOrEqualTo: keyword.toLowerCase())
            .where('productname', isLessThan: '${keyword.toLowerCase()}z')
            .get();

        searchResults.value = querySnapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          data['productname'] = data['productname'].toString().toLowerCase();
          return AllProductDetailModel.fromMap(data);
        }).toList();
      }
    } catch (e) {
      print('Error searching products: $e');
      error.value = 'Failed to search products: $e';
    } finally {
      loading.value = false;
    }
  }
}
