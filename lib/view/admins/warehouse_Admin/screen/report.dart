import 'package:canteen_superadmin_website/controller/report_controller/report_controller.dart';
import 'package:canteen_superadmin_website/controller/store_report_controller/store_report_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/const.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reports extends StatelessWidget {
  final getReportCtr = Get.put(ReportController());
  final getStoreReportCtr = Get.put(StoreReportController());
  Reports({super.key});
  // List<Widget> reportsWidget = [
  //   ReportContainerWidget(
  //     headingText: 'Report',
  //     button1Text: "Button 1",
  //     button2Text: "Button 2",
  //     button3Text: "Button 3",
  //     buttonHeight: 40,
  //     buttonWidth: 140,
  //     button1OnPressed: () {
  //       // getReportCtr.generateInvoice(context);
  //     },
  //     button2OnPressed: () {},
  //     button3OnPressed: () {},
  //   ),
  //   ReportContainerWidget(
  //     headingText: 'Store Report',
  //     button1Text: "Button 1",
  //     button2Text: "Button 2",
  //     button3Text: "Button 3",
  //     buttonHeight: 40,
  //     buttonWidth: 140,
  //     button1OnPressed: () {},
  //     button2OnPressed: () {},
  //     button3OnPressed: () {},
  //   ),
  //   ReportContainerWidget(
  //     headingText: 'Delivery Report',
  //     button1Text: "Button 1",
  //     button2Text: "Button 2",
  //     button3Text: "Button 3",
  //     buttonHeight: 40,
  //     buttonWidth: 140,
  //     button1OnPressed: () {},
  //     button2OnPressed: () {},
  //     button3OnPressed: () {},
  //   ),
  //   ReportContainerWidget(
  //     headingText: 'Purchase Report',
  //     button1Text: "Button 1",
  //     button2Text: "Button 2",
  //     button3Text: "Button 3",
  //     buttonHeight: 40,
  //     buttonWidth: 140,
  //     button1OnPressed: () {},
  //     button2OnPressed: () {},
  //     button3OnPressed: () {},
  //   ),
  //   ReportContainerWidget(
  //     headingText: 'Sales Report',
  //     button1Text: "Button 1",
  //     button2Text: "Button 2",
  //     button3Text: "Button 3",
  //     buttonHeight: 40,
  //     buttonWidth: 140,
  //     button1OnPressed: () {},
  //     button2OnPressed: () {},
  //     button3OnPressed: () {},
  //   ),
  //   ReportContainerWidget(
  //     headingText: 'Report Container',
  //     button1Text: "Button 1",
  //     button2Text: "Button 2",
  //     button3Text: "Button 3",
  //     buttonHeight: 40,
  //     buttonWidth: 140,
  //     button1OnPressed: () {},
  //     button2OnPressed: () {},
  //     button3OnPressed: () {},
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    return ResponsiveWebSite.isMobile(context)
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: sizeH * 0.91,
              width: double.infinity,
              decoration: BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(blurRadius: 0.5),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GooglePoppinsWidgets(text: "Report", fontsize: 26),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            // child: reportsWidget[0],

                            child: ReportContainerWidget(
                              headingText: 'Report',
                              button1Text: "Button 1",
                              button2Text: "Button 2",
                              button3Text: "Button 3",
                              buttonHeight: 40,
                              buttonWidth: 140,
                              button1OnPressed: () {
                                showToast(msg: "done");
                                getReportCtr.generateInvoice(context);
                              },
                              button2OnPressed: () {},
                              button3OnPressed: () {},
                            ),
                          ),
                          sWidtht10,
                          Expanded(
                            // child: reportsWidget[1],
                            child: ReportContainerWidget(
                              headingText: 'Store Report',
                              button1Text: "Button 1",
                              button2Text: "Button 2",
                              button3Text: "Button 3",
                              buttonHeight: 40,
                              buttonWidth: 140,
                              button1OnPressed: () {
                                getStoreReportCtr.generateInvoice(context);
                              },
                              button2OnPressed: () {},
                              button3OnPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            // child: reportsWidget[2],
                            child: ReportContainerWidget(
                              headingText: 'Delivery Report',
                              button1Text: "Button 1",
                              button2Text: "Button 2",
                              button3Text: "Button 3",
                              buttonHeight: 40,
                              buttonWidth: 140,
                              button1OnPressed: () {},
                              button2OnPressed: () {},
                              button3OnPressed: () {},
                            ),
                          ),
                          sWidtht10,
                          Expanded(
                            // child: reportsWidget[3],
                            child: ReportContainerWidget(
                              headingText: 'Purchase Report',
                              button1Text: "Button 1",
                              button2Text: "Button 2",
                              button3Text: "Button 3",
                              buttonHeight: 40,
                              buttonWidth: 140,
                              button1OnPressed: () {},
                              button2OnPressed: () {},
                              button3OnPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            // child: reportsWidget[4],
                            child: ReportContainerWidget(
                              headingText: 'Sales Report',
                              button1Text: "Button 1",
                              button2Text: "Button 2",
                              button3Text: "Button 3",
                              buttonHeight: 40,
                              buttonWidth: 140,
                              button1OnPressed: () {},
                              button2OnPressed: () {},
                              button3OnPressed: () {},
                            ),
                          ),
                          sWidtht10,
                          Expanded(
                            // child: reportsWidget[5],
                            child: ReportContainerWidget(
                              headingText: 'Report Container',
                              button1Text: "Button 1",
                              button2Text: "Button 2",
                              button3Text: "Button 3",
                              buttonHeight: 40,
                              buttonWidth: 140,
                              button1OnPressed: () {},
                              button2OnPressed: () {},
                              button3OnPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: sizeH * 0.91,
              width: double.infinity,
              decoration: BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(blurRadius: 0.5),
                ],
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child:
                        GooglePoppinsWidgets(text: "All Report", fontsize: 26),
                  ),
                  Row(
                    children: [
                      sWidtht10,
                      Expanded(
                        // child: reportsWidget[0],
                        child: ReportContainerWidget(
                          headingText: 'Report',
                          button1Text: "Button 1",
                          button2Text: "Button 2",
                          button3Text: "Button 3",
                          buttonHeight: 40,
                          buttonWidth: 140,
                          button1OnPressed: () {
                            showToast(msg: "done");
                            getReportCtr.generateInvoice(context);
                          },
                          button2OnPressed: () {},
                          button3OnPressed: () {},
                        ),
                      ),
                      sWidtht40,
                      Expanded(
                        // child: reportsWidget[1],
                        child: ReportContainerWidget(
                          headingText: 'Store Report',
                          button1Text: "Button 1",
                          button2Text: "Button 2",
                          button3Text: "Button 3",
                          buttonHeight: 40,
                          buttonWidth: 140,
                          button1OnPressed: () {
                            getStoreReportCtr.generateInvoice(context);
                          },
                          button2OnPressed: () {},
                          button3OnPressed: () {},
                        ),
                      ),
                      sWidtht40,
                      Expanded(
                        // child: reportsWidget[2],
                        child: ReportContainerWidget(
                          headingText: 'Delivery Report',
                          button1Text: "Button 1",
                          button2Text: "Button 2",
                          button3Text: "Button 3",
                          buttonHeight: 40,
                          buttonWidth: 140,
                          button1OnPressed: () {},
                          button2OnPressed: () {},
                          button3OnPressed: () {},
                        ),
                      ),
                      sWidtht10
                    ],
                  ),
                  sHeight40,
                  Row(
                    children: [
                      sWidtht10,
                      Expanded(
                        // child: reportsWidget[3],
                        child: ReportContainerWidget(
                          headingText: 'Purchase Report',
                          button1Text: "Button 1",
                          button2Text: "Button 2",
                          button3Text: "Button 3",
                          buttonHeight: 40,
                          buttonWidth: 140,
                          button1OnPressed: () {},
                          button2OnPressed: () {},
                          button3OnPressed: () {},
                        ),
                      ),
                      sWidtht40,
                      Expanded(
                        // child: reportsWidget[4],
                        child: ReportContainerWidget(
                          headingText: 'Sales Report',
                          button1Text: "Button 1",
                          button2Text: "Button 2",
                          button3Text: "Button 3",
                          buttonHeight: 40,
                          buttonWidth: 140,
                          button1OnPressed: () {},
                          button2OnPressed: () {},
                          button3OnPressed: () {},
                        ),
                      ),
                      sWidtht40,
                      Expanded(
                        // child: reportsWidget[5],
                        child: ReportContainerWidget(
                          headingText: 'Report Container',
                          button1Text: "Button 1",
                          button2Text: "Button 2",
                          button3Text: "Button 3",
                          buttonHeight: 40,
                          buttonWidth: 140,
                          button1OnPressed: () {},
                          button2OnPressed: () {},
                          button3OnPressed: () {},
                        ),
                      ),
                      sWidtht10
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}

class ReportContainerWidget extends StatelessWidget {
  final String headingText;
  final String button1Text;
  final String button2Text;
  final String button3Text;
  final double buttonHeight;
  final double buttonWidth;
  final VoidCallback button1OnPressed;
  final VoidCallback button2OnPressed;
  final VoidCallback button3OnPressed;
  const ReportContainerWidget({
    super.key,
    required this.headingText,
    required this.button1Text,
    required this.button2Text,
    required this.button3Text,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.button1OnPressed,
    required this.button2OnPressed,
    required this.button3OnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(blurRadius: 5, color: Colors.black26),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                headingText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: button1OnPressed,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  minimumSize: Size(buttonWidth, buttonHeight),
                ),
                child: Text(button1Text),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: button2OnPressed,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  minimumSize: Size(buttonWidth, buttonHeight),
                ),
                child: Text(button2Text),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: button3OnPressed,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  minimumSize: Size(buttonWidth, buttonHeight),
                ),
                child: Text(button3Text),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
