import 'package:canteen_superadmin_website/controller/suppliers_controller/suppliers_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/model/suppliers_model.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/supplier_adding_widget.dart';
import 'package:canteen_superadmin_website/view/textstysle/textstyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuppliersViewPage extends StatelessWidget {
  final SuppliersControllers suppliersController = SuppliersControllers();
  SuppliersViewPage({
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
                    .collection('SuppliersList')
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
                        final suppliersData = SuppliersModel.fromMap(
                            snapshot.data!.docs[index].data());
                        Color containerColor = Colors.white;
                        if (!suppliersData.isEnabled) {
                          containerColor = AppColors.lightGreyColor;
                        }
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
                                    image: NetworkImage(suppliersData.image),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            DataCell(Text(suppliersData.suppliersName)),
                            DataCell(Text(suppliersData.suppliersId)),
                            DataCell(Text(suppliersData.suppliersAddress)),
                            DataCell(Text(suppliersData.contactPerson)),
                            DataCell(
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      const Text("Start time : "),
                                      Text(suppliersData.workstartTime),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text("End time : "),
                                      Text(suppliersData.workEndTime),
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
                                      suppliersController.disableSupplier(
                                          suppliersData.docId,
                                          suppliersData.isEnabled);
                                    },
                                    icon: Icon(
                                      suppliersData.isEnabled
                                          ? Icons.block
                                          : Icons.check,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Get.to(
                                        () => SuppliersProfile(
                                            existingSupplier: suppliersData),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.edit_note_sharp,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      await suppliersController
                                          .deleteSuppliers(suppliersData.docId);
                                    },
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
                        )),
                        DataColumn(
                            label: Text(
                          "Image",
                          style: AppTextStyles.pendingDeliveryTextStyle1,
                        )),
                        DataColumn(
                            label: Text(
                          "Suppliers Name",
                          style: AppTextStyles.pendingDeliveryTextStyle1,
                        )),
                        DataColumn(
                            label: Text(
                          "Suppliers Id",
                          style: AppTextStyles.pendingDeliveryTextStyle1,
                        )),
                        DataColumn(
                            label: Text(
                          "Address",
                          style: AppTextStyles.pendingDeliveryTextStyle1,
                        )),
                        DataColumn(
                            label: Text(
                          "Contact",
                          style: AppTextStyles.pendingDeliveryTextStyle1,
                        )),
                        DataColumn(
                            label: Text(
                          "Working Time",
                          style: AppTextStyles.pendingDeliveryTextStyle1,
                        )),
                        DataColumn(
                            label: Text(
                          "Actions",
                          style: AppTextStyles.pendingDeliveryTextStyle1,
                        )),
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







// import 'package:canteen_superadmin_website/controller/suppliers_controller/suppliers_controller.dart';
// import 'package:canteen_superadmin_website/core/colors/colors.dart';
// import 'package:canteen_superadmin_website/model/suppliers_model.dart';
// import 'package:canteen_superadmin_website/view/admin_panel/store_admin/supplier_adding_widget.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SuppliersViewPage extends StatelessWidget {
//   final SuppliersControllers suppliersController = SuppliersControllers();

//   SuppliersViewPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: 60,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               color: Color.fromARGB(255, 150, 149, 149),
//             ),
//             child: const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: 5),
//                   child: Text(
//                     "No",
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ),
//                 Text(
//                   "Image",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 Text(
//                   "Suppliers Name",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 Text(
//                   "Suppliers Id",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 Text(
//                   "Address",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 Text(
//                   "Contact",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(right: 10),
//                   child: Text(
//                     "Working Time",
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(right: 10),
//                   child: Text(
//                     "",
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection('SuppliersList')
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.data!.docs.isEmpty) {
//                   return const Center(
//                     child: Text("No data"),
//                   );
//                 } else if (!snapshot.hasData) {
//                   return const Center(
//                     child: Text("No data"),
//                   );
//                 } else {
//                   return ListView.builder(
//                     itemCount: snapshot.data!.docs.length,
//                     itemBuilder: (context, index) {
//                       final SuppliersData = SuppliersModel.fromMap(
//                           snapshot.data!.docs[index].data());
//                       Color containerColor = Colors.white;
//                       if (!SuppliersData.isEnabled) {
//                         containerColor = AppColors.lightGreyColor;
//                       }
//                       return Padding(
//                         padding:
//                             const EdgeInsets.only(left: 12, right: 12, top: 8),
//                         child: Container(
//                           height: 80,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             color: containerColor,
//                             border: const Border(
//                               bottom: BorderSide(color: Colors.grey),
//                             ),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 8.0),
//                                 child: Text((index + 1).toString()),
//                               ),
//                               Container(
//                                 height: 60,
//                                 width: 60,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: NetworkImage(SuppliersData.image),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               Text(SuppliersData.suppliersName),
//                               Text(SuppliersData.suppliersId),
//                               Text(SuppliersData.suppliersAddress),
//                               Text(SuppliersData.contactPerson),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 10.0),
//                                 child: Column(
//                                   children: [
//                                     Text(SuppliersData.workstartTime),
//                                     Text(SuppliersData.workEndTime),
//                                   ],
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   IconButton(
//                                     onPressed: () {
//                                       suppliersController.disableSupplier(
//                                           SuppliersData.docId,
//                                           SuppliersData.isEnabled);
//                                     },
//                                     icon: Icon(
//                                       SuppliersData.isEnabled
//                                           ? Icons.block
//                                           : Icons.check,
//                                     ),
//                                   ),
//                                   IconButton(
//                                     onPressed: () {
//                                       Get.to(() => SuppliersProfile(
//                                           existingSupplier: SuppliersData));
//                                     },
//                                     icon: const Icon(
//                                       Icons.edit,
//                                       color: Colors.blue,
//                                     ),
//                                   ),
//                                   IconButton(
//                                     onPressed: () async {
//                                       await suppliersController
//                                           .deleteSuppliers(SuppliersData.docId);
//                                     },
//                                     icon: const Icon(
//                                       Icons.delete,
//                                       color: Colors.red,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
