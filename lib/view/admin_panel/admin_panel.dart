// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:canteen_superadmin_website/view/admin_panel/delivery_admin/status_screen/delivery_status.dart';
import 'package:canteen_superadmin_website/view/admin_panel/delivery_admin/status_screen/pending_status.dart';
import 'package:canteen_superadmin_website/view/admin_panel/delivery_admin/status_screen/pending_status/pickuped_status.dart';
import 'package:canteen_superadmin_website/view/admin_panel/store_admin/all_stock_details_widget.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/all_stock_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:canteen_superadmin_website/view/admin_panel/admin_appBar.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_dashboard.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_request.dart';
import 'package:canteen_superadmin_website/view/admin_panel/delivery_admin/drawer_page_delivery_admin.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/category_widget.dart';
import 'package:canteen_superadmin_website/view/admin_panel/store_admin/invetory_sreen.dart';
import 'package:canteen_superadmin_website/view/admin_panel/store_admin/product_temporary_list.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/unit_widget.dart';
import 'package:canteen_superadmin_website/view/admin_panel/store_admin/store_request.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/subcategory_widget.dart';
import 'package:canteen_superadmin_website/view/admin_panel/store_admin/drawer_page_store_admin.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/store_dashboard.dart';
import 'package:canteen_superadmin_website/view/admin_panel/tempory_productList/table_listview.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_order.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/delivery_prodects.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/dashboard_container.dart';

class AdminHomeScreen extends StatefulWidget {
  final String navvalue;
  const AdminHomeScreen({
    Key? key,
    required this.navvalue,
  }) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.navvalue == 'storeadmin' ? 7 : 6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: SidebarDrawer(
            body: ListView(
              children: [
                AppBarAdminPanel(),
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
                                      text: widget.navvalue == "storeadmin"
                                          ? "Store Admin"
                                          : 'Delivery Admin',
                                      fontsize: 18),
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
                          widget.navvalue == 'storeadmin'
                              ? StoreDrawerSelectedPagesSection(
                                  selectedIndex: selectedIndex,
                                  onTap: (index) {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                )
                              : DeliveryDrawerSelectedPagesSection(
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
  AllStockDetails(),
  // InventoryWidget(), //..2
  StoreRequetWidget(), //..3
  CategoryWidget(), //..4
  SubCategoryWidget(), //..5
  UnitWidget(), //..6
  DeliveryDashboardContainer(), //..7
  StoreDashboardContainer(), //..8
  TableListviewWidget(), //..9
  ProductTempWidget(), //..10
  ProductScreen(), //..11
  DeliveryScreen(), //..12
  const DeliveryRequest(), //..13
  const PendingOrdersStatusScreen(), //..14
  const PickedOrdersStatusScreen(), //..15
  const DeliveryStatusScreen(), //..16
  Center(
    child: Text(sideMenu[8]),
  ),
  const DashboardContainer(),
  AllStockDetails(),
  // InventoryWidget(),
  StoreRequetWidget(),
  CategoryWidget(),
  SubCategoryWidget(),
  UnitWidget(),
  DeliveryDashboardContainer(),
  StoreDashboardContainer(),
  Center(
    child: TableListviewWidget(),
  ),
  Center(child: ProductTempWidget()),
  Center(
    child: ProductScreen(),
  ),
  Center(
    child: DeliveryScreen(),
  ),
  const Center(child: DeliveryRequest()),
  // AllStockDetailsWidget(),
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
//                                     'web_images/AL - Bustan.png',
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
