import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TempProductController extends GetxController {
  final fireStore = FirebaseFirestore.instance;

  RxBool barcodebool = false.obs;
  RxBool productnamebool = false.obs;
  RxBool categorybool = false.obs;
  RxBool unitbool = false.obs;
  RxBool brandbool = false.obs;
  RxBool qtybool = false.obs;
  RxBool packagetypebool = false.obs;
  RxBool inPricebool = false.obs;
  RxBool outPriceool = false.obs;

  barcodeEdit(String text, String docId) async {
    final data = {'barcodeNumber': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data);
  }

  productNameEdit(String text, String docId) async {
    final data = {'productname': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data);
  }

  productPriceEdit(String text, String docId) async {
    final data = {'price': text};

    await fireStore.collection('temporaryCollection').doc(docId).update(data);
  }
}
