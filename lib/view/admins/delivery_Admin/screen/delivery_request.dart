import 'package:canteen_superadmin_website/controller/delivery_controller/delivery_controller.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:canteen_superadmin_website/model/employee_request_model.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/screen/stock_upload_widget.dart';
import 'package:canteen_superadmin_website/view/textstysle/textstyle.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryRequest extends StatelessWidget {
  const DeliveryRequest({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: size.height * 0.85,
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all()),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GooglePoppinsWidgets(
                text: 'Delivey Request List',
                fontsize: 20,
                fontWeight: FontWeight.w500,
              ),
              sHeight10,
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
                            "Request ID",
                            style: AppTextStyles.textStyle1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Canteen Name",
                            style: AppTextStyles.textStyle1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Employee Name",
                            style: AppTextStyles.textStyle1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Time",
                            style: AppTextStyles.textStyle1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Items",
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
                      Expanded(
                        child: Center(
                          child: Text(
                            "Action",
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
                      .collection('EmployeeDeliveryRequest')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child:
                            GooglePoppinsWidgets(text: "No data", fontsize: 15),
                      );
                    } else if (!snapshot.hasData) {
                      return Center(
                        child:
                            GooglePoppinsWidgets(text: "No data", fontsize: 15),
                      );
                    } else {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            final data = EmployeeRequestModel.fromMap(
                                snapshot.data!.docs[index].data());
                            return EmployeeRequestTile(
                              data: data,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: snapshot.data!.docs.length);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EmployeeRequestTile extends StatelessWidget {
  EmployeeRequestTile({super.key, required this.data});
  final EmployeeRequestModel data;
  final delivertCtr = Get.put(DeliveryController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: MarqueeWidget(
                  text: data.requestId, flex: 1, color: cWhite, velocity: 100),
              // child: GooglePoppinsWidgets(text: data.requestId, fontsize: 14),
            ),
          ),
          Expanded(
            child: Center(
              child: MarqueeWidget(
                  text: data.canteenName,
                  flex: 1,
                  color: cWhite,
                  velocity: 100),
              // child: GooglePoppinsWidgets(text: data.CanteenName, fontsize: 14),
            ),
          ),
          Expanded(
            child: Center(
              child:
                  GooglePoppinsWidgets(text: data.emplopeeName, fontsize: 14),
            ),
          ),
          Expanded(
            child: Center(
              child: GooglePoppinsWidgets(
                  text: dateConveter(DateTime.parse(data.time)), fontsize: 14),
            ),
          ),
          Expanded(
            child: Center(
              child: GooglePoppinsWidgets(
                  text: data.orderCount.toString(), fontsize: 14),
            ),
          ),
          Expanded(
            child: Center(
              child: GooglePoppinsWidgets(
                  text: data.amount.toString(), fontsize: 14),
            ),
          ),

          Expanded(
              child: Center(
                  child: IconButton(
            onPressed: () {
              customShowDilogBox(
                  context: context,
                  title: 'Details',
                  children: [
                    EmployeeRequestProductDetailsWidget(
                      data: data,
                    )
                  ],
                  actiononTapfuction: () {
                    delivertCtr.confirmEmployeeRequest(data);
                  },
                  doyouwantActionButton: true);
            },
            icon: const Icon(Icons.more_vert_outlined),
          )))
          // Expanded(
          //   child: Container(
          //     height: 50,
          //     child: Row(
          //       children: [
          //         Expanded(
          //           child: Padding(
          //             padding: const EdgeInsets.all(5.0),
          //             child: GestureDetector(
          //               onTap: () {
          //                 delivertCtr.confirmEmployeeRequest(data);
          //               },
          //               child: Container(
          //                 color: cGreen,
          //                 child: Center(
          //                     child: GooglePoppinsWidgets(
          //                   text: "Confirm",
          //                   fontsize: 12,
          //                   color: cWhite,
          //                 )),
          //               ),
          //             ),
          //           ),
          //         ),
          //         Expanded(
          //           child: Padding(
          //             padding: const EdgeInsets.all(5.0),
          //             child: GestureDetector(
          //               onTap: () async {
          //                 await delivertCtr.cancelEmployeeRequest(data);
          //               },
          //               child: Container(
          //                 color: cred,
          //                 child: Center(
          //                     child: GooglePoppinsWidgets(
          //                   text: "Cancel",
          //                   fontsize: 12,
          //                   color: cWhite,
          //                 )),
          //               ),
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

class EmployeeRequestProductDetailsWidget extends StatelessWidget {
  const EmployeeRequestProductDetailsWidget({super.key, required this.data});
  final EmployeeRequestModel data;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.5,
      height: size.height * 0.4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
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
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Product ID",
                          style: AppTextStyles.textStyle2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Product Name",
                          style: AppTextStyles.textStyle2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Available Qty",
                          style: AppTextStyles.textStyle2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Requested Qty",
                          style: AppTextStyles.textStyle2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Price",
                          style: AppTextStyles.textStyle2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Action",
                          style: AppTextStyles.textStyle2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('EmployeeDeliveryRequest')
                      .doc(data.requestId)
                      .collection('RequestProductDetails')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child:
                            GooglePoppinsWidgets(text: "No data", fontsize: 15),
                      );
                    } else if (!snapshot.hasData) {
                      return Center(
                        child:
                            GooglePoppinsWidgets(text: "No data", fontsize: 15),
                      );
                    } else {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            final productdata = AllProductDetailModel.fromMap(
                                snapshot.data!.docs[index].data());
                            return Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: GooglePoppinsWidgets(
                                        text: productdata.barcodeNumber,
                                        fontsize: 14),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: GooglePoppinsWidgets(
                                        text: productdata.productname,
                                        fontsize: 14),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection('AvailableProducts')
                                            .doc(productdata.docId)
                                            .snapshots(),
                                        builder: (context, qtySnapshot) {
                                          if (qtySnapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const SizedBox();
                                          } else if (!qtySnapshot
                                              .data!.exists) {
                                            return const SizedBox();
                                          } else if (!qtySnapshot.hasData) {
                                            return const SizedBox();
                                          } else {
                                            return GooglePoppinsWidgets(
                                                text: qtySnapshot
                                                    .data!['quantityinStock']
                                                    .toString(),
                                                fontsize: 14);
                                          }
                                        }),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: GooglePoppinsWidgets(
                                        text: productdata.quantityinStock
                                            .toString(),
                                        fontsize: 14),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: GooglePoppinsWidgets(
                                        text: productdata.outPrice.toString(),
                                        fontsize: 14),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      color: cGreen,
                                      height: 40,
                                      width: 100,
                                      child: Center(
                                        child: GooglePoppinsWidgets(
                                          text: "Action",
                                          fontsize: 14,
                                          color: cWhite,
                                        ),
                                      )),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: snapshot.data!.docs.length);
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }
}
