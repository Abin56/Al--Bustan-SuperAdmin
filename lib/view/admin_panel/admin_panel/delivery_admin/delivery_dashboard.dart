import 'package:canteen_superadmin_website/controller/delivery_dashboard_controller/delivery_dashboard_controller.dart';
import 'package:canteen_superadmin_website/model/canteen_model.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/admin_panel/delivery_admin/canteen_all_list.dart';
import 'package:canteen_superadmin_website/view/admins/delivery_Admin/screen/canteen_add_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/chart_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/container_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/dashboard_item_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/secondrow_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryDashboardContainer extends StatelessWidget {
  DeliveryDashboardContainer({
    super.key,
  });

  final deliveryDashBoardCtr = Get.put(DeliveryDashBoardController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> dashboardcontent = [
      CustomContainer(
        height: 260,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Text(
                      "Delivery Overview",
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
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("deliveryAssignList")
                                .snapshots(),
                            builder: (context, snapshot) {
                              deliveryDashBoardCtr.getTotalRevenue();
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const SizedBox();
                              } else if (!snapshot.hasData) {
                                return const SizedBox();
                              } else if (!snapshot.hasData) {
                                return const SizedBox();
                              } else {
                                return DashboardItem(
                                  bgColor: AppColors.greenColor,
                                  icon: Icons.shopify_rounded,
                                  iconColor: AppColors.lightGreenColor,
                                  title: "Total deliveries",
                                  value: '  ${snapshot.data!.docs.length}',
                                );
                              }
                            }),
                        ResponsiveWebSite.isMobile(context)
                            ? const Spacer()
                            : const Text(''),
                        const DashboardItem(
                          icon: Icons.cancel,
                          iconColor: AppColors.yellowColor,
                          title: "Cancel Order",
                          value: "0",
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
                          title: "    Return    ",
                          value: "  0",
                          bgColor: AppColors.lightRedColor,
                        ),
                        ResponsiveWebSite.isMobile(context)
                            ? const Spacer()
                            : const Text(''),
                        Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Obx(
                              () => DashboardItem(
                                icon: Icons.auto_graph_rounded,
                                iconColor: AppColors.indigoColor,
                                title: "Revenue",
                                value: deliveryDashBoardCtr.totalRevenue.value
                                    .toString(),
                                bgColor: AppColors.lightIndigoColors,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ), //...................................... [1]
      Padding(
        padding: const EdgeInsets.only(left: 9, right: 10),
        child: CustomContainer(
          height: 260,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const DashboardItem(
                              bgColor: AppColors.orangeColor,
                              icon: Icons.shopify_rounded,
                              iconColor: AppColors.lightOrangeColor,
                              title: " Total Stock",
                              value: "12",
                            ),
                            ResponsiveWebSite.isMobile(context)
                                ? const Spacer()
                                : const Text(''),
                            const DashboardItem(
                              icon: Icons.book,
                              iconColor: AppColors.yellowColor,
                              title: "Pending Order",
                              value: "02",
                              bgColor: AppColors.lightYellowColor,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const DashboardItem(
                            icon: Icons.receipt_long_rounded,
                            iconColor: AppColors.pinkColor,
                            title: "Delivered",
                            value: "89",
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
                              title: "Employee Request",
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

      CustomContainer(
        height: ResponsiveWebSite.isMobile(context) ? 250 : 300,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
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
        height: ResponsiveWebSite.isMobile(context) ? 250 : 300,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: CanteenScendRowoneWidget(
            iconData1: Icons.home_work_outlined,
            title: "Canteens",
            navigate: () {
              Get.to(CanteenProfile());
            },
            icon: Icons.more_vert_outlined,
          ),
        ),
      ),
    ];

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.85,
      child: SingleChildScrollView(
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
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Expanded(flex: 1, child: dashboardcontent[0]),
                          Expanded(flex: 1, child: dashboardcontent[1]),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(flex: 1, child: dashboardcontent[2]),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: dashboardcontent[3],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: CustomContainer(
                height: size.height * 0.4,
                width: size.width,
                child: const Chart(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CanteenScendRowoneWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconData iconData1;
  final VoidCallback navigate;

  const CanteenScendRowoneWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.iconData1,
    required this.navigate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Get.to(CanteenViewPage());
                },
                child: const Text(
                  "view all",
                ),
              ),
              IconButton(
                onPressed: navigate,
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(icon),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 242, 242, 245),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.lightGreyColor,
                // color: cGreen,
                width: 1.0,
              ),
            ),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('CanteenList')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: GooglePoppinsWidgets(text: "No data", fontsize: 15),
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                    child: GooglePoppinsWidgets(text: "No data", fontsize: 15),
                  );
                } else {
                  return GridView.count(
                    crossAxisCount: 8,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.8,
                    // childAspectRatio: 3,
                    children:
                        List.generate(snapshot.data!.docs.length, (index) {
                      final canteenData = CanteenModel.fromMap(
                          snapshot.data!.docs[index].data());
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: cGrey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                color: cGrey,
                                width: double.infinity,
                                child: Image.network(
                                  canteenData.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              GooglePoppinsWidgets(
                                  text: canteenData.schoolName, fontsize: 14)
                            ],
                          ),
                        ),
                      );
                    }),
                  );

                  // ListView.separated(
                  //     itemBuilder: (context, index) {
                  //       final canteenData = CanteenModel.fromMap(
                  //           snapshot.data!.docs[index].data());
                  //       return Container(
                  //         decoration: BoxDecoration(
                  //           color: cWhite,
                  //           border: Border.all(color: cGrey),
                  //         ),
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(5),
                  //           child: Row(
                  //             children: [
                  //               Container(
                  //                 height: 50,
                  //                 width: 50,
                  //                 decoration: BoxDecoration(
                  //                   image: DecorationImage(
                  //                     image: NetworkImage(canteenData.image),
                  //                   ),
                  //                 ),
                  //               ),
                  //               sWidtht10,
                  //               GooglePoppinsWidgets(
                  //                   text: canteenData.schoolName, fontsize: 14),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //     separatorBuilder: (context, index) {
                  //       return sHeight10;
                  //     },
                  //     itemCount: snapshot.data!.docs.length);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
