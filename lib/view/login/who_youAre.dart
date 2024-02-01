import 'package:canteen_superadmin_website/controller/login_controller/login_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/view/login/login_section/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> whoAreYou(context) async {
  return showModalBottomSheet(
      backgroundColor: cWhite,
      context: context,
      builder: (builder) {
        return SizedBox(
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LoginContainerWidget(
                      onTap: () async {
                        await Get.find<UserLoginController>().superAdminLogin();
                      },
                      text: 'Super Admin',
                      imagepath: 'web_images/super_Admin.jpg',
                      value: 'superadmin'),
                  LoginContainerWidget(
                      onTap: () async {
                        print("object");
                        await Get.find<UserLoginController>()
                            .wareHouseAdminLogin();
                      },
                      text: 'WareHouse\n    Admin',
                      imagepath: 'web_images/warehouse_Admin.jpg',
                      value: 'warehouseadmin'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LoginContainerWidget(
                      onTap: () async {
                        await Get.find<UserLoginController>().storeAdminLogin();
                      },
                      text: 'Store Admin',
                      imagepath: 'web_images/store_Admin.jpg',
                      value: 'storeadmin'),
                  LoginContainerWidget(
                      onTap: () async {
                        await Get.find<UserLoginController>()
                            .deliveryAdminLogin();
                      },
                      text: 'Delivery Admin',
                      imagepath: 'web_images/delivery_admin.jpg',
                      value: 'deliveryadmin')
                ],
              )
            ],
          ),
        );
      });
}
