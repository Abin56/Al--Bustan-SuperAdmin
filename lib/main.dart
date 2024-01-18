import 'package:canteen_superadmin_website/firebase_options.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/delivery_adminpanel.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivered_list_widget.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/storeadmin_panel.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/screen/test.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/warehouse_adminpanel.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginSection(),
      // home: WareHouseAdminPanelScreen(),
      // home: DeliveryAdminPanelScreen()
      // home: Scaffold(body: DeliveredListWidget()),
    );
  }
}
