// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:canteen_superadmin_website/view/admin_panel/store_admin/invetory_sreen.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/appbar/app_bar.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/drawer/drawer.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/category_creation_widget.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/low_stock_alert_widget.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/returns_widget.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/store_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';

import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';

import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/dashboard_container.dart';

class StoreAdminPanelScreen extends StatefulWidget {
  const StoreAdminPanelScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StoreAdminPanelScreen> createState() => _StoreAdminPanelScreenState();
}

class _StoreAdminPanelScreenState extends State<StoreAdminPanelScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: SidebarDrawer(
            body: ListView(
              children: [const AppBarStoreAdmin(), pages[selectedIndex]],
            ),
            drawer: ListView(
              children: [
                Container(
                  color: cWhite,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      width: 60,
                                      child: Image.asset(
                                        'web_images/AL - Bustan.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    sWidtht10,
                                    GooglePoppinsWidgets(
                                      text: "AL BUSTAN",
                                      fontsize: 20,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GooglePoppinsWidgets(
                                      text: 'Store Admin', fontsize: 18),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 12),
                            child: Text(
                              "Main Menu",
                              style: TextStyle(
                                  color: cBlack.withOpacity(
                                    0.4,
                                  ),
                                  fontSize: 12),
                            ),
                          ),
                          sHeight10,
                          DrawerStoreAdmin(
                            selectedIndex: selectedIndex,
                            onTap: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

List<Widget> pages = [
  StoreDashboardContainer(), //..0
  CategoryCreationWidget(),
  InventoryWidget(),
  LowStockAlertWidget(),
  ReturnWidget()
];
