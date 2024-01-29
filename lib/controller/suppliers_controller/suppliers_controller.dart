import 'dart:developer';

import 'package:canteen_superadmin_website/model/suppliers_model.dart';
import 'package:canteen_superadmin_website/core/core.dart';
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

  TextEditingController productnamecontroller = TextEditingController();
  TextEditingController productquantitycontroller = TextEditingController();
  TextEditingController suppliersaddresscontroller = TextEditingController();
  TextEditingController contactPersoncontroller = TextEditingController();
  TextEditingController suppliersProductscontroller = TextEditingController();
  TextEditingController manufacturectsdatecontroller = TextEditingController();
  TextEditingController expirydatecontroller = TextEditingController();

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
        suppliersName: productnamecontroller.text,
        suppliersId: productquantitycontroller.text,
        suppliersAddress: suppliersaddresscontroller.text,
        contactPerson: contactPersoncontroller.text,
        suppliersProducts: suppliersProductscontroller.text,
        workstartTime: manufacturectsdatecontroller.text,
        workEndTime: expirydatecontroller.text,
        image: image,
        isEnabled: true,
      );
      final data = suppliersModel.toMap();
      await firestore.collection('SuppliersList').doc(uuid).set(data);
      productnamecontroller.clear();
      productquantitycontroller.clear();
      suppliersaddresscontroller.clear();
      contactPersoncontroller.clear();
      suppliersProductscontroller.clear();
      manufacturectsdatecontroller.clear();
      expirydatecontroller.clear();
    } catch (e) {
      print('Error adding suppliers: $e');
    }
  }

  // <<<<<  editSuppliers >>>>>>
  disableSupplier(String docId, bool currentStatus) async {
    try {
      await firestore.collection('SuppliersList').doc(docId).update({
        'isEnabled': !currentStatus,
      });
      if (!currentStatus) {
        print('Supplier disabled successfully');
      } else {
        print('Supplier enabled successfully');
      }
    } catch (e) {
      print('Error toggling supplier status: $e');
    }
  }

// <<<<<  editSuppliers >>>>>>

  editSuppliers(String docId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> supplierDoc =
          await firestore.collection('SuppliersList').doc(docId).get();

      if (supplierDoc.exists) {
        print("1111");
        log(supplierDoc.toString());

        if (suppliersImage.value != null) {
          String newImage = await uploapImageToFirebase(suppliersImage.value!);
          await firestore.collection('SuppliersList').doc(docId).update({
            'image': newImage,
          });
        }

        await firestore.collection('SuppliersList').doc(docId).update({
          'suppliersName': productnamecontroller.text,
          'suppliersId': productquantitycontroller.text,
          'suppliersAddress': suppliersaddresscontroller.text,
          'contactPerson': contactPersoncontroller.text,
          'suppliersProducts': suppliersProductscontroller.text,
          'workstartTime': manufacturectsdatecontroller.text,
          'workEndTime': expirydatecontroller.text,
        });

        productnamecontroller.clear();
        productquantitycontroller.clear();
        suppliersaddresscontroller.clear();
        contactPersoncontroller.clear();
        suppliersProductscontroller.clear();
        manufacturectsdatecontroller.clear();
        expirydatecontroller.clear();

        print('Supplier edited successfully');
      } else {
        print('Supplier not found');
      }
    } catch (e) {
      print('Error editing supplier: $e');
    }
  }

  // <<<<<<<< deleteSuppliers  >>>>>>>>>>

  deleteSuppliers(String docId) async {
    await FirebaseFirestore.instance
        .collection('SuppliersList')
        .doc(docId)
        .delete();
    print('Supplier deleted successfully');
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
