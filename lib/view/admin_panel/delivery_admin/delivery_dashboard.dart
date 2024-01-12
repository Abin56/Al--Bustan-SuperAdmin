import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/chart_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/container_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/dashboard_item_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/secondrow_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';

import 'package:flutter/material.dart';

class DeliveryDashboardContainer extends StatelessWidget {
  const DeliveryDashboardContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> dashboardcontent = [
      Padding(
        padding: const EdgeInsets.only(right: 5, bottom: 10, left: 5),
        child: CustomContainer(
          height: 230,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 38, right: 38),
                  child: Row(
                    children: [
                      const Text(
                        "Purchase Overview",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const DashboardItem(
                            bgColor: AppColors.greenColor,
                            icon: Icons.shopify_rounded,
                            iconColor: AppColors.lightGreenColor,
                            title: "Total Purchase",
                            value: "712",
                          ),
                          ResponsiveWebSite.isMobile(context)
                              ? const Spacer()
                              : const Text(''),
                          const DashboardItem(
                            icon: Icons.cancel,
                            iconColor: AppColors.yellowColor,
                            title: "Cancel Order",
                            value: "13",
                            bgColor: AppColors.lightYellowColor,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const DashboardItem(
                            icon: Icons.rotate_90_degrees_ccw_sharp,
                            iconColor: AppColors.redColor,
                            title: "  Return      ",
                            value: "82",
                            bgColor: AppColors.lightRedColor,
                          ),
                          ResponsiveWebSite.isMobile(context)
                              ? const Spacer()
                              : const Text(''),
                          const Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: DashboardItem(
                              icon: Icons.auto_graph_rounded,
                              iconColor: AppColors.indigoColor,
                              title: "   Cost   ",
                              value: "672",
                              bgColor: AppColors.lightIndigoColors,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ), //...................................... [1]
      Padding(
        padding: const EdgeInsets.only(
          right: 10,
          bottom: 10,
        ),
        child: CustomContainer(
          height: 230,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    children: [
                      const Text(
                        "Stock Overview",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert_outlined,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const DashboardItem(
                            bgColor: AppColors.orangeColor,
                            icon: Icons.shopify_rounded,
                            iconColor: AppColors.lightOrangeColor,
                            title: "Total Stock",
                            value: "12",
                          ),
                          ResponsiveWebSite.isMobile(context)
                              ? const Spacer()
                              : const Text(''),
                          const DashboardItem(
                            icon: Icons.book,
                            iconColor: AppColors.yellowColor,
                            title: "Purchase Pending",
                            value: "02",
                            bgColor: AppColors.lightYellowColor,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const DashboardItem(
                            icon: Icons.receipt_long_rounded,
                            iconColor: AppColors.pinkColor,
                            title: "Will be Received",
                            value: "0",
                            bgColor: AppColors.lightPinkColor,
                          ),
                          ResponsiveWebSite.isMobile(context)
                              ? const Spacer()
                              : const Text(''),
                          const Padding(
                            padding: EdgeInsets.only(right: 25),
                            child: DashboardItem(
                              icon: Icons.notification_important,
                              iconColor: AppColors.indigoColor,
                              title: "Request Alert",
                              value: "05",
                              bgColor: AppColors.lightIndigoColors,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ), //...............................................[2]
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: CustomContainer(
          height: ResponsiveWebSite.isMobile(context) ? 250 : 350,
          width: double.infinity,
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: ScendRowWidget(
              iconData1: Icons.border_all_rounded,
              title: "Orders",
              icon: Icons.more_vert_outlined,
              iconData2: Icons.trolley,
            ),
          ),
        ),
      ), //................................[1][0]
      CustomContainer(
        height: ResponsiveWebSite.isMobile(context) ? 250 : 350,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Product Details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert_outlined,
                    ),
                  ),
                ],
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Inventory Summary",
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "02",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey[400],
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Item Group",
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "14",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey[400],
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "No of Iteam",
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "104",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ), //...................................[1][1]
      CustomContainer(
        height: ResponsiveWebSite.isMobile(context) ? 250 : 350,
        width: double.infinity,
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: ScendRowoneWidget(
            iconData1: Icons.home_work_outlined,
            title: "Canteens",
            icon: Icons.more_vert_outlined,
          ),
        ),
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveWebSite.isMobile(context)
              ? Column(
                  children: [
                    dashboardcontent[0],
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: dashboardcontent[1],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: dashboardcontent[2],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: dashboardcontent[3],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: dashboardcontent[4],
                    ),
                  ],
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        Expanded(flex: 1, child: dashboardcontent[0]),
                        Expanded(flex: 1, child: dashboardcontent[1]),
                        // Expanded(flex: 1, child: dashboardcontent[2]),
                        // Expanded(flex: 1, child: dashboardcontent[3]),

                        // Expanded(
                        //     flex: 1,
                        //     child: Padding(
                        //       padding: const EdgeInsets.only(left: 10),
                        //       child: dashboardcontent[4],
                        //     ))
                      ],
                    ),
                    Row(
                      children: [
                        // Expanded(flex: 1, child: dashboardcontent[0]),
                        // Expanded(flex: 1, child: dashboardcontent[1]),
                        Expanded(flex: 1, child: dashboardcontent[2]),

                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: dashboardcontent[3],
                            )),
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: dashboardcontent[4],
                            ))
                      ],
                    ),
                  ],
                ),
          // ResponsiveWebSite.isMobile(context)
          //     ? Column(
          //         children: [
          //           dashboardcontent[0],
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10),
          //             child: dashboardcontent[1],
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(top: 10),
          //             child: dashboardcontent[2],
          //           ),
          //         ],
          //       )
          //     : Row(
          //         children: [
          //           Expanded(flex: 1, child: dashboardcontent[0]),
          //           Expanded(flex: 1, child: dashboardcontent[1]),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child:
          //                 Expanded(flex: 1, child: dashboardcontent[2]),
          //           )
          //         ],
          //       ),

          // // <<<<<<<<<<< 3 >>>>>>>>>
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: Row(
          //     children: [
          //       sWidtht40,

          //       // <<<<<<<<<<< 4 >>>>>>>>>

          //       sWidtht40,

          //       // <<<<<<<<<<< 5 >>>>>>>>>
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomContainer(
              height: size.height * 0.4,
              width: size.width,
              child: const Padding(
                padding: EdgeInsets.all(18),
                child: Chart(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
