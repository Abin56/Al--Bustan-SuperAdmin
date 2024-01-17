import 'package:canteen_superadmin_website/firebase_options.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/storeadmin_panel.dart';
import 'package:canteen_superadmin_website/view/admins/super_Admin/super_adminpanel.dart';
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
      home: SuperAdminPanelScreen(),
    );
  }
}
