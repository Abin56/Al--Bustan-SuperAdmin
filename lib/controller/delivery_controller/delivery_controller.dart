import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:canteen_superadmin_website/model/cart_model.dart';
import 'package:canteen_superadmin_website/view/constant/const.dart';
import 'package:canteen_superadmin_website/view/widgets/id_generator/id_generator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class DeliveryController extends GetxController {
  final firestore = FirebaseFirestore.instance;

  RxInt quantity = 0.obs;
  // RxInt singleItemTotalAmount = 0.obs;
  // RxInt totalAmount = 0.obs;

  addQuantity(CartModel data) {
    if (data.quantity < data.availablequantityinStock) {
      int qty = data.quantity + 1;
      int totalAmount = data.outPrice * qty;
      final qtydata = {
        'totalAmount': totalAmount,
        'quantity': qty,
      };
      firestore.collection('DeliveryCart').doc(data.docId).update(qtydata);

      firestore
          .collection('DeliveryCart')
          .doc(data.docId)
          .collection("CartProductDetails")
          .doc(data.productDetailsDocId)
          .update({'quantityinStock': qty});
    } else {
      showToast(msg: "Maximum quantity added");
    }
  }

  lessQuantity(CartModel data) {
    if (data.quantity > 0) {
      int qty = data.quantity - 1;
      int totalAmount = data.outPrice * qty;
      final qtydata = {
        'totalAmount': totalAmount,
        'quantity': qty,
      };
      firestore.collection('DeliveryCart').doc(data.docId).update(qtydata);
      firestore
          .collection('DeliveryCart')
          .doc(data.docId)
          .collection("CartProductDetails")
          .doc(data.productDetailsDocId)
          .update({'quantityinStock': qty});
    } else {
      showToast(msg: "Please add quantity");
    }
  }

  onChangeFuction(CartModel data, String value) {
    final qty = int.parse(value);
    int totalAmount = data.outPrice * qty;
    if (qty > 0 && qty <= data.availablequantityinStock) {
      final qtydata = {
        'totalAmount': totalAmount,
        'quantity': qty,
      };
      firestore.collection('DeliveryCart').doc(data.docId).update(qtydata);
      firestore
          .collection('DeliveryCart')
          .doc(data.docId)
          .collection("CartProductDetails")
          .doc(data.productDetailsDocId)
          .update({'quantityinStock': qty});
    } else {
      showToast(msg: "Please enter valid quantity");
    }
  }

  addToCart(AllProductDetailModel data) {
    final uuid = const Uuid().v1();
    final cartdata = {
      "productDetailsDocId": data.docId,
      "barcodeNumber": data.barcodeNumber,
      "productname": data.productname,
      "availableQuantity": data.quantityinStock,
      "inPrice": data.inPrice,
      "outPrice": data.outPrice,
      "quantity": 0,
      "totalAmount": 0,
      "docId": uuid
    };

    firestore.collection("DeliveryCart").doc(uuid).set(cartdata).then(
      (value) {
        showToast(msg: "Added to Cart");
      },
    );
    firestore
        .collection('DeliveryCart')
        .doc(uuid)
        .collection("CartProductDetails")
        .doc(data.docId)
        .set(data.toMap());
    firestore
        .collection('DeliveryCart')
        .doc(uuid)
        .collection("CartProductDetails")
        .doc(data.docId)
        .update({'quantityinStock': 0});
  }

  cartToDeliveryOrder() async {
    final cartlistLength = await firestore.collection('DeliveryCart').get();
    if (cartlistLength.docs.isNotEmpty) {
      int amount = 0;
      String id = idGenerator();
      final orderid = '#$id';
      final cartProductS =
          await firestore.collectionGroup('CartProductDetails').get();
      final cartProductsList = cartProductS.docs
          .map((e) => AllProductDetailModel.fromMap(e.data()))
          .toList();
      for (int i = 0; i < cartProductsList.length; i++) {
        final uuid2 = const Uuid().v1();
        firestore
            .collection("deliveryAssignList")
            .doc(orderid)
            .collection("orderProducts")
            .doc(uuid2)
            .set(cartProductsList[i].toMap());
      }

      final time = DateTime.now().toString();

      final cartdetailsList = await getCartList();

      for (var element in cartdetailsList) {
        amount = amount + element.totalAmount;
      }

      final data = {
        'time': time,
        "docId": orderid,
        "orderCount": cartProductsList.length,
        "orderId": orderid,
        "assignStatus": false,
        "isDelivered": false,
        "price": amount,
        "employeeName": '',
        "employeeId": ''
      };
      firestore.collection("deliveryAssignList").doc(orderid).set(data);
      showToast(msg: "Delivery Request added");
      Get.back();

      for (int i = 0; i < cartdetailsList.length; i++) {
        firestore
            .collection('DeliveryCart')
            .doc(cartdetailsList[i].docId)
            .collection('CartProductDetails')
            .doc(cartdetailsList[i].productDetailsDocId)
            .delete();
        firestore
            .collection('DeliveryCart')
            .doc(cartdetailsList[i].docId)
            .delete();
      }
    } else {
      showToast(msg: "Please Add Product");
    }
  }

  Future<List<CartModel>> getCartList() async {
    final data = await firestore.collection('DeliveryCart').get();
    return data.docs.map((e) => CartModel.fromMap(e.data())).toList();
  }

  createDeliveryOrderToEmployee(
      {required String employeeName,
      required String employeeId,
      required DocumentSnapshot deliverydata}) async {
    final time = DateTime.now().toString();
    final data = {
      'orderId': deliverydata['orderId'],
      'orderCount': deliverydata['orderCount'],
      'time': time,
      'status': 'Pending'
    };
    final employeeData = {
      "employeeName": employeeName,
      "employeeId": employeeId,
      'assignStatus': true
    };
    firestore
        .collection('deliveryAssignList')
        .doc(deliverydata['orderId'])
        .update(employeeData);

    firestore
        .collection('EmployeeProfile')
        .doc(employeeId)
        .collection(('DeliveryRequest'))
        .doc(deliverydata['orderId'])
        .set(data);
    final productDetailsList = await firestore
        .collection('deliveryAssignList')
        .doc(deliverydata['orderId'])
        .collection('orderProducts')
        .get();
    final productlist = productDetailsList.docs
        .map((e) => AllProductDetailModel.fromMap(e.data()))
        .toList();

    for (int i = 0; i < productlist.length; i++) {
      firestore
          .collection('EmployeeProfile')
          .doc(employeeId)
          .collection(('DeliveryRequest'))
          .doc(deliverydata['orderId'])
          .collection("productsDetails")
          .doc(productlist[i].docId)
          .set(productlist[i].toMap());
    }
  }

  // imagePicker() async {
  //   final pickedImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     // Check if the picked image has a PNG extension
  //     if (pickedImage.name.toLowerCase().endsWith('.png')) {
  //       showToast(msg: 'Selected a PNG image.');
  //     } else {
  //       // Show a message or handle the case when a non-PNG image is selected
  //       showToast(msg: 'Please select a PNG image.');
  //     }
  //   }
  // }
}
