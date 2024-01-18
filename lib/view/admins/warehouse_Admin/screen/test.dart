// import 'package:canteen_superadmin_website/controller/wearhouse_controller/wearhouse_controller.dart';
// import 'package:canteen_superadmin_website/core/core.dart';
// import 'package:canteen_superadmin_website/model/all_product_model.dart';
// import 'package:canteen_superadmin_website/model/suppliers_model.dart';
// import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/screen/stock_upload_widget.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class test extends StatelessWidget {
//   test({super.key});

//   final wearhouseCtr = Get.put(WearHouseController());

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           TextField(),
//           Container(
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey.withOpacity(0.2))),
//             child: Center(
//                 child: DropdownSearch<SuppliersModel>(
//               validator: (item) {
//                 if (item == null) {
//                   return "Required field";
//                 } else {
//                   return null;
//                 }
//               },
//               // autoValidateMode: AutovalidateMode.always,
//               asyncItems: (value) {
//                 wearhouseCtr.supplierList.clear();

//                 return wearhouseCtr.fetchSupplireModel();
//               },
//               itemAsString: (value) => value.suppliersName,
//               onChanged: (value) async {
//                 // if (value != null) {
//                 //   wearhouseCtr.productCategoryName.value = value.categoryName;
//                 //   wearhouseCtr.productCategoryID.value = value.docid;
//                 // }
//               },
//               dropdownDecoratorProps: DropDownDecoratorProps(
//                   baseStyle: GoogleFonts.poppins(
//                       fontSize: 13, color: Colors.black.withOpacity(0.7))),
//             )),
//           ),
//           Expanded(
//             child: StreamBuilder(
//                 stream: dataserver.collection('TemporaryStockList').snapshots(),
//                 builder: (context, snapshot) {
//                   return ListView.separated(
//                       itemBuilder: (context, index) {
//                         final data = AllProductDetailModel.fromMap(
//                             snapshot.data!.docs[index].data());
//                         return ListTile(
//                           title: Text(data.productname),
//                           subtitle: Text(data.companyName),
//                         );
//                       },
//                       separatorBuilder: (context, index) {
//                         return Divider();
//                       },
//                       itemCount: snapshot.data!.docs.length);
//                 }),
//           )
//         ],
//       ),
//     );
//   }
// }

// class textcalss extends GetxController {
//   RxList<AllProductDetailModel> newlist = <AllProductDetailModel>[].obs;
// }

// search(String text, String com) {
//   newlist.value = allList
//       .where(
//           (element) => element.name!.toLowerCase().contains(text.toLowerCase()))
//       .toList();
//   update();
// }
