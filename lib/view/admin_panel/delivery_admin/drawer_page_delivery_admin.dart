// ignore_for_file: must_be_immutable

import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeliveryDrawerSelectedPagesSection extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  DeliveryDrawerSelectedPagesSection({
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
          tileColor: selectedIndex == 6
              ? themeColorBlue.withOpacity(0.1)
              : Colors.transparent,
          onTap: () {
            index = 6;
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
        ExpansionTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/supplier.png'),
          title: DashboardTextFontWidget(
            title: 'Delivery Panal',
          ),
          children: <Widget>[
            ListTile(
              tileColor: selectedIndex == 10
                  ? themeColorBlue.withOpacity(0.1)
                  : Colors.transparent,
              onTap: () {
                index = 10;
                onTap.call(index);
              },
              title: DashboardTextFontWidget(
                title: 'Create Order',
              ),
            ),
            ListTile(
              tileColor: selectedIndex == 11
                  ? themeColorBlue.withOpacity(0.1)
                  : Colors.transparent,
              onTap: () {
                index = 11;
                onTap.call(index);
              },
              title: DashboardTextFontWidget(
                title: 'Final orders',
              ),
            ),
            ListTile(
              tileColor: selectedIndex == 12
                  ? themeColorBlue.withOpacity(0.1)
                  : Colors.transparent,
              onTap: () {
                index = 12;
                onTap.call(index);
              },
              title: DashboardTextFontWidget(
                title: 'Delivery request',
              ),
              trailing: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('EmployeeDeliveryRequest')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox();
                  } else if (snapshot.data!.docs.isEmpty) {
                    return const SizedBox();
                  } else if (!snapshot.hasData) {
                    return const SizedBox();
                  } else {
                    return CircleAvatar(
                      backgroundColor: cred,
                      radius: 12,
                      child: Center(
                        child: GooglePoppinsWidgets(
                          text: snapshot.data!.docs.length.toString(),
                          fontsize: 11,
                          color: cWhite,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            ListTile(
              tileColor: selectedIndex == 13
                  ? themeColorBlue.withOpacity(0.1)
                  : Colors.transparent,
              onTap: () {
                index = 13;
                onTap.call(index);
              },
              title: DashboardTextFontWidget(
                title: 'Pending Deliveries',
              ),
            ),
            ListTile(
              tileColor: selectedIndex == 14
                  ? themeColorBlue.withOpacity(0.1)
                  : Colors.transparent,
              onTap: () {
                index = 14;
                onTap.call(index);
              },
              title: DashboardTextFontWidget(
                title: 'Picked Orders',
              ),
            ),
            ListTile(
              tileColor: selectedIndex == 15
                  ? themeColorBlue.withOpacity(0.1)
                  : Colors.transparent,
              onTap: () {
                index = 15;
                onTap.call(index);
              },
              title: DashboardTextFontWidget(
                title: 'Delivered orders',
              ),
            ),
          ],
        ),

        sHeight10,
        ExpansionTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/purchase.png'),
          title: DashboardTextFontWidget(
            title: 'Purchase',
          ),
          // children: <Widget>[
          //   ListTile(
          //     tileColor: selectedIndex == 2
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 2;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Supplier Return',
          //     ),
          //   ),
          //   ListTile(
          //     tileColor: selectedIndex == 3
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 3;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Teachers',
          //     ),
          //   ),
          //   ListTile(
          //     tileColor: selectedIndex == 6
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 6;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Non teaching staffs',
          //     ),
          //   ),
          // ],
        ),
        sHeight10,
        ExpansionTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/product-return.png'),
          title: DashboardTextFontWidget(
            title: 'Supplier Return',
          ),
          // children: <Widget>[
          //   ListTile(
          //     tileColor: selectedIndex == 5
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 5;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Students',
          //     ),
          //   ),
          //   ListTile(
          //     tileColor: selectedIndex == 6
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 6;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Teachers',
          //     ),
          //   ),
          //   ListTile(
          //     tileColor: selectedIndex == 7
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 7;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Non teaching staffs',
          //     ),
          //   ),
          // ],
        ),
        sHeight10,
        ExpansionTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/invoice.png'),
          title: DashboardTextFontWidget(
            title: 'Invoice',
          ),
          // children: <Widget>[
          //   ListTile(
          //     tileColor: selectedIndex == 8
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 8;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Class Test',
          //     ),
          //   ),
          //   ListTile(
          //     tileColor: selectedIndex == 9
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 9;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'School Test',
          //     ),
          //   ),
          //   ListTile(
          //     tileColor: selectedIndex == 10
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 10;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'School level exams',
          //     ),
          //   ),
          //   ListTile(
          //     tileColor: selectedIndex == 11
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 11;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Public level exams',
          //     ),
          //   ),
          // ],
        ),
        sHeight10,
        ExpansionTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/sale.png'),
          title: DashboardTextFontWidget(
            title: 'Sale',
          ),
          // children: <Widget>[
          //   ListTile(
          //     tileColor: selectedIndex == 12
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 12;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Students',
          //     ),
          //   ),
          //   ListTile(
          //     tileColor: selectedIndex == 13
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 13;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Teachers',
          //     ),
          //   ),
          //   ListTile(
          //     tileColor: selectedIndex == 14
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 14;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Non teaching staffs',
          //     ),
          //   ),
          // ],
        ),
        sHeight10,
        ExpansionTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/bill.png'),
          title: DashboardTextFontWidget(
            title: 'Bill',
          ),
          // children: <Widget>[
          //   ListTile(
          //     tileColor: selectedIndex == 15
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 15;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Students',
          //     ),
          //   ),
          //   ListTile(
          //     tileColor: selectedIndex == 16
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 4;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Teachers',
          //     ),
          //   ),
          //   ListTile(
          //     tileColor: selectedIndex == 17
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 17;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Parents',
          //     ),
          //   ),
          // ],
        ),
        sHeight10,
        ExpansionTile(
          leading: const DashBoardIconWidget(
              image: 'web_images/drawer_images/customer.png'),
          title: DashboardTextFontWidget(
            title: 'Customer',
          ),
          // children: <Widget>[
          //   ListTile(
          //     tileColor: selectedIndex == 18
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 18;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Students',
          //     ),
          //   ),
          //   ListTile(
          //     tileColor: selectedIndex == 19
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 19;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Teachers',
          //     ),
          //   ),
          //   ListTile(
          //     tileColor: selectedIndex == 20
          //         ? themeColorBlue.withOpacity(0.1)
          //         : Colors.transparent,
          //     onTap: () {
          //       index = 20;
          //       onTap.call(index);
          //     },
          //     title: DashboardTextFontWidget(
          //       title: 'Parents',
          //     ),
          //   ),
          // ],
        ),
        // sHeight10,
        // ExpansionTile(
        //   leading: const DashBoardIconWidget(
        //       image: 'web_images/drawer_images/supplier.png'),
        //   textColor: Colors.amber,
        //   title: DashboardTextFontWidget(
        //     title: 'Supplier',
        //   ),
        // children: <Widget>[
        //   ListTile(
        //     tileColor: selectedIndex == 21
        //         ? themeColorBlue.withOpacity(0.1)
        //         : Colors.transparent,
        //     onTap: () {
        //       index = 21;
        //       onTap.call(index);
        //     },
        //     title: DashboardTextFontWidget(
        //       title: 'PTA',
        //     ),
        //   ),
        //   ListTile(
        //     tileColor: selectedIndex == 22
        //         ? themeColorBlue.withOpacity(0.1)
        //         : Colors.transparent,
        //     onTap: () {
        //       index = 22;
        //       onTap.call(index);
        //     },
        //     title: DashboardTextFontWidget(
        //       title: 'Mothers PTA',
        //     ),
        //   ),
        //   ListTile(
        //     tileColor: selectedIndex == 23
        //         ? themeColorBlue.withOpacity(0.1)
        //         : Colors.transparent,
        //     onTap: () {
        //       index = 23;
        //       onTap.call(index);
        //     },
        //     title: DashboardTextFontWidget(
        //       title: 'Parents Meeting',
        //     ),
        //   ),
        //   ListTile(
        //     tileColor: selectedIndex == 24
        //         ? themeColorBlue.withOpacity(0.1)
        //         : Colors.transparent,
        //     onTap: () {
        //       index = 24;
        //       onTap.call(index);
        //     },
        //     title: DashboardTextFontWidget(
        //       title: 'Teachers Meeting',
        //     ),
        //   ),
        //   ListTile(
        //     tileColor: selectedIndex == 25
        //         ? themeColorBlue.withOpacity(0.1)
        //         : Colors.transparent,
        //     onTap: () {
        //       index = 25;
        //       onTap.call(index);
        //     },
        //     title: DashboardTextFontWidget(
        //       title: 'Custom Meeting',
        //     ),
        //   ),
        // ],
        // ),
        // sHeight10,
        // ListTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('assests/png/notification.png')),
        //   tileColor: selectedIndex == 26
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 26;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Notifications',
        //   ),
        // ),
        // sHeight10,
        // ListTile(
        //   leading: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Image.asset('assests/png/tracking.png')),
        //   tileColor: selectedIndex == 27
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 27;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Bus Tracking',
        //   ),
        // ),
        // sHeight10,
        // ListTile(
        //   tileColor: selectedIndex == 28
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 28;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Create Admin',
        //   ),
        // ),
        // sHeight10,
        // ListTile(
        //   tileColor: selectedIndex == 29
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 29;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'General Instructions',
        //   ),
        // ),
        // sHeight10,
        // ListTile(
        //   tileColor: selectedIndex == 30
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 30;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'General Instructions',
        //   ),
        // ),
        // sHeight10,
        // ListTile(
        //   tileColor: selectedIndex == 31
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 31;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Fees and bills',
        //   ),
        // ),
        // sHeight10,
        // ListTile(
        //   tileColor: selectedIndex == 32
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 32;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Alumni Associations',
        //   ),
        // ),
        // sHeight10,
        // ListTile(
        //   tileColor: selectedIndex == 33
        //       ? themeColorBlue.withOpacity(0.1)
        //       : Colors.transparent,
        //   onTap: () {
        //     index = 33;
        //     onTap.call(index);
        //   },
        //   title: DashboardTextFontWidget(
        //     title: 'Class promotions',
        //   ),
        // ),
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
