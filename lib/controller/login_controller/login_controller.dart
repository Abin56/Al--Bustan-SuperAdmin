import 'dart:developer';
import 'package:canteen_superadmin_website/core/constant/const.dart';
import 'package:canteen_superadmin_website/model/admin_model.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/delivery_adminpanel.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/storeadmin_panel.dart';
import 'package:canteen_superadmin_website/view/admins/super_Admin/super_adminpanel.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/warehouse_adminpanel.dart';
import 'package:canteen_superadmin_website/view/login/login_section/login_page.dart';
import 'package:canteen_superadmin_website/view/utils/shared_pref/shared_pref_helper.dart';
import 'package:canteen_superadmin_website/view/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserLoginController extends GetxController {
  TextEditingController editNameController = TextEditingController();
  TextEditingController editPhoneNoController = TextEditingController();
  RxBool isLoading = RxBool(false);

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Future<void> superAdminLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      )
          .then((value) async {
        final user = await FirebaseFirestore.instance
            .collection('SuperAdminAuthCollection')
            .doc(value.user?.uid)
            .get();
        if (user.data() != null) {
          final datsa = UserCredentialsController.adminmodel =
              AdminModel.fromMap(user.data()!);
          log("adminmodel$datsa");
        }
        if (UserCredentialsController.adminmodel?.userrole == "superadmin") {
          log("firebase user value ${UserCredentialsController.adminmodel?.userrole}");

          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.userRoleKey, 'superadmin');
          isLoading.value = false;
          emailcontroller.clear();
          passwordcontroller.clear();
          Get.offAll(const SuperAdminPanelScreen());
        } else {
          showToast(msg: "You are not a Super Admin");
          isLoading.value = false;
        }
      }).catchError((error) {
        if (error is FirebaseAuthException) {
          isLoading.value = false;
          handleFirebaseError(error);
        }
      });
    } catch (e) {
      isLoading.value = false;
      // showToast(msg: e.toString());
      showToast(msg: "Sign in failed");
    }
  }

  Future<void> storeAdminLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      )
          .then((value) async {
        final user = await FirebaseFirestore.instance
            .collection('AllUsersCollection')
            .doc(value.user?.uid)
            .get();
        if (user.data() != null) {
          final datsa = UserCredentialsController.adminmodel =
              AdminModel.fromMap(user.data()!);
          log("adminmodel$datsa");
        }
        if (UserCredentialsController.adminmodel?.userrole == "storeadmin") {
          log("firebase user value ${UserCredentialsController.adminmodel?.userrole}");

          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.userRoleKey, 'storeadmin');
          isLoading.value = false;
          emailcontroller.clear();
          passwordcontroller.clear();
          Get.offAll(const StoreAdminPanelScreen());
        } else {
          showToast(msg: "You are not a StoreAdmin");
          isLoading.value = false;
        }
      }).catchError((error) {
        if (error is FirebaseAuthException) {
          isLoading.value = false;
          handleFirebaseError(error);
        }
      });
    } catch (e) {
      isLoading.value = false;
      // showToast(msg: e.toString());
      showToast(msg: "Sign in failed");
    }
  }

  Future<void> deliveryAdminLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      )
          .then((value) async {
        final user = await FirebaseFirestore.instance
            .collection('AllUsersCollection')
            .doc(value.user?.uid)
            .get();
        if (user.data() != null) {
          final datsa = UserCredentialsController.adminmodel =
              AdminModel.fromMap(user.data()!);
          log("adminmodel$datsa");
        }
        if (UserCredentialsController.adminmodel?.userrole == "deliveryadmin") {
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.userRoleKey, 'deliveryadmin');
          isLoading.value = false;
          emailcontroller.clear();
          passwordcontroller.clear();
          Get.offAll(const DeliveryAdminPanelScreen());
        } else {
          showToast(msg: "You are not a DeliveryAdmin");
          isLoading.value = false;
        }
      }).catchError((error) {
        log(error.toString());
        if (error is FirebaseAuthException) {
          isLoading.value = false;
          handleFirebaseError(error);
        }
      });
    } catch (e) {
      isLoading.value = false;
      // showToast(msg: e.toString());
      showToast(msg: "Sign in failed");
    }
  }

  Future<void> wareHouseAdminLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      )
          .then((value) async {
        final user = await FirebaseFirestore.instance
            .collection('AllUsersCollection')
            .doc(value.user?.uid)
            .get();
        if (user.data() != null) {
          final datsa = UserCredentialsController.adminmodel =
              AdminModel.fromMap(user.data()!);
          log("adminmodel$datsa");
        }
        if (UserCredentialsController.adminmodel?.userrole ==
            "warehouseadmin") {
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.userRoleKey, 'warehouseadmin');
          isLoading.value = false;
          emailcontroller.clear();
          passwordcontroller.clear();
          Get.offAll( WareHouseAdminPanelScreen());
        } else {
          showToast(msg: "You are not a WarehouseAdmin");
          isLoading.value = false;
        }
      }).catchError((error) {
        if (error is FirebaseAuthException) {
          isLoading.value = false;
          handleFirebaseError(error);
        }
      });
    } catch (e) {
      isLoading.value = false;
      // showToast(msg: e.toString());
      showToast(msg: "Sign in failed");
    }
  }

  Future<void> nextpage() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredentialsController.userRole =
        SharedPreferencesHelper.getString(SharedPreferencesHelper.userRoleKey);
    await Future.delayed(const Duration(seconds: 2));
    log("message   .... ${UserCredentialsController.userRole}");
    if (auth.currentUser == null) {
      Get.offAll(() => const LoginSection());
    } else {
      if (UserCredentialsController.userRole == 'superadmin') {
        await checkSuperAdmin(auth);
      } else if (UserCredentialsController.userRole == 'deliveryadmin') {
        await checkDeliveryAdmin(auth);
      } else if (UserCredentialsController.userRole == 'warehouseadmin') {
        await checkWhereHouseAdmin(auth);
      } else if (UserCredentialsController.userRole == 'storeadmin') {
        await checkStoreAdmin(auth);
      } else if (UserCredentialsController.userRole == 'superadmin') {
        Get.offAll(() => const LoginSection());
      } else {
        Get.offAll(() => const LoginSection());
      }
    }
  }

  // Future<void> checkSuperAdmin(FirebaseAuth auth) async {
  //   final employedata = await FirebaseFirestore.instance
  //       .collection('SuperAdminAuthCollection')
  //       .doc(auth.currentUser?.uid)
  //       .get();

  //   if (employedata.data() != null) {
  //     UserCredentialsController.adminmodel =
  //         AdminModel.fromMap(employedata.data()!);
  //     Get.offAll(() => const LoginSection());
  //   } else {
  //     showToast(msg: "Please login again");
  //     Get.offAll(() => const LoginSection());
  //   }
  // }

  Future<void> checkSuperAdmin(FirebaseAuth auth) async {
    final employedata = await FirebaseFirestore.instance
        .collection('SuperAdminAuthCollection')
        .doc(auth.currentUser?.uid)
        .get();

    if (employedata.data() != null) {
      UserCredentialsController.adminmodel =
          AdminModel.fromMap(employedata.data()!);
      Get.offAll(() => const SuperAdminPanelScreen());
    } else {
      showToast(msg: "Please login again");
      Get.offAll(() => const LoginSection());
    }
  }

  Future<void> checkDeliveryAdmin(FirebaseAuth auth) async {
    final employedata = await FirebaseFirestore.instance
        .collection('AllUsersCollection')
        .doc(auth.currentUser?.uid)
        .get();

    if (employedata.data() != null) {
      UserCredentialsController.adminmodel =
          AdminModel.fromMap(employedata.data()!);
      Get.offAll(() => const DeliveryAdminPanelScreen());
    } else {
      showToast(msg: "Please login again");
      Get.offAll(() => const LoginSection());
    }
  }

  Future<void> checkStoreAdmin(FirebaseAuth auth) async {
    final employedata = await FirebaseFirestore.instance
        .collection('AllUsersCollection')
        .doc(auth.currentUser?.uid)
        .get();

    if (employedata.data() != null) {
      UserCredentialsController.adminmodel =
          AdminModel.fromMap(employedata.data()!);
      Get.offAll(() => const StoreAdminPanelScreen());
    } else {
      showToast(msg: "Please login again");
      Get.offAll(() => const LoginSection());
    }
  }

  Future<void> checkWhereHouseAdmin(FirebaseAuth auth) async {
    final employedata = await FirebaseFirestore.instance
        .collection('AllUsersCollection')
        .doc(auth.currentUser?.uid)
        .get();

    if (employedata.data() != null) {
      UserCredentialsController.adminmodel =
          AdminModel.fromMap(employedata.data()!);
      Get.offAll(() =>  WareHouseAdminPanelScreen());
    } else {
      showToast(msg: "Please login again");
      Get.offAll(() => const LoginSection());
    }
  }
}
