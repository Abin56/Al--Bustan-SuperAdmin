// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:canteen_superadmin_website/controller/wearhouse_controller/wearhouse_controller.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivered_list_widget.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_assigning_widget.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_pending_widget.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_picked_up_widget.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_prodects.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_request.dart';
import 'package:canteen_superadmin_website/view/admins/screen/all_stock_list.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/category_creation_widget.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/low_stock_alert_widget.dart';
import 'package:canteen_superadmin_website/view/admins/super_Admin/pages/user_assign_screen/user_assign_screen.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/appbar/app_bar.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/screen/available_stock.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/screen/report.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/screen/return_screen/return_screen.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/screen/stock_upload_widget.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/screen/temporary_stock_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/dashboard_container.dart';

import 'drawer/drawer.dart';

class WareHouseAdminPanelScreen extends StatefulWidget {
  final warehouseCtr = Get.put(WearHouseController());
  WareHouseAdminPanelScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WareHouseAdminPanelScreen> createState() =>
      WareHouserAdminPanelScreenState();
}

class WareHouserAdminPanelScreenState extends State<WareHouseAdminPanelScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: SidebarDrawer(
            body: ListView(
              children: [
                const AppBarWarehouseAdmin(),
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
                                        'assests/web_images/AL - Bustan.png',
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
                                    text: 'WAREHOUSE ADMIN',
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
                          DrawerWareHouseAdmin(
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
  const DashboardContainer(), //..1
  StockUploadWidget(),
  TemporaryStockWidget(),
  // InventoryWidget(),
  AllStockList(),
  const CategoryCreationWidget(),
  ProductScreen(), //..1
  const DeliveryRequest(), //..2
  DeliveryScreen(), //..3
  DeliveredList(), //..4
  DeliveryPendingList(), //..5
  DeliveryPickedUpList(), //

  LowStockAlertWidget(),
  const ReturnScreen(),

  UserAssignListScreen(),
  AvailableStockWidget(), //10
  Reports(), //15
  UserAssignListScreen(), //11
  UserAssignListScreen(), //12
  UserAssignListScreen(), //13
  UserAssignListScreen(), //14
];
