// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivered_list_widget.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_pending_widget.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_picked_up_widget.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_prodects.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_request.dart';
import 'package:canteen_superadmin_website/view/admins/screen/all_stock_list.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/all_stock_details_widget.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/category_creation_widget.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/low_stock_alert_widget.dart';
import 'package:canteen_superadmin_website/view/admins/super_Admin/appbar/app_bar.dart';
import 'package:canteen_superadmin_website/view/admins/super_Admin/drawer/drawer.dart';
import 'package:canteen_superadmin_website/view/admins/super_Admin/pages/user_assign_screen/user_assign_screen.dart';
import 'package:canteen_superadmin_website/view/admins/super_Admin/screen/super_admin_dashboard.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/screen/available_stock.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/screen/return_screen/return_screen.dart';
import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';

class SuperAdminPanelScreen extends StatefulWidget {
  const SuperAdminPanelScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SuperAdminPanelScreen> createState() => _SuperAdminPanelScreenState();
}

class _SuperAdminPanelScreenState extends State<SuperAdminPanelScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: SidebarDrawer(
            body: ListView(
              children: [
                const AppBarSuperAdmin(),
                // pages[widget.navvalue == 'storeadmin' ? 7 : 6],
                pages[selectedIndex]
              ],
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
                                    text: 'SUPER ADMIN',
                                    fontsize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                          DrawerSuperAdmin(
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
  SuperAdminDashboardContainer(), //..1
  // InventoryWidget(),
  AllStockList(),
  AvailableStockWidget(),
  LowStockAlertWidget(),
  ReturnScreen(),
  const CategoryCreationWidget(),
  ProductScreen(), //..1
  const DeliveryRequest(),
  DeliveryPendingList(),
  DeliveryPickedUpList(),
  DeliveredList(), //..4
  UserAssignListScreen(), //10

  //.
];
