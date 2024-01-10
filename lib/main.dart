import 'dart:developer';

import 'package:canteen_superadmin_website/firebase_options.dart';
import 'package:canteen_superadmin_website/view/admin_panel/inventory/category_widget.dart';
import 'package:canteen_superadmin_website/view/delivery_panal/delivery_screen/delivery_screen.dart';
import 'package:canteen_superadmin_website/view/delivery_panal/delivery_screen/prodects.dart';
import 'package:canteen_superadmin_website/view/login/login_section/login_page.dart';
import 'package:canteen_superadmin_website/view/welcome_screen/welcome_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance
      .activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  )
      .catchError((e) {
    log(e.toString());
  });

  await FirebaseAppCheck.instance.getToken().catchError((e) {
    log(e.toString());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginSection(),
      // home: Scaffold(body: CartWiget()),
    );
  }
}
