// import 'package:canteen_superadmin_website/controller/store_controller/store_controller.dart';
// import 'package:canteen_superadmin_website/model/all_product_model.dart';
// import 'package:canteen_superadmin_website/core/colors/colors.dart';
// import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
// import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
// import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/product%20_adding_widget.dart';
// import 'package:canteen_superadmin_website/view/widgets/button_container_widget/custom_button.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AllStockDetails extends StatelessWidget {
//   AllStockDetails({super.key});

//   final getStroreCtr = Get.put(StoreController());
//   final TextEditingController categoryCtr = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final sizeW = MediaQuery.of(context).size.width;
//     final sizeH = MediaQuery.of(context).size.height;

//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Container(
//         height: sizeH * 0.85,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: cWhite,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: const [
//             BoxShadow(blurRadius: 0.5),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Center(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 20),
//                     child: SizedBox(
//                       width: 1050,
//                       child: Row(
//                         children: [
//                           const ImageWidget(
//                               image: 'web_images/drawer_images/inventory.png'),
//                           sWidtht10,
//                           GooglePoppinsWidgets(
//                             text: 'All Product Stock Collection',
//                             fontsize: 20,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           const Spacer(),
//                           SizedBox(
//                             height: 40,
//                             width: sizeW * 0.1,
//                             child: const CupertinoSearchTextField(),
//                           ),
//                           sWidtht10,
//                           CustomGradientButton(
//                             text: "Add Product",
//                             height: sizeH * 0.04,
//                             width: sizeW * 0.06,
//                             onPressed: () {
//                               Get.to(ProductAddingScreen());
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: SizedBox(
//                       width: 1050,
//                       child: Column(
//                         children: [
//                           const Row(
//                             children: [
//                               ListViewTableHeaderWidget(
//                                   width: 150, headerTitle: 'Item Code'),
//                               ListViewTableHeaderWidget(
//                                   width: 150, headerTitle: 'Barcode Number'),
//                               ListViewTableHeaderWidget(
//                                   width: 150, headerTitle: 'Item Name'),
//                               ListViewTableHeaderWidget(
//                                   width: 150, headerTitle: 'Item Group'),
//                               ListViewTableHeaderWidget(
//                                   width: 150, headerTitle: "Added Date"),
//                               ListViewTableHeaderWidget(
//                                   width: 150, headerTitle: "On Hand"),
//                               ListViewTableHeaderWidget(
//                                   width: 150, headerTitle: "Action"),
//                             ],
//                           ),
//                           Expanded(
//                             child: Container(
//                               decoration: const BoxDecoration(),
//                               child: StreamBuilder(
//                                 stream: FirebaseFirestore.instance
//                                     .collection('AllProductStockCollection')
//                                     .snapshots(),
//                                 builder: (context, snapshot) {
//                                   if (snapshot.connectionState ==
//                                       ConnectionState.waiting) {
//                                     return const Center(
//                                       child: CircularProgressIndicator(),
//                                     );
//                                   } else if (snapshot.data!.docs.isEmpty) {
//                                     return Center(
//                                       child: GooglePoppinsWidgets(
//                                         text: "No data",
//                                         fontsize: 15,
//                                       ),
//                                     );
//                                   } else if (!snapshot.hasData) {
//                                     return Center(
//                                       child: GooglePoppinsWidgets(
//                                         text: "No data",
//                                         fontsize: 15,
//                                       ),
//                                     );
//                                   } else {
//                                     return ListView.separated(
//                                       itemBuilder:
//                                           (BuildContext context, int index) {
//                                         final allProductData =
//                                             AllProductDetailModel.fromMap(
//                                           snapshot.data!.docs[index].data(),
//                                         );

//                                         return ListTile(
//                                           subtitle: Row(
//                                             children: [
//                                               DataContainerWidget(
//                                                   index: index,
//                                                   width: 150,
//                                                   headerTitle: allProductData
//                                                       .barcodeNumber),
//                                               DataContainerWidget(
//                                                   index: index,
//                                                   width: 150,
//                                                   headerTitle: allProductData
//                                                       .barcodeNumber),
//                                               DataContainerWidget(
//                                                   index: index,
//                                                   width: 150,
//                                                   headerTitle: allProductData
//                                                       .productname),
//                                               DataContainerWidget(
//                                                   index: index,
//                                                   width: 150,
//                                                   headerTitle: allProductData
//                                                       .categoryName),
//                                               DataContainerWidget(
//                                                 index: index,
//                                                 width: 150,
//                                                 headerTitle: dateConveter(
//                                                   DateTime.parse(
//                                                     allProductData.addedDate,
//                                                   ),
//                                                 ),
//                                               ),
//                                               DataContainerWidget(
//                                                   index: index,
//                                                   width: 150,
//                                                   headerTitle: allProductData
//                                                       .quantityinStock
//                                                       .toString()),
//                                             ],
//                                           ),
//                                         );
//                                       },
//                                       separatorBuilder:
//                                           (BuildContext context, int index) {
//                                         return const Divider();
//                                       },
//                                       itemCount: snapshot.data!.docs.length,
//                                     );
//                                   }
//                                 },
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ListViewTableHeaderWidget extends StatelessWidget {
//   final String headerTitle;
//   final double? width;

//   const ListViewTableHeaderWidget({
//     this.width,
//     required this.headerTitle,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: width,
//       decoration: BoxDecoration(
//           color: cLateGrey,
//           border: Border.symmetric(
//             horizontal: BorderSide(color: cBlack.withOpacity(0.5)),
//           )),
//       child: Center(
//         child: Text(
//           headerTitle,
//           style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
//         ),
//       ),
//     );
//   }
// }

// class DataContainerWidget extends StatelessWidget {
//   final int index;
//   final String headerTitle;
//   final double? width;
//   final Color? color;
//   final double? height;

//   const DataContainerWidget({
//     required this.index,
//     this.color,
//     this.width,
//     this.height,
//     required this.headerTitle,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//         color: color,
//       ),
//       child: Center(
//         child: Text(
//           headerTitle,
//           style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12.5),
//         ),
//       ),
//     );
//   }
// }

// class ImageWidget extends StatelessWidget {
//   const ImageWidget({
//     required this.image,
//     super.key,
//   });

//   final String image;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(height: 30, width: 30, child: Image.asset(image));
//   }
// }
