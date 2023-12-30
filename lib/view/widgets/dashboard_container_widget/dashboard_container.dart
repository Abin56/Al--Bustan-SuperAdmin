import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/chart_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/container_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/dashboard_item_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/dashboard_container_widget/widgets/secondrow_widget.dart';

import 'package:flutter/material.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // <<<<<<<<<<< 1 >>>>>>>>>
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomContainer(
                  height: size.height * 0.246,
                  width: size.width * 0.26,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Sales Overview",
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
                        const Column(
                          children: [
                            Row(
                              children: [
                                DashboardItem(
                                  bgColor: AppColors.greenColor,
                                  icon: Icons.percent,
                                  iconColor: AppColors.lightGreenColor,
                                  title: "Total Sales",
                                  value: "712",
                                ),
                                Spacer(),
                                DashboardItem(
                                  icon: Icons.monetization_on,
                                  iconColor: AppColors.yellowColor,
                                  title: "revenue",
                                  value: "132",
                                  bgColor: AppColors.lightYellowColor,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                DashboardItem(
                                  icon: Icons.credit_card_outlined,
                                  iconColor: AppColors.redColor,
                                  title: "Cost",
                                  value: "132",
                                  bgColor: AppColors.lightRedColor,
                                ),
                                Spacer(),
                                DashboardItem(
                                  icon: Icons.auto_graph_rounded,
                                  iconColor: AppColors.indigoColor,
                                  title: "Profit",
                                  value: "132",
                                  bgColor: AppColors.lightIndigoColors,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // <<<<<<<<<<< 2 >>>>>>>>>
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomContainer(
                  height: size.height * 0.246,
                  width: size.width * 0.26,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            )
                          ],
                        ),
                        const Column(
                          children: [
                            Row(
                              children: [
                                DashboardItem(
                                  bgColor: AppColors.orangeColor,
                                  icon: Icons.shopify_rounded,
                                  iconColor: AppColors.lightOrangeColor,
                                  title: "No of Purchase",
                                  value: "12",
                                ),
                                Spacer(),
                                DashboardItem(
                                  icon: Icons.book,
                                  iconColor: AppColors.yellowColor,
                                  title: "Cael Order",
                                  value: "02",
                                  bgColor: AppColors.lightYellowColor,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                DashboardItem(
                                  icon: Icons.credit_card_outlined,
                                  iconColor: AppColors.pinkColor,
                                  title: "Cost",
                                  value: "78",
                                  bgColor: AppColors.lightPinkColor,
                                ),
                                Spacer(),
                                DashboardItem(
                                  icon: Icons.rotate_90_degrees_ccw_sharp,
                                  iconColor: AppColors.indigoColor,
                                  title: "Returns",
                                  value: "05",
                                  bgColor: AppColors.lightIndigoColors,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          sWidtht40,

          // <<<<<<<<<<< 3 >>>>>>>>>
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomContainer(
                  height: size.height * 0.22,
                  width: size.width * 0.25,
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: ScendRowWidget(
                      iconData1: Icons.border_all_rounded,
                      title: "Inventory Summary",
                      icon: Icons.more_vert_outlined,
                      iconData2: Icons.bakery_dining_rounded,
                    ),
                  ),
                ),
                sWidtht40,

                // <<<<<<<<<<< 4 >>>>>>>>>
                CustomContainer(
                  height: size.height * 0.22,
                  width: size.width * 0.25,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Inventory Summary",
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
                ),
                sWidtht40,

                // <<<<<<<<<<< 5 >>>>>>>>>
                CustomContainer(
                  height: size.height * 0.22,
                  width: size.width * 0.25,
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: ScendRowWidget(
                      iconData2: Icons.emoji_people_sharp,
                      iconData1: Icons.co_present_outlined,
                      title: "No of Users",
                      icon: Icons.more_vert_outlined,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
