import 'dart:developer';
import 'dart:typed_data';

import 'package:canteen_superadmin_website/model/canteen_model.dart';
import 'package:canteen_superadmin_website/view/constant/const.dart';
import 'package:canteen_superadmin_website/view/core/core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class CanteenController extends GetxController {
  final firestore = FirebaseFirestore.instance;

  Rxn<Uint8List> canteenImage = Rxn();

  TextEditingController schoolNameCtr = TextEditingController();
  TextEditingController canteenIdCtr = TextEditingController();
  TextEditingController schoolAddressCtr = TextEditingController();
  TextEditingController contactPersonCtr = TextEditingController();
  TextEditingController albustanPersonCtr = TextEditingController();
  TextEditingController workstartTimeCtr = TextEditingController();
  TextEditingController workEndTimeCtr = TextEditingController();

  addCanteen() async {
    final uuid = const Uuid().v1();
    String image = '';
    if (canteenImage.value != null) {
      image = await uploapImageToFirebase(canteenImage.value!);
    }
    final canteenData = CanteenModel(
        docId: uuid,
        schoolName: schoolNameCtr.text,
        canteenId: canteenIdCtr.text,
        schoolAddress: schoolAddressCtr.text,
        contactPerson: contactPersonCtr.text,
        albustanPerson: albustanPersonCtr.text,
        workstartTime: workstartTimeCtr.text,
        workEndTime: workEndTimeCtr.text,
        image: image);
    await firestore
        .collection('CanteenList')
        .doc(uuid)
        .set(canteenData.toMap())
        .then(
      (value) {
        showToast(msg: "Canteen Added");
        schoolNameCtr.clear();
        canteenIdCtr.clear();
        schoolAddressCtr.clear();
        contactPersonCtr.clear();
        albustanPersonCtr.clear();
        workstartTimeCtr.clear();
        workEndTimeCtr.clear();
        canteenImage.value = null;
      },
    );
  }

  // for Picking images from gallery //
  pickImage() async {
    try {
      XFile? pickimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickimage != null) {
        return await pickimage.readAsBytes();
      }
    } catch (e) {
      // log(e.toString());
      log(e.toString());
    }
  }

  // images uploaded to firebase and return a image url //
  Future<String> uploapImageToFirebase(Uint8List image) async {
    String imageUrl = '';

    final imageName = 'image_${DateTime.now()}.jpg';
    Reference storageRef =
        dataserverStorage.ref().child('imagecollection$imageName');

    try {
      // final Uint8List imageByte = await image.readAsBytes();
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
