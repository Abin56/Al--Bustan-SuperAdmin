import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/model/notification_model/notification_model.dart';
import 'package:canteen_superadmin_website/view/admin_panel/employee_request/employee_request.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/core/fonts/text_widget.dart';
import 'package:canteen_superadmin_website/view/pages/notification_messagetile/notification_messagetile.dart';
import 'package:canteen_superadmin_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';

class AppBarWarehouseAdmin extends StatefulWidget {
  const AppBarWarehouseAdmin({
    super.key,
  });

  @override
  State<AppBarWarehouseAdmin> createState() => _AppBarWarehouseAdminState();
}

class _AppBarWarehouseAdminState extends State<AppBarWarehouseAdmin> {
  OverlayState? overlayState;
  OverlayEntry? overlayEntry;
  OverlayEntry? overlayEntry2;
  OverlayEntry? overlayEntry3;
  bool showOverlay = false;
  int index = 0;
  final layerLink = LayerLink();
  final textButtonFocusNode = FocusNode();
  final textButtonFocusNode1 = FocusNode();
  final textButtonFocusNode2 = FocusNode();

  @override
  void initState() {
    textButtonFocusNode.addListener(() {
      if (textButtonFocusNode.hasFocus) {
        _showOverlay(context, 0);
      } else {
        removeOverlay();
      }
    });
    textButtonFocusNode1.addListener(() {
      if (textButtonFocusNode1.hasFocus) {
        _showOverlay(context, 1);
      } else {
        removeOverlay();
      }
    });
    textButtonFocusNode2.addListener(() {
      if (textButtonFocusNode2.hasFocus) {
        _showOverlay(context, 2);
      } else {
        removeOverlay();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    return PreferredSize(
      preferredSize: const Size.fromHeight(100.0),
      child: Container(
        color: Colors.white24,
        height: 70,
        width: double.infinity,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: AppColors.backGroundColor),
                  child: const DrawerIcon(),
                ),
              ],
            ),
            sWidtht10,
            SizedBox(
              height: 40,
              width: sizeW * 0.3,
              child: const CupertinoSearchTextField(
                placeholder: 'Search anything',
                decoration: BoxDecoration(
                  color: AppColors.lightGreyColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            const Spacer(),

            Tooltip(
              preferBelow: false,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              message: "Logout",
              child: IconButton(
                  onPressed: () async {
                    await logoutUser();
                  },
                  icon: const Icon(Icons.power_settings_new_outlined)),
            ),
            SizedBox(
              width: 50,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, right: 10),
                        child: IconButton(
                            focusNode: textButtonFocusNode1,
                            onPressed: () {
                              aweSideSheet(
                                header: DefaultTabController(
                                  length: 2,
                                  child: SizedBox(
                                    height: 80,
                                    child: AppBar(
                                      bottom: TabBar(
                                        // indicatorColor: Colors.grey,
                                        labelColor: Colors.black,
                                        unselectedLabelColor: Colors.grey,
                                        tabs: [
                                          Tab(
                                            //icon: const Icon(Icons.production_quantity_limits_rounded),
                                            child: GooglePoppinsWidgets(
                                              text: "All Messages",
                                              fontsize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Tab(
                                            child: GooglePoppinsWidgets(
                                              text: "Warings",
                                              fontsize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            // icon: Icon(
                                            //   Icons.location_history,
                                            // ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                body: StreamBuilder(
                                    stream: dataserver
                                        .collection('Notification_Collection')
                                        .snapshots(),
                                    builder: (context, snap) {
                                      return ListView.separated(
                                          itemBuilder: (context, index) {
                                            final data =
                                                NotificationModel.fromMap(snap
                                                    .data!.docs[index]
                                                    .data());
                                            return NotificationMessageTile(
                                              icon: data.icon,
                                              messageText: data.messageText,
                                              headerText: data.headerText,
                                              whiteshadeColor:
                                                  data.whiteshadeColor,
                                              containerColor:
                                                  data.containerColor,
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(
                                              height: 01,
                                            );
                                          },
                                          itemCount: snap.data!.docs.length);
                                    }),
                                context: context,
                                sheetPosition: SheetPosition.right,
                              );
                              showOverlay = true;
                              //.................... Notification
                              // ResponsiveWebSite.isDesktop(context)
                              //     ? textButtonFocusNode1.requestFocus()
                              //     : appBarNotificationBox(context);
                            },
                            icon: Icon(
                              Icons.notifications_none_outlined,
                              color: cBlack.withOpacity(0.4),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 07, left: 22),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12,
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 49, 49),
                            radius: 10,
                            child: GooglePoppinsWidgets(
                              text: '8',
                              fontsize: 11,
                              fontWeight: FontWeight.w600,
                              color: cWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: cLateGrey, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(children: [
                  const CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('web_images/user.png'),
                  ),
                  sWidtht10,
                  GooglePoppinsWidgets(text: "AL BUSTAN", fontsize: 11),
                  sWidtht10,
                  const Icon(Icons.keyboard_arrow_down_rounded)
                ]),
              ),
            ),
            sWidtht10,
            IconButton(
                onPressed: () {
                  employeeRequestList(context);
                },
                icon: const Icon(Icons.settings_outlined))
            // Padding(
            //   padding: const EdgeInsets.only(left: 05),
            //   child: SizedBox(
            //     width: 86,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: [
            //         Row(
            //           children: [
            //             const Icon(
            //               Icons.south_america,
            //               color: Colors.amber,
            //             ),
            //             GooglePoppinsWidgets(text: ' EN ', fontsize: 12),
            //             PopupMenuButton(
            //               icon: const Icon(
            //                 Icons.keyboard_arrow_down_rounded,
            //                 color: cBlack,
            //                 size: 17,
            //               ),
            //               itemBuilder: (BuildContext context) {
            //                 return <PopupMenuEntry>[
            //                   PopupMenuItem(
            //                       child: Column(
            //                     children: [
            //                       Container(
            //                         height: 400,
            //                         color: Colors.red,
            //                       ),
            //                     ],
            //                   ))
            //                 ];
            //               },
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  List<Widget> widgets = [
    Container(height: 40, width: 60, color: Colors.transparent),
    Container(height: 40, width: 60, color: Colors.transparent),
    Container(height: 40, width: 60, color: Colors.transparent),
    Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 42, 215, 197),
          width: 500,
          height: 40,
          child: const Center(
            child: Text(
              'All Messages',
              style: TextStyle(
                fontSize: 16,
                color: cWhite,
              ),
            ),
          ),
        ),
        Container(
          color: themeColorGreen.withOpacity(0.1),
          width: 500,
          height: 300,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: const ListTile(
                    leading: CircleAvatar(
                      radius: 05,
                    ),
                    title: Text(
                      'Title',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Messages',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: 20),
        ),
      ],
    ),
    Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 255, 49, 49),
          width: 400,
          height: 40,
          child: const Center(
            child: Text(
              'All Notifications',
              style: TextStyle(
                fontSize: 15,
                color: cWhite,
              ),
            ),
          ),
        ),
        Container(
          color: themeColorGreen.withOpacity(0.1),
          width: 400,
          height: 300,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: const ListTile(
                    leading: CircleAvatar(
                      radius: 05,
                    ),
                    title: Text(
                      'Title',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Messages',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: 20),
        ),
      ],
    ),
    Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 255, 160, 1),
          width: 200,
          height: 40,
          child: const Center(
            child: Text(
              'Steven Zone',
              style: TextStyle(
                  fontSize: 15, color: cWhite, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(
          width: 200,
          height: 200,
          child: Column(
            children: [
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: cBlack.withOpacity(0.4))),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: Image.asset('assests/png/avathar.png'),
                      ),
                    ),
                    TextFontWidget(
                      text: 'Stevne Zone',
                      fontsize: 12,
                      color: cBlack,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
              ),
              Container(
                height: 35,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: cBlack.withOpacity(0.4))),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.account_circle_outlined,
                        size: 24,
                        color: cBlack,
                      ),
                    ),
                    TextFontWidget(
                      text: 'My Profile',
                      fontsize: 12,
                      color: cBlack,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
              Container(
                height: 35,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: cBlack.withOpacity(0.4))),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.power_settings_new,
                        size: 24,
                        color: cBlack,
                      ),
                    ),
                    TextFontWidget(
                      text: 'Log Ouit',
                      fontsize: 12,
                      color: cBlack,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ];
  void _showOverlay(BuildContext context, int index) async {
    overlayState = Overlay.of(context);

    overlayEntry = OverlayEntry(
        maintainState: true,
        builder: (context) {
          return Positioned(
            right: index == 0
                ? 160
                : index == 2
                    ? 100
                    : 120,
            top: 60,
            child: TextButton(
              onPressed: () {},
              onHover: (val) {
                if (val && showOverlay) {
                  if (index == 0) {
                    textButtonFocusNode.requestFocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.requestFocus();
                  } else if (index == 2) {
                    textButtonFocusNode2.requestFocus();
                  }
                } else {
                  if (index == 0) {
                    textButtonFocusNode.unfocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.unfocus();
                  } else if (index == 2) {
                    textButtonFocusNode2.unfocus();
                  }
                }
              },
              child: widgets[index],
            ),
          );
        });

    overlayEntry2 = OverlayEntry(
        maintainState: true,
        builder: (context) {
          return Positioned(
            right: index == 0
                ? 160
                : index == 2
                    ? 230
                    : 120,
            top: 60,
            child: TextButton(
              onPressed: () {},
              onHover: (val) {
                if (val && showOverlay) {
                  if (index == 0) {
                    textButtonFocusNode.requestFocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.requestFocus();
                  } else if (index == 2) {
                    textButtonFocusNode2.requestFocus();
                  }
                } else {
                  if (index == 0) {
                    textButtonFocusNode.unfocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.unfocus();
                  } else if (index == 2) {
                    textButtonFocusNode2.unfocus();
                  }
                }
              },
              child: widgets[index + 3],
            ),
          );
        });

    overlayState!.insertAll([
      overlayEntry!,
      overlayEntry2!,
    ]);
  }

  void removeOverlay() {
    overlayEntry!.remove();
    overlayEntry2!.remove();
  }
}
