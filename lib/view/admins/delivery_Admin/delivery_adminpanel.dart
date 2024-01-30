// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:canteen_superadmin_website/view/admins/delivery_Admin/appbar/app_bar.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/drawer/drawer.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivered_list_widget.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_dashboard.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_assigning_widget.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_pending_widget.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_picked_up_widget.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_prodects.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_request.dart';
import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';

import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';

import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/dashboard_container.dart';

class DeliveryAdminPanelScreen extends StatefulWidget {
  const DeliveryAdminPanelScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DeliveryAdminPanelScreen> createState() =>
      _DeliveryAdminPanelScreenState();
}

class _DeliveryAdminPanelScreenState extends State<DeliveryAdminPanelScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: SidebarDrawer(
            body: ListView(
              children: [
                const AppBarDeliveryAdmin(),
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
                                      text: 'Delivery Admin', fontsize: 18),
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
                          DrawerDeliveryAdmin(
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
  DeliveryDashboardContainer(), //..0
  ProductScreen(), //..1
  const DeliveryRequest(), //..2
  DeliveryScreen(), //..3
  DeliveredList(), //..4
  DeliveryPendingList(), //..5
  DeliveryPickedUpList(), //..6
];
