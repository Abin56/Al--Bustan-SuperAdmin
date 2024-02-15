import 'package:canteen_superadmin_website/controller/all_report_controller/all_report_controller.dart';
import 'package:canteen_superadmin_website/controller/calender_controller/calender_controller.dart';
import 'package:canteen_superadmin_website/controller/delivery_report_controller/delivey_report_controller.dart';
import 'package:canteen_superadmin_website/controller/store_report_controller/store_report_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/admin_panel/tempory_productList/textformFiled_widget/textFormFiled_.dart';
import 'package:canteen_superadmin_website/view/widgets/calender/calender.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reports extends StatelessWidget {
  Reports({super.key});

  final getDeliveryReportCtr = Get.put(DeliveryReportController());

  final getStoreReportCtr = Get.put(StoreReportController());
  final getAllReportCtr = Get.put(AllReportController());
  final getCalenderCtr = Get.put(CalenderController());
  // List<Widget> reportsWidget = [
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
                              button1Text: "Today's Report",
                              button2Text: "Last 7 days",
                              button3Text: "Last 30 days",
                              button4Text: "Report",
                              buttonHeight: 40,
                              buttonWidth: 140,
                              button1OnPressed: () {
                                getAllReportCtr.generateInvoice(
                                    context: context, type: '1');
                              },
                              button2OnPressed: () {
                                getAllReportCtr.generateInvoice(
                                    context: context, type: '2');
                              },
                              button3OnPressed: () {
                                getAllReportCtr.generateInvoice(
                                    context: context, type: '3');
                              },
                              button4OnPressed: () {
                                openStartandEndCalender(
                                  context,
                                  () {
                                    getAllReportCtr.validateStartandEndCalender(
                                        startTime:
                                            getCalenderCtr.startDate.value,
                                        endTime: getCalenderCtr.endDate.value,
                                        context: context);
                                  },
                                );
                              },
                            ),
                          ),
                          sWidtht10,
                          Expanded(
                            // child: reportsWidget[1],
                            child: ReportContainerWidget(
                              headingText: 'Store Report',
                              button1Text: "Today's Report",
                              button2Text: "Last 7 days",
                              button3Text: "Last 30 days",
                              button4Text: "Report",
                              buttonHeight: 40,
                              buttonWidth: 140,
                              button1OnPressed: () {
                                getStoreReportCtr.generateInvoice(
                                    context: context, type: '1');
                              },
                              button2OnPressed: () {
                                getStoreReportCtr.generateInvoice(
                                    context: context, type: '2');
                              },
                              button3OnPressed: () {
                                getStoreReportCtr.generateInvoice(
                                    context: context, type: '3');
                              },
                              button4OnPressed: () {
                                openStartandEndCalender(
                                  context,
                                  () {
                                    getStoreReportCtr
                                        .validateStartandEndCalender(
                                            startTime:
                                                getCalenderCtr.startDate.value,
                                            endTime:
                                                getCalenderCtr.endDate.value,
                                            context: context);
                                  },
                                );
                              },
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
                              button1Text: "Today's Report",
                              button2Text: "Last 7 days",
                              button3Text: "Last 30 days",
                              button4Text: "Report",
                              buttonHeight: 40,
                              buttonWidth: 140,
                              button1OnPressed: () {
                                getDeliveryReportCtr.generateInvoice(
                                    context: context, type: '1');
                              },
                              button2OnPressed: () {
                                getDeliveryReportCtr.generateInvoice(
                                    context: context, type: '2');
                              },
                              button3OnPressed: () {
                                getDeliveryReportCtr.generateInvoice(
                                    context: context, type: '3');
                              },
                              button4OnPressed: () {
                                openStartandEndCalender(
                                  context,
                                  () {
                                    getDeliveryReportCtr
                                        .validateStartandEndCalender(
                                            startTime:
                                                getCalenderCtr.startDate.value,
                                            endTime:
                                                getCalenderCtr.endDate.value,
                                            context: context);
                                  },
                                );
                              },
                            ),
                          ),
                          sWidtht10,
                          Expanded(
                            // child: reportsWidget[3],
                            child: ReportContainerWidget(
                              headingText: 'Purchase Report',
                              button1Text: "Today's Report",
                              button2Text: "Last 7 days",
                              button3Text: "Last 30 days",
                              button4Text: "Report",
                              buttonHeight: 40,
                              buttonWidth: 140,
                              button1OnPressed: () {},
                              button2OnPressed: () {},
                              button3OnPressed: () {},
                              button4OnPressed: () {},
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
                              button1Text: "Today's Report",
                              button2Text: "Last 7 days",
                              button3Text: "Last 30 days",
                              button4Text: "Report",
                              buttonHeight: 40,
                              buttonWidth: 140,
                              button1OnPressed: () {},
                              button2OnPressed: () {},
                              button3OnPressed: () {},
                              button4OnPressed: () {},
                            ),
                          ),
                          sWidtht10,
                          Expanded(
                            // child: reportsWidget[5],
                            child: ReportContainerWidget(
                              headingText: 'Report Container',
                              button1Text: "Today's Report",
                              button2Text: "Last 7 days",
                              button3Text: "Last 30 days",
                              button4Text: "Report",
                              buttonHeight: 40,
                              buttonWidth: 140,
                              button1OnPressed: () {},
                              button2OnPressed: () {},
                              button3OnPressed: () {},
                              button4OnPressed: () {},
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
                          button1Text: "Today's Report",
                          button2Text: "Last 7 days",
                          button3Text: "Last 30 days",
                          button4Text: "Report",
                          buttonHeight: 40,
                          buttonWidth: 140,
                          button1OnPressed: () {
                            getAllReportCtr.generateInvoice(
                                context: context, type: '1');
                          },
                          button2OnPressed: () {
                            getAllReportCtr.generateInvoice(
                                context: context, type: '2');
                          },
                          button3OnPressed: () {
                            getAllReportCtr.generateInvoice(
                                context: context, type: '3');
                          },
                          button4OnPressed: () {
                            openStartandEndCalender(
                              context,
                              () {
                                getAllReportCtr.validateStartandEndCalender(
                                    startTime: getCalenderCtr.startDate.value,
                                    endTime: getCalenderCtr.endDate.value,
                                    context: context);
                              },
                            );
                          },
                        ),
                      ),
                      sWidtht40,
                      Expanded(
                        // child: reportsWidget[1],
                        child: ReportContainerWidget(
                          headingText: 'Store Report',
                          button1Text: "Today's Report",
                          button2Text: "Last 7 days",
                          button3Text: "Last 30 days",
                          button4Text: "Report",
                          buttonHeight: 40,
                          buttonWidth: 140,
                          button1OnPressed: () {
                            getStoreReportCtr.generateInvoice(
                                context: context, type: '1');
                          },
                          button2OnPressed: () {
                            getStoreReportCtr.generateInvoice(
                                context: context, type: '2');
                          },
                          button3OnPressed: () {
                            getStoreReportCtr.generateInvoice(
                                context: context, type: '3');
                          },
                          button4OnPressed: () {
                            openStartandEndCalender(
                              context,
                              () {
                                getStoreReportCtr.validateStartandEndCalender(
                                    startTime: getCalenderCtr.startDate.value,
                                    endTime: getCalenderCtr.endDate.value,
                                    context: context);
                              },
                            );
                          },
                        ),
                      ),
                      sWidtht40,
                      Expanded(
                        // child: reportsWidget[2],
                        child: ReportContainerWidget(
                          headingText: 'Delivery Report',
                          button1Text: "Today's Report",
                          button2Text: "Last 7 days",
                          button3Text: "Last 30 days",
                          button4Text: "Report",
                          buttonHeight: 40,
                          buttonWidth: 140,
                          button1OnPressed: () {
                            getDeliveryReportCtr.generateInvoice(
                                context: context, type: '1');
                          },
                          button2OnPressed: () {
                            getDeliveryReportCtr.generateInvoice(
                                context: context, type: '2');
                          },
                          button3OnPressed: () {
                            getDeliveryReportCtr.generateInvoice(
                                context: context, type: '3');
                          },
                          button4OnPressed: () {
                            openStartandEndCalender(
                              context,
                              () {
                                getDeliveryReportCtr
                                    .validateStartandEndCalender(
                                        startTime:
                                            getCalenderCtr.startDate.value,
                                        endTime: getCalenderCtr.endDate.value,
                                        context: context);
                              },
                            );
                          },
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
                          button1Text: "Today's Report",
                          button2Text: "Last 7 days",
                          button3Text: "Last 30 days",
                          button4Text: "Report",
                          buttonHeight: 40,
                          buttonWidth: 140,
                          button1OnPressed: () {},
                          button2OnPressed: () {},
                          button3OnPressed: () {},
                          button4OnPressed: () {},
                        ),
                      ),
                      sWidtht40,
                      Expanded(
                        // child: reportsWidget[4],
                        child: ReportContainerWidget(
                          headingText: 'Sales Report',
                          button1Text: "Today's Report",
                          button2Text: "Last 7 days",
                          button3Text: "Last 30 days",
                          button4Text: "Report",
                          buttonHeight: 40,
                          buttonWidth: 140,
                          button1OnPressed: () {},
                          button2OnPressed: () {},
                          button3OnPressed: () {},
                          button4OnPressed: () {},
                        ),
                      ),
                      sWidtht40,
                      Expanded(
                        // child: reportsWidget[5],
                        child: ReportContainerWidget(
                          headingText: 'Report Container',
                          button1Text: "Today's Report",
                          button2Text: "Last 7 days",
                          button3Text: "Last 30 days",
                          button4Text: "Report",
                          buttonHeight: 40,
                          buttonWidth: 140,
                          button1OnPressed: () {},
                          button2OnPressed: () {},
                          button3OnPressed: () {},
                          button4OnPressed: () {},
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
  final String button4Text;
  final double buttonHeight;
  final double buttonWidth;
  final VoidCallback button1OnPressed;
  final VoidCallback button2OnPressed;
  final VoidCallback button3OnPressed;
  final VoidCallback button4OnPressed;
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
    required this.button4Text,
    required this.button4OnPressed,
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
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: button4OnPressed,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  minimumSize: Size(buttonWidth, buttonHeight),
                ),
                child: Text(button4Text),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

openStartandEndCalender(BuildContext context, Function() function) {
  final getCalendeCtr = Get.put(CalenderController());
  customShowDilogBox(
      context: context,
      title: 'Choose date',
      children: [
        Column(
          children: [
            Obx(() {
              getCalendeCtr.startDateCtr.text = dateConveter(
                  DateTime.parse(getCalendeCtr.startDate.value.toString()));

              return TextFormFiledWidget(
                controller: getCalendeCtr.startDateCtr,
                hintText: "Start Date",
                title: "Start Date",
                width: 200,
                readOnly: true,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          SizedBox(
                            width: 300,
                            height: 300,
                            child:
                                CalendarWidget(date: getCalendeCtr.startDate),
                          )
                        ],
                      );
                    },
                  );
                },
              );
            }),
            GooglePoppinsWidgets(text: 'to', fontsize: 16),
            Obx(() {
              getCalendeCtr.endDateCtr.text = dateConveter(
                  DateTime.parse(getCalendeCtr.endDate.value.toString()));

              return TextFormFiledWidget(
                controller: getCalendeCtr.endDateCtr,
                hintText: "End Date",
                title: "End Date",
                width: 200,
                readOnly: true,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: CalendarWidget(date: getCalendeCtr.endDate),
                          )
                        ],
                      );
                    },
                  );
                },
              );
            }),
          ],
        )
      ],
      doyouwantActionButton: true,
      actiononTapfuction: function);
}
