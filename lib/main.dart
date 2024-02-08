import 'package:canteen_superadmin_website/firebase_options.dart';
import 'package:canteen_superadmin_website/scroll_on_web_widget.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_prodects.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/screen/report.dart';
import 'package:canteen_superadmin_website/view/home/home.dart';
import 'package:canteen_superadmin_website/view/utils/shared_pref/shared_pref_helper.dart';
import 'package:canteen_superadmin_website/view/welcome_screen/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferencesHelper.initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      // home: const HomeScreen(),
      home: Scaffold(
        body: Center(
          child: Reports(),
        ),
      ),
    );
  }
}
