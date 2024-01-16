import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/firebase_options.dart';
import 'package:canteen_superadmin_website/view/admin_panel/admin_panel.dart';
import 'package:canteen_superadmin_website/view/admin_panel/delivery_admin/status_screen/pending_status.dart';
import 'package:canteen_superadmin_website/view/admin_panel/delivery_admin/status_screen/pending_status/pickuped_status.dart';
import 'package:canteen_superadmin_website/view/login/login_section/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginSection(),
      home: Scaffold(
          backgroundColor: cWhite,
          body: Center(child: PickedOrdersStatusScreen())),
    );
  }
}
