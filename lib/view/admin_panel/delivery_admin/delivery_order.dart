import 'package:canteen_superadmin_website/controller/delivery_controller/delivery_controller.dart';
import 'package:canteen_superadmin_website/controller/employee_controller/employee_controller.dart';
import 'package:canteen_superadmin_website/model/employe_createprofile_model.dart';
import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/textstysle/textstyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryScreen extends StatelessWidget {
  DeliveryScreen({super.key});

  final employeeController = Get.put(EmployeeController());
  final getDeliveryCtr = Get.put(DeliveryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
          ),
        ),
        height: size.height * 0.88,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //  <<<<<<< list(table) >>>>>>>>>
              Container(
                decoration: BoxDecoration(
                  // color: AppColors.greenColor,
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.1,
                      0.4,
                      0.6,
                      0.9,
                    ],
                    colors: [
                      Color(0xFF35B2A2),
                      Color(0xFF11967F),
                      Color(0xFF06876A),
                      Color(0xFF036952),
                    ],
                  ),
                  border: Border.all(
                    width: 1,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            "Order ID",
                            style: AppTextStyles.textStyle1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Order Quantity",
                            style: AppTextStyles.textStyle1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Order Time",
                            style: AppTextStyles.textStyle1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Order Status",
                            style: AppTextStyles.textStyle1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Delivered Time",
                            style: AppTextStyles.textStyle1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Price",
                            style: AppTextStyles.textStyle1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('deliveryAssignList')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: GooglePoppinsWidgets(
                              text: "No data", fontsize: 15),
                        );
                      } else if (!snapshot.hasData) {
                        return Center(
                          child: GooglePoppinsWidgets(
                              text: "No data", fontsize: 15),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final data = snapshot.data!.docs[index];
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text(
                                            data['orderId'],
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyles
                                                .deliveryTextStyle1,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text(
                                            data['orderCount'].toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyles
                                                .deliveryTextStyle1,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text(
                                            dateConveter(
                                              DateTime.parse(data['time']),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyles
                                                .deliveryTextStyle1,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: data['isDelivered'] == true
                                                  ? Colors.green
                                                  : (data['assignStatus'] ==
                                                          false
                                                      ? Colors.amber
                                                      : AppColors.indigoColor),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                width: 1,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: data['isDelivered'] == true
                                                  ? const Padding(
                                                      padding:
                                                          EdgeInsets.all(6.0),
                                                      child: Text(
                                                        "Delivered",
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    )
                                                  : data['assignStatus'] ==
                                                          false
                                                      ? SizedBox(
                                                          height: 60,
                                                          child: DropdownSearch<
                                                              EmployeeProfileCreateModel>(
                                                            autoValidateMode:
                                                                AutovalidateMode
                                                                    .always,
                                                            asyncItems:
                                                                (value) {
                                                              employeeController
                                                                  .employeeList
                                                                  .clear();
                                                              return employeeController
                                                                  .fetchEmployees();
                                                            },
                                                            itemAsString:
                                                                (value) =>
                                                                    value.name,
                                                            onChanged:
                                                                (value) async {
                                                              if (value !=
                                                                  null) {
                                                                employeeController
                                                                        .employeeUID
                                                                        .value =
                                                                    value.docid;
                                                                employeeController
                                                                        .employeeName =
                                                                    value.name;
                                                              }
                                                              final employeeID =
                                                                  Get.find<
                                                                          EmployeeController>()
                                                                      .employeeUID;
                                                              final emplopeeName =
                                                                  Get.find<
                                                                          EmployeeController>()
                                                                      .employeeName;
                                                              getDeliveryCtr
                                                                  .createDeliveryOrderToEmployee(
                                                                employeeName:
                                                                    emplopeeName,
                                                                employeeId:
                                                                    employeeID
                                                                        .value,
                                                                deliverydata:
                                                                    data,
                                                              );
                                                            },
                                                            dropdownDecoratorProps:
                                                                DropDownDecoratorProps(
                                                              baseStyle:
                                                                  GoogleFonts
                                                                      .poppins(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.5),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : StreamBuilder(
                                                          stream: FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'EmployeeProfile')
                                                              .doc(data[
                                                                  'employeeId'])
                                                              .collection(
                                                                  'DeliveryRequest')
                                                              .doc(data[
                                                                  'orderId'])
                                                              .collection(
                                                                  'productsDetails')
                                                              .snapshots(),
                                                          builder: (context,
                                                              statussnap) {
                                                            if (snapshot
                                                                .hasData) {
                                                              if (statussnap
                                                                      .connectionState ==
                                                                  ConnectionState
                                                                      .waiting) {
                                                                return const SizedBox();
                                                              } else if (statussnap
                                                                  .data!
                                                                  .docs
                                                                  .isEmpty) {
                                                                return const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              6.0),
                                                                  child: Text(
                                                                    "Pickuped",
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppColors
                                                                          .whiteColor,
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                return const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              6.0),
                                                                  child: Text(
                                                                    'Pending',
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppColors
                                                                          .whiteColor,
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                            } else {
                                                              return const Text(
                                                                  '');
                                                            }
                                                          },
                                                        ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Expanded(
                                      //   flex: 1,
                                      //   child: Center(
                                      //     child: Container(
                                      //       decoration: BoxDecoration(
                                      //         color: AppColors.greyColor,
                                      //         borderRadius:
                                      //             BorderRadius.circular(5),
                                      //       ),
                                      //       child: Padding(
                                      //         padding: const EdgeInsets.all(3),
                                      //         child: data['isDelivered'] == true
                                      //             ? const Text(
                                      //                 "Delivered",
                                      //                 style: TextStyle(
                                      //                   color: AppColors
                                      //                       .whiteColor,
                                      //                 ),
                                      //               )
                                      //             : data['assignStatus'] ==
                                      //                     false
                                      //                 ? SizedBox(
                                      //                     height: 60,
                                      //                     child: DropdownSearch<
                                      //                         EmployeeProfileCreateModel>(
                                      //                       autoValidateMode:
                                      //                           AutovalidateMode
                                      //                               .always,
                                      //                       asyncItems:
                                      //                           (value) {
                                      //                         employeeController
                                      //                             .employeeList
                                      //                             .clear();

                                      //                         return employeeController
                                      //                             .fetchEmployees();
                                      //                       },
                                      //                       itemAsString:
                                      //                           (value) =>
                                      //                               value.name,
                                      //                       onChanged:
                                      //                           (value) async {
                                      //                         // employeeController.employeeUID.value = true;
                                      //                         if (value !=
                                      //                             null) {
                                      //                           employeeController
                                      //                                   .employeeUID
                                      //                                   .value =
                                      //                               value.docid;
                                      //                           employeeController
                                      //                                   .employeeName =
                                      //                               value.name;
                                      //                         }
                                      //                         final employeeID =
                                      //                             Get.find<
                                      //                                     EmployeeController>()
                                      //                                 .employeeUID;
                                      //                         final emplopeeName =
                                      //                             Get.find<
                                      //                                     EmployeeController>()
                                      //                                 .employeeName;
                                      //                         getDeliveryCtr.createDeliveryOrderToEmployee(
                                      //                             employeeName:
                                      //                                 emplopeeName,
                                      //                             employeeId:
                                      //                                 employeeID
                                      //                                     .value,
                                      //                             deliverydata:
                                      //                                 data);
                                      //                       },
                                      //                       dropdownDecoratorProps:
                                      //                           DropDownDecoratorProps(
                                      //                         baseStyle:
                                      //                             GoogleFonts
                                      //                                 .poppins(
                                      //                           fontSize: 13,
                                      //                           color: Colors
                                      //                               .black
                                      //                               .withOpacity(
                                      //                                   0.7),
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                   )
                                      //                 : StreamBuilder(
                                      //                     stream: FirebaseFirestore
                                      //                         .instance
                                      //                         .collection(
                                      //                             'EmployeeProfile')
                                      //                         .doc(data[
                                      //                             'employeeId'])
                                      //                         .collection(
                                      //                             'DeliveryRequest')
                                      //                         .doc(data[
                                      //                             'orderId'])
                                      //                         .collection(
                                      //                             'productsDetails')
                                      //                         .snapshots(),
                                      //                     builder: (context,
                                      //                         statussnap) {
                                      //                       if (snapshot
                                      //                           .hasData) {
                                      //                         if (statussnap
                                      //                                 .connectionState ==
                                      //                             ConnectionState
                                      //                                 .waiting) {
                                      //                           return const SizedBox();
                                      //                         } else if (statussnap
                                      //                             .data!
                                      //                             .docs
                                      //                             .isEmpty) {
                                      //                           return const Text(
                                      //                               "Pickuped");
                                      //                         } else {
                                      //                           return const Text(
                                      //                               'Pending');
                                      //                         }
                                      //                       } else {
                                      //                         return const Text(
                                      //                             '');
                                      //                       }
                                      //                     }),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      const Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text(
                                            // product['deliveredtime'] ?? '',
                                            "11.30",
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyles
                                                .deliveryTextStyle1,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text(
                                            data['price'].toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyles
                                                .deliveryTextStyle1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey.shade200,
                                  height: 3,
                                )
                              ],
                            );
                          },
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
