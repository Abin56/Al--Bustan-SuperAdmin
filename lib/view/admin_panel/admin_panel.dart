import 'package:canteen_superadmin_website/view/admin_panel/admin_appBar.dart';
import 'package:canteen_superadmin_website/view/admin_panel/delivery_screen/delivery_screen.dart';

import 'package:canteen_superadmin_website/view/admin_panel/drawer_pages/drawer_pages.dart';
import 'package:canteen_superadmin_website/view/admin_panel/inventory/invetory_sreen.dart';
import 'package:canteen_superadmin_website/view/admin_panel/inventory/product_temporary_list.dart';
import 'package:canteen_superadmin_website/view/admin_panel/inventory/store_request.dart';
import 'package:canteen_superadmin_website/view/admin_panel/product%20details/product_details.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/dashboard_container.dart';
import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: SidebarDrawer(
            body: ListView(
              children: [
                const AppBarAdminPanel(),
                pages[selectedIndex],
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
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 60,
                                  child: Image.asset(
                                    'assets/AL - Bustan.png',
                                    fit: BoxFit.fill,
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
                          DrawerSelectedPagesSection(
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
  const DashboardContainer(),
  InventoryWidget(),
  StoreRequetWidget(),
  const ProductDetails(),
  const DeliveryScreen(
    products: [],
  ),
  Text(sideMenu[2]),
  const ProductDetails(),
  Center(
    child: ProductTempWidget(),
  ),
  Center(
    child: Text(sideMenu[4]),
  ),
  Center(
    child: Text(sideMenu[5]),
  ),
  Center(
    child: Text(sideMenu[6]),
  ),
  Center(
    child: Text(sideMenu[7]),
  ),
  Center(
    child: Text(sideMenu[8]),
  ),
  Center(
    child: Text(sideMenu[9]),
  ),
  Center(
    child: Text(sideMenu[10]),
  ),
  Center(
    child: Text(sideMenu[11]),
  ),
];
List<String> sideMenu = [
  'Attendence',
  'Food Manage',
  'Rooms Manage',
  'Leave Requests',
  'Visitors Pass',
  'Students Manage',
  'Students Payment',
  'Employee Manage',
  'Bill Manage',
  'Notice Board',
  'Settings',
  'Rules',
];


















// import 'package:canteen_superadmin_website/view/admin_panel/admin_appBar.dart';
// import 'package:canteen_superadmin_website/view/admin_panel/drawer_pages/drawer_pages.dart';
// import 'package:canteen_superadmin_website/view/admin_panel/inventory/invetory_sreen.dart';
// import 'package:canteen_superadmin_website/view/admin_panel/inventory/store_request.dart';
// import 'package:canteen_superadmin_website/view/colors/colors.dart';
// import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
// import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
// import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/dashboard_container.dart';
// import 'package:flutter/material.dart';
// import 'package:sidebar_drawer/sidebar_drawer.dart';

// class AdminHomeScreen extends StatefulWidget {
//   const AdminHomeScreen({super.key});

//   @override
//   State<AdminHomeScreen> createState() => _AdminHomeScreenState();
// }

// class _AdminHomeScreenState extends State<AdminHomeScreen> {
//   int selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: cWhite,
//       body: SafeArea(
//         child: SidebarDrawer(
//             body: ListView(
//               children: [
//                 const AppBarAdminPanel(),
//                 pages[selectedIndex],
//               ],
//             ),
//             drawer: ListView(
//               children: [
//                 Container(
//                   color: cWhite,
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(0),
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   height: 60,
//                                   child: Image.asset(
//                                     'assets/AL - Bustan.png',
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                                 sWidtht10,
//                                 GooglePoppinsWidgets(
//                                   text: "AL BUSTAN",
//                                   fontsize: 20,
//                                   fontWeight: FontWeight.w500,
//                                 )
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 10, top: 12),
//                             child: Text(
//                               "Main Menu",
//                               style: TextStyle(
//                                   color: cBlack.withOpacity(
//                                     0.4,
//                                   ),
//                                   fontSize: 12),
//                             ),
//                           ),
//                           sHeight10,
//                           DrawerSelectedPagesSection(
//                             selectedIndex: selectedIndex,
//                             onTap: (index) {
//                               setState(() {
//                                 selectedIndex = index;
//                               });
//                             },
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )),
//       ),
//     );
//   }
// }

// List<Widget> pages = [
//   const Center(
//     child: DashboardContainer(),
//   ),
//   Center(
//     child: InventoryWidget(),
//   ),
//   const Center(
//     child: const StoreRequetWidget(),
//   ),
//   Center(
//     child: Text(sideMenu[5]),
//   ),
//   Center(
//     child: Text(sideMenu[5]),
//   ),
//   Center(
//     child: Text(sideMenu[6]),
//   ),
//   Center(
//     child: Text(sideMenu[7]),
//   ),
//   Center(
//     child: Text(sideMenu[8]),
//   ),
//   Center(
//     child: Text(sideMenu[9]),
//   ),
//   Center(
//     child: Text(sideMenu[10]),
//   ),
//   Center(
//     child: Text(sideMenu[11]),
//   ),
// ];
// List<String> sideMenu = [
//   'Attendence',
//   'Food Manage',
//   'Rooms Manage',
//   'Leave Requests',
//   'Visitors Pass',
//   'Students Manage',
//   'Students Payment',
//   'Employee Manage',
//   'Bill Manage',
//   'Notice Board',
//   'Settings',
//   'Rules',
// ];
