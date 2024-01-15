import 'dart:math';

import 'package:canteen_superadmin_website/model/suppliers_model.dart';
import 'package:canteen_superadmin_website/view/core/core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class SuppliersControllers extends GetxController {
  final firestore = FirebaseFirestore.instance;
  RxBool imagePicked = false.obs;
  Rx<Uint8List?> suppliersImage = Rx<Uint8List?>(null);

  TextEditingController suppliersnamecontroller = TextEditingController();
  TextEditingController suppliersidcontroller = TextEditingController();
  TextEditingController suppliersaddresscontroller = TextEditingController();
  TextEditingController contactPersoncontroller = TextEditingController();
  TextEditingController suppliersProductscontroller = TextEditingController();
  TextEditingController workstartTimectscontroller = TextEditingController();
  TextEditingController workEndTimectscontroller = TextEditingController();

  addSuppliers() async {
    try {
      final uuid = Uuid().v1();
      String image = '';
      if (suppliersImage.value != null) {
        image = await uploapImageToFirebase(suppliersImage.value!);
        imagePicked.value = true;
      }

      final suppliersModel = SuppliersModel(
        docId: uuid,
        suppliersName: suppliersnamecontroller.text,
        suppliersId: suppliersidcontroller.text,
        suppliersAddress: suppliersaddresscontroller.text,
        contactPerson: contactPersoncontroller.text,
        suppliersProducts: suppliersProductscontroller.text,
        workstartTime: workstartTimectscontroller.text,
        workEndTime: workEndTimectscontroller.text,
        image: image,
      );
      final data = suppliersModel.toMap();
      await firestore.collection('SuppliersList').doc(uuid).set(data);
      suppliersnamecontroller.clear();
      suppliersidcontroller.clear();
      suppliersaddresscontroller.clear();
      contactPersoncontroller.clear();
      suppliersProductscontroller.clear();
      workstartTimectscontroller.clear();
      workEndTimectscontroller.clear();
    } catch (e) {
      print('Error adding suppliers: $e');
    }
  }

  // for Picking images from gallery //
  pickCameraImage() async {
    try {
      XFile? pickimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickimage != null) {
        return await pickimage.readAsBytes();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // images uploaded to firebase and return a image url //
  Future<String> uploapImageToFirebase(Uint8List image) async {
    String imageUrl = '';

    final imageName = 'image_${DateTime.now()}.jpg';
    Reference storageRef =
        dataserverStorage.ref().child('imagecollection$imageName');

    try {
      await storageRef.putData(image).whenComplete(
        () async {
          String url = await storageRef.getDownloadURL();
          imageUrl = url;
        },
      );
      return imageUrl;
    } catch (e) {
      print(e);
      return "error";
    }
  }
}
