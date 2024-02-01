import 'package:canteen_superadmin_website/controller/pushnotification_controller/pushnotification_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleScreen extends StatelessWidget {
  final PushnotificationController pushnotificationController =
      Get.put(PushnotificationController());
  SampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
            onPressed: () async {
              pushnotificationController
                  .fetchalluserDeviceToken()
                  .then((value) async =>
                      await pushnotificationController.fetchAllEmployeesUid())
                  .then((value) async => await pushnotificationController
                      .fetchAllEmployeeDeviceID());
            },
            icon: const Icon(Icons.abc)),
      ),
    );
  }
}
