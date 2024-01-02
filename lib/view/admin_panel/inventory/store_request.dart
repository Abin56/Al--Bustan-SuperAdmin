import 'package:canteen_superadmin_website/controller/store_controller.dart';
import 'package:canteen_superadmin_website/view/admin_panel/inventory/invetory_sreen.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreRequetWidget extends StatelessWidget {
  StoreRequetWidget({super.key});

  final getStroreCtr = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: sizeH * 0.85,
        width: double.infinity,
        decoration: BoxDecoration(
            color: cWhite,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(blurRadius: 0.5),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      width: 1050,
                      child: Row(
                        children: [
                          const ImageWidget(
                              image: 'assets/drawer_images/inventory.png'),
                          sWidtht10,
                          GooglePoppinsWidgets(
                            text: 'Add Store Request',
                            fontsize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 40,
                            width: sizeW * 0.1,
                            child: const CupertinoSearchTextField(),
                          ),
                          sWidtht10,
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: cGreen),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: GooglePoppinsWidgets(
                                    text: "+ Add New Item",
                                    fontsize: 14,
                                    color: cWhite),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                    width: 1050,
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: 'Item Code'),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: 'Photo'),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: 'Item Name'),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: 'Item Group'),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: "Last Purchase"),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: "On Hand"),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: "Action"),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: ListView.separated(
                                // scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return StoreRequestTileWidget(
                                      index: index,
                                      itemCode: "uashu",
                                      image: 'adsad',
                                      itemName: "Carrot",
                                      itemGroup: 'Veg',
                                      purchasDate: '12/12/2023',
                                      stock: '50');
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const Divider();
                                },
                                itemCount: 10),
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StoreRequestTileWidget extends StatelessWidget {
  const StoreRequestTileWidget({
    required this.index,
    required this.itemCode,
    required this.image,
    required this.itemName,
    required this.itemGroup,
    required this.purchasDate,
    required this.stock,
    super.key,
  });

  final int index;
  final String itemCode;
  final String image;
  final String itemName;
  final String itemGroup;
  final String purchasDate;
  final String stock;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: itemCode,
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: image,
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: itemName,
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: itemGroup,
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: purchasDate,
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: stock,
          ),
          MaterialButton(
            onPressed: () {
              customShowDilogBox(
                  context: context,
                  title: "Make Store Request",
                  children: [StoreTextFieldWidget(hint: 'Quantity')],
                  doyouwantActionButton: true);
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: cGreen),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GooglePoppinsWidgets(
                  text: 'Make Request',
                  fontsize: 12,
                  color: cWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class NewStoreRequetWidget extends StatelessWidget {
//   const NewStoreRequetWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final sizeW = MediaQuery.of(context).size.width;
//     return Container(
//       width: sizeW * 0.7,
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               GooglePoppinsWidgets(
//                 text: 'Add Store Request',
//                 fontsize: 20,
//                 fontWeight: FontWeight.w500,
//               ),
//               sHeight10,
//               StoreTextFieldWidget(
//                 hint: 'Product Name',
//               ),
//               sHeight10,
//               StoreTextFieldWidget(
//                 hint: "Quantity",
//               ),
//               sHeight10,
//               StoreTextFieldWidget(
//                 hint: "Quantity",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore: must_be_immutable
class StoreTextFieldWidget extends StatelessWidget {
  StoreTextFieldWidget({super.key, required this.hint, this.width});

  final String hint;
  double? width;
  // final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: TextField(
        // controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintText: hint,
        ),
      ),
    );
  }
}