// import 'package:canteen_superadmin_website/model/delivery_model.dart';
// import 'package:canteen_superadmin_website/view/constant/const.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:uuid/uuid.dart';

// class CartController extends GetxController {
//   var products = {}.obs;
//   final firestore = FirebaseFirestore.instance;
//   var cart = 0.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchProducts();
//   }

//   void addProductToCart(DeliveryModel product) {
//     final uuid = const Uuid().v1();
//     if (products.containsKey(product)) {
//       products[product] += 1;
//       print(">>>>>>>>>>>>>>>>>>in");
//     } else {
//       products[product] = 1;
//     }
//     final data = {
//       'productname': product.productname,
//       'productprice': product.productprice,
//       'productimage': product.imageUrl,
//     };

//     firestore.collection("userCart").doc(uuid).set(data);

//     showToast(msg: "You have add the ${product.productname} to the cart");

//     // Get.snackbar(
//     //     "Product Add", "You have add the ${product.productname} to the cart",
//     //     snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
//   }

//   get prodducts => products;
//   // >>>>>>>>>>>>>>>>>>>>>>>

//   increment() {
//     cart.value++;
//   }
//   // >>>>>>>>>>>>>>>>>>>>>>>

//   decrement() {
//     if (cart.value <= 0) {
//       Get.snackbar(
//         "Buying Products",
//         "Can not be less than zero",
//         icon: const Icon(Icons.alarm),
//         barBlur: 20,
//         isDismissible: true,
//         duration: const Duration(seconds: 3),
//       );
//     } else {
//       cart.value--;
//     }
//   }
//   // >>>>>>>>>

//   void fetchProducts() async {
//     try {
//       QuerySnapshot querySnapshot =
//           await firestore.collection("userCart").get();

//       for (int i = 0; i < querySnapshot.docs.length; i++) {
//         DocumentSnapshot doc = querySnapshot.docs[i];
//         String productName = doc['productname'];
//         double productPrice = doc['productprice'].toDouble();
//         String imageUrl = doc['productimage'];

//         DeliveryModel product = DeliveryModel(
//           productname: productName,
//           productprice: productPrice.toString(),
//           imageUrl: imageUrl,
//         );
//         products[product] = 1;
//       }
//     } catch (error) {
//       print("Error fetching products: $error");
//     }
//   }
// }
