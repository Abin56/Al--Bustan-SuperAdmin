import 'dart:developer';

import 'package:canteen_superadmin_website/model/delivery_model.dart';
import 'package:canteen_superadmin_website/view/constant/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  var cart = 0.obs;
  var products = {}.obs;
  var totalPrice = 0.0.obs;

  void addProductToCart(DeliveryModel product) {
    final uuid = const Uuid().v1();
    bool productExists = false;

    // Checking if the product exists in the cart
    for (var existingProduct in products.keys) {
      if (existingProduct.productname == product.productname) {
        productExists = true;
        break;
      }
    }

    if (productExists) {
      showToast(msg: "${product.productname} is already in the cart.");
      return;
    }
    products[product] = 1;

    final data = {
      'productname': product.productname,
      'productprice': product.productprice,
      'productimage': product.imageUrl,
    };

    firestore.collection("userCart").doc(uuid).set(data);
    showToast(msg: "You have added ${product.productname} to the cart");
  }

  get prodducts => products;
// increment
  void increment(DeliveryModel product) {
    products[product] = (products[product] ?? 0) + 1;
  }

// decrement
  void decrement(DeliveryModel product) {
    if (products[product] != null && products[product]! > 0) {
      products[product] = products[product]! - 1;
    }
  }

// delete a product from the cart
  Future<void> deleteProductFromCart(DeliveryModel product) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("userCart")
          .where('productname', isEqualTo: product.productname)
          .get();

      if (snapshot.docs.isNotEmpty) {
        log(snapshot.docs.toString());
        String docId = snapshot.docs.first.id;
        await FirebaseFirestore.instance
            .collection("userCart")
            .doc(docId)
            .delete();
        print('Product deleted successfully!');
        showToast(msg: "You have removed ${product.productname} from the cart");
      } else {
        print('${product.productname} not found in the cart.');
        showToast(msg: "${product.productname} is not found in the cart.");
      }
    } catch (error) {
      print('Error: $error');
      showToast(msg: "Error removing ${product.productname} from the cart");
    }
  }
}
