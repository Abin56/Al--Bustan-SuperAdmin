import 'package:canteen_superadmin_website/controller/suppliers_controller/suppliers_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/model/canteen_model.dart';
import 'package:canteen_superadmin_website/view/textstysle/textstyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CanteenViewPage extends StatelessWidget {
  final SuppliersControllers suppliersController = SuppliersControllers();

  CanteenViewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 0,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(width: 1, color: AppColors.lightBlackColor),
                  top: BorderSide(width: 1, color: AppColors.lightBlackColor),
                  bottom:
                      BorderSide(width: 1, color: AppColors.lightBlackColor),
                  left: BorderSide(
                    width: 1,
                    color: AppColors.lightBlackColor,
                  ),
                ),
              ),
              width: 1880,
              height: size.height * 0.96,
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('CanteenList')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("No data"),
                    );
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: Text("No data"),
                    );
                  } else {
                    List<DataRow> dataRows = List.generate(
                      snapshot.data!.docs.length,
                      (index) {
                        final canteenData = CanteenModel.fromMap(
                          snapshot.data!.docs[index].data(),
                        );
                        Color containerColor = AppColors.lightGreyColor;

                        return DataRow(
                          color: MaterialStateColor.resolveWith(
                              (states) => containerColor),
                          cells: [
                            DataCell(Text((index + 1).toString())),
                            DataCell(
                              Container(
                                height: 60,
                                width: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(canteenData.image),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            DataCell(Text(canteenData.schoolName)),
                            DataCell(Text(canteenData.canteenId)),
                            DataCell(Text(canteenData.schoolAddress)),
                            DataCell(Text(canteenData.contactPerson)),
                            DataCell(
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      const Text("Start time : "),
                                      Text(canteenData.workstartTime),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text("End time : "),
                                      Text(canteenData.workEndTime),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            DataCell(
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Get.to(
                                      //   () => SuppliersProfile(
                                      //       existingSupplier: canteenData),
                                      // );
                                    },
                                    icon: const Icon(
                                      Icons.edit_note_sharp,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete,
                                      color: AppColors.redColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );

                    return DataTable(
                      columnSpacing: 10,
                      // ignore: deprecated_member_use
                      dataRowHeight: 80,
                      headingRowColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.greyColor,
                      ),
                      columns: const [
                        DataColumn(
                          label: Text(
                            "No",
                            style: AppTextStyles.pendingDeliveryTextStyle1,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Image",
                            style: AppTextStyles.pendingDeliveryTextStyle1,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "School Name",
                            style: AppTextStyles.pendingDeliveryTextStyle1,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Canteen Id",
                            style: AppTextStyles.pendingDeliveryTextStyle1,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "School Address",
                            style: AppTextStyles.pendingDeliveryTextStyle1,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Contacts",
                            style: AppTextStyles.pendingDeliveryTextStyle1,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Working Time",
                            style: AppTextStyles.pendingDeliveryTextStyle1,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Actions",
                            style: AppTextStyles.pendingDeliveryTextStyle1,
                          ),
                        ),
                      ],
                      rows: dataRows,
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
