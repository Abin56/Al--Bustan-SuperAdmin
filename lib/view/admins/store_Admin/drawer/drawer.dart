// ignore_for_file: must_be_immutable

import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:flutter/material.dart';

class DrawerStoreAdmin extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  DrawerStoreAdmin({
    required this.selectedIndex,
    required this.onTap,
    super.key,
  });

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/dashboard.png'),
          tileColor: selectedIndex == 0
              ? themeColorBlue.withOpacity(0.1)
              : Colors.transparent,
          onTap: () {
            index = 0;
            onTap.call(index);
          },
          title: Row(
            children: [
              DashboardTextFontWidget(
                title: 'Dashboard',
              ),
            ],
          ),
        ),
        ListTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/all_orders.png'),
          tileColor: selectedIndex == 2
              ? themeColorBlue.withOpacity(0.1)
              : Colors.transparent,
          onTap: () {
            index = 2;
            onTap.call(index);
          },
          title: Row(
            children: [
              DashboardTextFontWidget(
                title: 'All Products',
              ),
            ],
          ),
        ),
        ListTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/avilable_products.png'),
          tileColor: selectedIndex == 2
              ? themeColorBlue.withOpacity(0.1)
              : Colors.transparent,
          onTap: () {
            index = 2;
            onTap.call(index);
          },
          title: Row(
            children: [
              DashboardTextFontWidget(
                title: 'Available Products',
              ),
            ],
          ),
        ),
        ListTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/alert.png'),
          tileColor: selectedIndex == 3
              ? themeColorBlue.withOpacity(0.1)
              : Colors.transparent,
          onTap: () {
            index = 3;
            onTap.call(index);
          },
          title: Row(
            children: [
              DashboardTextFontWidget(
                title: 'LowStock Alert',
              ),
            ],
          ),
        ),
        ListTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/picked_orders.png'),
          tileColor: selectedIndex == 4
              ? themeColorBlue.withOpacity(0.1)
              : Colors.transparent,
          onTap: () {
            index = 4;
            onTap.call(index);
          },
          title: Row(
            children: [
              DashboardTextFontWidget(
                title: 'Returns',
              ),
            ],
          ),
        ),
        ListTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/categorization.png'),
          tileColor: selectedIndex == 1
              ? themeColorBlue.withOpacity(0.1)
              : Colors.transparent,
          onTap: () {
            index = 1;
            onTap.call(index);
          },
          title: Row(
            children: [
              DashboardTextFontWidget(
                title: 'Create Categorization',
              ),
            ],
          ),
        ),
        sHeight10,
        ExpansionTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/purchase.png'),
          title: DashboardTextFontWidget(
            title: 'Purchase',
          ),
        ),
        sHeight10,
        ExpansionTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/product-return.png'),
          title: DashboardTextFontWidget(
            title: 'Supplier Return',
          ),
        ),
        sHeight10,
        ExpansionTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/invoice.png'),
          title: DashboardTextFontWidget(
            title: 'Invoice',
          ),
        ),
        sHeight10,
        ExpansionTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/sale.png'),
          title: DashboardTextFontWidget(
            title: 'Sale',
          ),
        ),
      ],
    );
  }
}

class DashBoardIconWidget extends StatelessWidget {
  const DashBoardIconWidget({
    required this.image,
    super.key,
  });

  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 25, width: 25, child: Image.asset(image));
  }
}

class DashboardTextFontWidget extends StatelessWidget {
  String title;
  DashboardTextFontWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 16, color: cBlack.withOpacity(0.7)),
    );
  }
}
    //  ExpansionTile(
    //       leading: const DashBoardIconWidget(
    //           image: 'web_images/drawer_images/supplier.png'),
    //       title: DashboardTextFontWidget(
    //         title: 'Delivery Panal',
    //       ),
    //       children: <Widget>[
    //         ListTile(
    //           tileColor: selectedIndex == 10
    //               ? themeColorBlue.withOpacity(0.1)
    //               : Colors.transparent,
    //           onTap: () {
    //             index = 10;
    //             onTap.call(index);
    //           },
    //           title: DashboardTextFontWidget(
    //             title: 'Create Order',
    //           ),
    //         ),
    //         ListTile(
    //           tileColor: selectedIndex == 11
    //               ? themeColorBlue.withOpacity(0.1)
    //               : Colors.transparent,
    //           onTap: () {
    //             index = 11;
    //             onTap.call(index);
    //           },
    //           title: DashboardTextFontWidget(
    //             title: 'All orders',
    //           ),
    //         ),
    //         ListTile(
    //           tileColor: selectedIndex == 12
    //               ? themeColorBlue.withOpacity(0.1)
    //               : Colors.transparent,
    //           onTap: () {
    //             index = 12;
    //             onTap.call(index);
    //           },
    //           title: DashboardTextFontWidget(
    //             title: 'Delivery request',
    //           ),
    //           trailing: StreamBuilder(
    //             stream: FirebaseFirestore.instance
    //                 .collection('EmployeeDeliveryRequest')
    //                 .snapshots(),
    //             builder: (context, snapshot) {
    //               if (snapshot.connectionState == ConnectionState.waiting) {
    //                 return const SizedBox();
    //               } else if (snapshot.data!.docs.isEmpty) {
    //                 return const SizedBox();
    //               } else if (!snapshot.hasData) {
    //                 return const SizedBox();
    //               } else {
    //                 return CircleAvatar(
    //                   backgroundColor: cred,
    //                   radius: 12,
    //                   child: Center(
    //                     child: GooglePoppinsWidgets(
    //                       text: snapshot.data!.docs.length.toString(),
    //                       fontsize: 11,
    //                       color: cWhite,
    //                     ),
    //                   ),
    //                 );
    //               }
    //             },
    //           ),
    //         ),
    //         ListTile(
    //           tileColor: selectedIndex == 13
    //               ? themeColorBlue.withOpacity(0.1)
    //               : Colors.transparent,
    //           onTap: () {
    //             index = 13;
    //             onTap.call(index);
    //           },
    //           title: DashboardTextFontWidget(
    //             title: 'Pending Deliveries',
    //           ),
    //         ),
    //         ListTile(
    //           tileColor: selectedIndex == 14
    //               ? themeColorBlue.withOpacity(0.1)
    //               : Colors.transparent,
    //           onTap: () {
    //             index = 14;
    //             onTap.call(index);
    //           },
    //           title: DashboardTextFontWidget(
    //             title: 'Picked Orders',
    //           ),
    //         ),
    //         ListTile(
    //           tileColor: selectedIndex == 15
    //               ? themeColorBlue.withOpacity(0.1)
    //               : Colors.transparent,
    //           onTap: () {
    //             index = 15;
    //             onTap.call(index);
    //           },
    //           title: DashboardTextFontWidget(
    //             title: 'Delivered orders',
    //           ),
    //         ),
    //       ],
    //     ),