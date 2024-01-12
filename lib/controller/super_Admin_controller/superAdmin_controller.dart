import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SuperAdminController extends GetxController {
  Future<void> createDeliveryAdmin(
      {required TextEditingController emailcontroller,
      required TextEditingController passwordcontroller}) async {
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(), password: passwordcontroller.text.trim());
    } catch (e) {}
  }
}
