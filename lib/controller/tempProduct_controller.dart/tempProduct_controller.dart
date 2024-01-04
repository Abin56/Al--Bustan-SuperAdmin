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

  RxBool barcodebool = false.obs;
  RxBool productnamebool = false.obs;
  RxBool categorybool = false.obs;
  RxBool unitbool = false.obs;
  RxBool brandbool = false.obs;
  RxBool qtybool = false.obs;
  RxBool packagetypebool = false.obs;
  RxBool inPricebool = false.obs;
  RxBool outPriceool = false.obs;

  barcodeEdit(String text, String docId, BuildContext context) async {
    final data = {'barcodeNumber': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data);
    showToast(msg: "Barcode changed");
    Navigator.pop(context);
  }

  productNameEdit(String text, String docId, BuildContext context) async {
    final data = {'productname': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data);
    showToast(msg: "Product name changed");

    Navigator.pop(context);
  }

  productCategoryEdit(String text, String docId, BuildContext context) async {
    final data = {'categoryName': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data);
    showToast(msg: "Product category changed");
    Navigator.pop(context);
  }

  productPriceEdit(String text, String docId, BuildContext context) async {
    final data = {'price': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data);
    showToast(msg: "Price changed");
    Navigator.pop(context);
  }

  unitEdit(String text, String docId, BuildContext context) async {
    final data = {'unit': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data);
    showToast(msg: "unit changed");
    Navigator.pop(context);
  }

  companyNameEdit(String text, String docId, BuildContext context) async {
    final data = {'companyName': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data);
    showToast(msg: "Brand name changed");
    Navigator.pop(context);
  }

  packageTypeEdit(String text, String docId, BuildContext context) async {
    final data = {'packageType': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data);
    showToast(msg: "PackageType changed");
    Navigator.pop(context);
  }

  quantityEdit(String text, String docId, BuildContext context) async {
    final data = {'quantityinStock': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data);
    showToast(msg: "Quantity changed");
    Navigator.pop(context);
  }

  deleteTemProduct(String docId, BuildContext context) async {
    await fireStore.collection('temporaryCollection').doc(docId).delete();
    showToast(msg: "Product deleted");
    Navigator.pop(context);
  }
}
