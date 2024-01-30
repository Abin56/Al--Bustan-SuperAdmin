import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/model/admin_model.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:canteen_superadmin_website/model/cart_model.dart';
import 'package:canteen_superadmin_website/model/employee_request_model.dart';
import 'package:canteen_superadmin_website/core/constant/const.dart';
import 'package:canteen_superadmin_website/view/widgets/id_generator/id_generator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class DeliveryController extends GetxController {
  final firestore = FirebaseFirestore.instance;

  List<AdminModel> employeeList = [];

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
    final uuid = Uuid().v1();
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
    //for getting count of cart details if cark empty the request not add//
    final cartlistLength = await firestore.collection('DeliveryCart').get();
    if (cartlistLength.docs.isNotEmpty) {
      int amount = 0;
      String id = idGenerator();
      final orderid = '#' + id;
      final cartProductS =
          await firestore.collectionGroup('CartProductDetails').get();
      final cartProductsList = cartProductS.docs
          .map((e) => AllProductDetailModel.fromMap(e.data()))
          .toList();
      //product details added to deliveryAssignList collection//
      for (int i = 0; i < cartProductsList.length; i++) {
        // final uuid2 = const Uuid().v1();
        firestore
            .collection("deliveryAssignList")
            .doc(orderid)
            .collection("orderProducts")
            .doc(cartProductsList[i].docId)
            .set(cartProductsList[i].toMap());
      }
      //for getting time//
      final time = DateTime.now().toString();
      //for getting cart details //
      final cartdetailsList = await getCartList();
      // after getting cart details the amount added for getting total amount//
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
      //for adding delivery deatils in deliveryAssignlist collection//
      firestore.collection("deliveryAssignList").doc(orderid).set(data);
      showToast(msg: "Delivery Request added");
      Get.back();
      //for deleting cart details after making delivery request//
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

  createDeliveryAssignToEmployee(
      //assigning function//
      //for creating request to employee by assigning//
      {required String employeeName,
      required String employeeId,
      required DocumentSnapshot deliverydata}) async {
    final time = DateTime.now().toString();

    //delivery request goes to pending list //
    final pendingData = {
      'time': time,
      "docId": deliverydata['orderId'],
      "orderCount": deliverydata['orderCount'],
      "orderId": deliverydata['orderId'],
      "assignStatus": true,
      "isDelivered": false,
      "pendingStatus": true,
      "pickedUpStatus": false,
      "statusMessage": "Pending",
      "price": deliverydata['price'],
      "employeeName": employeeName,
      "employeeId": employeeId,
    };
    await dataserver
        .collection("DeliveryPendingList")
        .doc(deliverydata['orderId'])
        .set(pendingData);

    //employees details//
    // final employeeData = {
    //   "employeeName": employeeName,
    //   "employeeId": employeeId,
    //   'assignStatus': true
    // };
    //employees details updated in delivery request detilas//
    // await firestore
    //     .collection('deliveryAssignList')
    //     .doc(deliverydata['orderId'])
    //     .update(employeeData);

    //delivery details//
    final data = {
      'orderId': deliverydata['orderId'],
      'orderCount': deliverydata['orderCount'],
      'time': time,
      'status': 'Pending'
    };

    //delivery request details stored in employees collection//
    await firestore
        .collection('AllUsersCollection')
        .doc(employeeId)
        .collection(('DeliveryRequest'))
        .doc(deliverydata['orderId'])
        .set(data);
    //for getting product detials list from deliveryAssignList collection//
    final productDetailsList = await firestore
        .collection('deliveryAssignList')
        .doc(deliverydata['orderId'])
        .collection('orderProducts')
        .get();
    //converted into product model//
    final productlist = productDetailsList.docs
        .map((e) => AllProductDetailModel.fromMap(e.data()))
        .toList();
    //for add product details in employees collection//
    for (int i = 0; i < productlist.length; i++) {
      await firestore
          .collection('AllUsersCollection')
          .doc(employeeId)
          .collection(('DeliveryRequest'))
          .doc(deliverydata['orderId'])
          .collection("productsDetails")
          .doc(productlist[i].docId)
          .set(productlist[i].toMap());

      await dataserver
          .collection('DeliveryPendingList')
          .doc(deliverydata['orderId'])
          .collection("productsDetails")
          .doc(productlist[i].docId)
          .set(productlist[i].toMap());
    }

    await firestore
        .collection('deliveryAssignList')
        .doc(deliverydata['orderId'])
        .delete();
  }

  confirmEmployeeRequest(EmployeeRequestModel requestdata) async {
    String id = idGenerator();
    final orderid = '#' + id;

    final data = {
      'time': requestdata.time,
      "docId": orderid,
      "orderCount": requestdata.orderCount,
      "orderId": orderid,
      "assignStatus": false,
      "isDelivered": false,
      "pendingStatus": false,
      "pickedUpStatus": false,
      "statusMessage": "",
      "price": requestdata.amount,
      "employeeName": requestdata.emplopeeName,
      "employeeId": requestdata.emplopeeId
    };
    final requestedProductList = await firestore
        .collection('EmployeeDeliveryRequest')
        .doc(requestdata.docid)
        .collection('RequestProductDetails')
        .get();
    for (var element in requestedProductList.docs) {
      firestore
          .collection("deliveryAssignList")
          .doc(orderid)
          .collection('orderProducts')
          .doc(element['docId'])
          .set(element.data());
    }
    firestore.collection("deliveryAssignList").doc(orderid).set(data);
    showToast(msg: "Delivery Request added");
    Get.back();
    //delete after request confirm//
    final employeeProductList = await firestore
        .collection('EmployeeDeliveryRequest')
        .doc(requestdata.docid)
        .collection('RequestProductDetails')
        .get();
    for (var element in employeeProductList.docs) {
      firestore
          .collection('EmployeeDeliveryRequest')
          .doc(requestdata.docid)
          .collection('RequestProductDetails')
          .doc(element['docId'])
          .delete();
    }
    firestore
        .collection('EmployeeDeliveryRequest')
        .doc(requestdata.docid)
        .delete();
  }

  cancelEmployeeRequest(EmployeeRequestModel requestdata) async {
    //delete after request confirm//
    final employeeProductList = await firestore
        .collection('EmployeeDeliveryRequest')
        .doc(requestdata.docid)
        .collection('RequestProductDetails')
        .get();
    for (var element in employeeProductList.docs) {
      firestore
          .collection('EmployeeDeliveryRequest')
          .doc(requestdata.docid)
          .collection('RequestProductDetails')
          .doc(element['docId'])
          .delete();
    }
    await firestore
        .collection('EmployeeDeliveryRequest')
        .doc(requestdata.docid)
        .delete();
  }

  Future<List<AdminModel>> fetchEmployeeModel() async {
    final firebase =
        await FirebaseFirestore.instance.collection('AllUsersCollection').get();

    for (var i = 0; i < firebase.docs.length; i++) {
      // final list =
      //     firebase.docs.map((e) => AdminModel.fromMap(e.data())).toList();
      // employeeList.add(list[i]);
      final list =
          firebase.docs.map((e) => AdminModel.fromMap(e.data())).toList();
      if (list[i].userrole == 'employee') {
        employeeList.add(list[i]);
      }
    }
    return employeeList;
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
