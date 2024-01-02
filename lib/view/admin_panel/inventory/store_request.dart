import 'package:canteen_superadmin_website/controller/employee_controller/employee_controller.dart';
import 'package:canteen_superadmin_website/controller/store_controller.dart';
import 'package:canteen_superadmin_website/model/employe_createprofile_model.dart';
import 'package:canteen_superadmin_website/model/product_model.dart';
import 'package:canteen_superadmin_website/view/admin_panel/inventory/invetory_sreen.dart';
import 'package:canteen_superadmin_website/view/colors/colors.dart';
import 'package:canteen_superadmin_website/view/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/view/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                            child: StreamBuilder(
                                stream: getStroreCtr.getProductDataFromDB(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (!snapshot.hasData) {
                                    return Center(
                                      child: GooglePoppinsWidgets(
                                          text: "No data", fontsize: 15),
                                    );
                                  } else {
                                    return ListView.separated(
                                        // scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final productData =
                                              ProductAddingModel.fromMap(
                                                  snapshot.data!.docs[index]);
                                          return StoreRequestTileWidget(
                                            index: index,
                                            itemCode: productData.barcodeNumber,
                                            image: 'Image',
                                            itemName: productData.productname,
                                            itemGroup: productData.categoryName,
                                            purchasDate: dateConveter(
                                                DateTime.parse(
                                                    productData.expiryDate)),
                                            stock: productData.quantityinStock
                                                .toString(),
                                            category: productData.categoryName,
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const Divider();
                                        },
                                        itemCount: snapshot.data!.docs.length);
                                  }
                                }),
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
  StoreRequestTileWidget({
    required this.index,
    required this.itemCode,
    required this.image,
    required this.itemName,
    required this.itemGroup,
    required this.purchasDate,
    required this.category,
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
  final category;
  final employeeController = Get.put(EmployeeController());
  final storeCtr = Get.put(StoreController());

  final TextEditingController quantityCtr = TextEditingController();

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
                  children: [
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: TextField(
                        controller: quantityCtr,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          hintText: "Quantity",
                        ),
                      ),
                    ),
                    sHeight10,
                    SizedBox(
                      height: 60,
                      child: DropdownSearch<EmployeeProfileCreateModel>(
                        autoValidateMode: AutovalidateMode.always,
                        asyncItems: (value) {
                          employeeController.employeeList.clear();

                          return employeeController.fetchEmployees();
                        },
                        itemAsString: (value) => value.name,
                        onChanged: (value) async {
                          // employeeController.employeeUID.value = true;
                          if (value != null) {
                            employeeController.employeeUID.value = value.docid;
                            employeeController.employeeName = value.name;
                          }
                        },
                        dropdownDecoratorProps: DropDownDecoratorProps(
                            baseStyle: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.black.withOpacity(0.7))),
                      ),
                    )
                  ],
                  actiononTapfuction: () {
                    final employeeID =
                        Get.find<EmployeeController>().employeeUID;
                    final emplopeeName =
                        Get.find<EmployeeController>().employeeName;
                    storeCtr.addStoreRequest(
                        employeeId: employeeID.value,
                        productName: itemName,
                        productId: itemCode,
                        quantity: int.parse(quantityCtr.text),
                        pending: true,
                        category: category,
                        employeeName: emplopeeName,
                        context: context);
                  },
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
  StoreTextFieldWidget({
    super.key,
    required this.hint,
    required this.controller,
    this.width,
  });

  final String hint;
  double? width;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintText: hint,
        ),
      ),
    );
  }
}
