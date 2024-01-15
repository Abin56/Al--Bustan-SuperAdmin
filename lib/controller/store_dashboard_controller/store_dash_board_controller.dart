import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreDashBoardController extends GetxController {
  final firestore = FirebaseFirestore.instance;

  RxInt totalCost = 0.obs;
  RxInt totalAvailableStock = 0.obs;
  RxInt totalStock = 0.obs;

  void getTotalCost() async {
    int totalamt = 0;
    //for getting total cost //
    final allProductList = await getAllProductList();
    for (AllProductDetailModel product in allProductList) {
      int amount = product.inPrice * product.quantityinStock;
      totalamt = totalamt + amount;
    }
    totalCost.value = totalamt;
  }

  Future<List<AllProductDetailModel>> getAllProductList() async {
    //gettting all products list
    final data = await firestore.collection('AllProduct').get();
    final allProductList =
        data.docs.map((e) => AllProductDetailModel.fromMap(e.data())).toList();
    return allProductList;
  }

  void getTotalAvailableStock() async {
    //for getting total stock //
    int stock = 0;
    final allProductList = await getAllProductList();
    for (AllProductDetailModel product in allProductList) {
      if (product.quantityinStock != 0) {
        stock = stock + 1;
      }
    }
    totalAvailableStock.value = stock;
  }

  void getTotalStock() async {
    int stock = 0;
    final allProductList = await getAllProductList();
    for (AllProductDetailModel product in allProductList) {
      stock = stock + 1;
    }
    totalStock.value = stock;
  }
}
