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
  TextEditingController inPriceCtr = TextEditingController();
  TextEditingController outPriceCtr = TextEditingController();

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

  productNameEdit(String text, String docId) async {
    final data = {'productname': text};

    await fireStore
        .collection('temporaryCollection')
        .doc(docId)
        .update(data)
        .then((value) {
      Get.back();
      showToast(msg: "Product name changed");
    });
  }

  productCategoryEdit(String text, String docId, BuildContext context) async {
    final data = {'categoryName': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data);
    showToast(msg: "Product category changed");
    Navigator.pop(context);
  }

  productInPriceEdit(String text, String docId) async {
    final data = {'inPrice': text};

    await fireStore
        .collection('temporaryCollection')
        .doc(docId)
        .update(data)
        .then((value) {
      showToast(msg: "In price changed");
      Get.back();
    });
  }

  productOutPriceEdit(String text, String docId) async {
    final data = {'outPrice': text};

    await fireStore
        .collection('temporaryCollection')
        .doc(docId)
        .update(data)
        .then((value) {
      showToast(msg: "Out price changed");
      Get.back();
    });
  }

  unitEdit(String text, String docId) async {
    final data = {'unit': text};

    await fireStore
        .collection('temporaryCollection')
        .doc(docId)
        .update(data)
        .then((value) {
      Get.back();
      showToast(msg: "Unit changed");
      unitCtr.clear();
    });
  }

  companyNameEdit(String text, String docId) async {
    final data = {'companyName': text};

    await fireStore
        .collection('temporaryCollection')
        .doc(docId)
        .update(data)
        .then((value) {
      Get.back();
      showToast(msg: "Brand name changed");
    });
  }

  packageTypeEdit(String text, String docId, BuildContext context) async {
    final data = {'packageType': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data);
    showToast(msg: "PackageType changed");
    Navigator.pop(context);
  }

  quantityEdit(String text, String docId) async {
    final data = {'quantityinStock': text};

    await fireStore
        .collection('temporaryCollection')
        .doc(docId)
        .update(data)
        .then((value) {
      Get.back();
      showToast(msg: "Quantity changed");
    });
  }

  deleteTemProduct(String docId, BuildContext context) async {
    await fireStore.collection('temporaryCollection').doc(docId).delete();
    showToast(msg: "Product deleted");
    Navigator.pop(context);
  }
}
