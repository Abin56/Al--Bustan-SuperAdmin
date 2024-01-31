import 'package:canteen_superadmin_website/controller/store_controller/all_product_controller.dart';
import 'package:canteen_superadmin_website/controller/store_controller/store_controller.dart';
import 'package:canteen_superadmin_website/controller/wearhouse_controller/wearhouse_controller.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:canteen_superadmin_website/view/admin_panel/store_admin/storekeeper_details.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/supplier_adding_widget.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/screen/manual_product_adding_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
// import 'package:canteen_superadmin_website/view/widgets/responsive/responsive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllStockList extends StatelessWidget {
  AllStockList({super.key});

  final getStroreCtr = Get.put(StoreController());

  final TextEditingController categoryCtr = TextEditingController();

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
                      width: 1650,
                      child: Row(
                        children: [
                          const ImageWidget(
                              image: 'web_images/drawer_images/inventory.png'),
                          sWidtht10,
                          GooglePoppinsWidgets(
                            text: 'All Stocks',
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
                          MaterialButton(
                            onPressed: () {
                              Get.to(ProductAddingScreen());
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: cGreen),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: GooglePoppinsWidgets(
                                      text: "Add Stock",
                                      fontsize: 14,
                                      color: cWhite),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                    width: 1650,
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: 'Item Code'),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: 'Item Name'),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: 'Company'),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: 'Category'),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: "Subcategory"),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: 'Unit'),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: 'PackageType'),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: 'Limit'),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: 'Expiry Date'),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: 'InPrice'),
                            ListViewTableHeaderWidget(
                                width: 150, headerTitle: "Action"),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('AllProductStockCollection')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
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
                                    return ListView.separated(
                                        // scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final productData =
                                              AllProductDetailModel.fromMap(
                                                  snapshot.data!.docs[index]
                                                      .data());
                                          return InventoryTileWidget(
                                            productData: productData,
                                            index: index,
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

class InventoryTileWidget extends StatelessWidget {
  InventoryTileWidget({
    required this.productData,
    required this.index,
    super.key,
  });

  final getWarehouseCtr = Get.put(WearHouseController());
  final allProductCtr = Get.put(AllProductController());

  final int index;

  final AllProductDetailModel productData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: productData.barcodeNumber,
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: productData.productname,
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: productData.companyName,
          ),

          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: productData.categoryName.toString(),
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: productData.subcategoryName.toString(),
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: productData.unitcategoryName.toString(),
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: productData.packageType.toString(),
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: productData.limit.toString(),
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: productData.expiryDate.toString(),
          ),
          DataContainerWidget(
            index: index,
            width: 150,
            headerTitle: productData.inPrice.toString(),
          ),

          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    onTap: () {
                      customShowDilogBox(
                        context: context,
                        title: "Quantity",
                        children: [
                          TextFormFiledContainerWidget(
                              controller: getWarehouseCtr.quantityCtr,
                              hintText: "Quantity",
                              title: 'Quantity',
                              width: 200)
                        ],
                        doyouwantActionButton: true,
                        actiononTapfuction: () {
                          getWarehouseCtr.editQuantity(productData.docId,
                              int.parse(getWarehouseCtr.quantityCtr.text));
                        },
                      );
                    },
                    child: GooglePoppinsWidgets(
                        text: 'Edit Quantity', fontsize: 11)),
                PopupMenuItem(
                  onTap: () {
                    customShowDilogBox(
                        context: context,
                        title: "Shopkeeper Datails",
                        children: [
                          const StoreKeeperDatailsWidget(),
                        ],
                        doyouwantActionButton: true);
                    // ShowDialogWidget(context, StoreKeeperDatailsWidget());
                  },
                  child: GooglePoppinsWidgets(
                      text: 'Storekeeper details', fontsize: 11),
                ),
                //  <<< Edit  >>>>
                PopupMenuItem(
                  onTap: () {
                    customShowDilogBox(
                      context: context,
                      title: "Edit",
                      children: [
                        TextFormFiledContainerWidget(
                          controller: allProductCtr.productNameController,
                          hintText: "Item Name",
                          title: 'Item Name',
                          width: 300,
                        ),
                        TextFormFiledContainerWidget(
                            controller: allProductCtr.limitCtr,
                            hintText: "Limit",
                            title: 'Limit',
                            width: 300),
                        TextFormFiledContainerWidget(
                            controller: allProductCtr.expiryDateController,
                            hintText: "Expiry Date",
                            title: 'Expiry Date',
                            width: 300),
                        TextFormFiledContainerWidget(
                          controller: allProductCtr.inPriceController,
                          hintText: "InPrice",
                          title: 'InPrice',
                          width: 300,
                        ),
                        sHeight10,
                        GooglePoppinsWidgets(
                            text: "Company Name", fontsize: 14),
                        // drop
                        CompanySetUpWidget1(),
                        sHeight10,
                        GooglePoppinsWidgets(text: "Category", fontsize: 14),
                        CategorySetUpWidget1(),
                        sHeight10,
                        GooglePoppinsWidgets(text: "Subcategory", fontsize: 14),
                        SubCategorySetUpWidget1(),
                        sHeight10,
                        GooglePoppinsWidgets(text: "Unit", fontsize: 14),
                        UnitSetUpWidget1(),
                        sHeight10,
                        GooglePoppinsWidgets(
                            text: "Package Type", fontsize: 14),
                        PackageSetUpWidget1(),
                      ],
                      doyouwantActionButton: true,
                      actiononTapfuction: () {
                        allProductCtr.editProductList(
                          productData.docId,
                          allProductCtr.productNameController.text,
                          allProductCtr.expiryDateController.text,
                          int.parse(allProductCtr.inPriceController.text),
                          int.parse(allProductCtr.limitCtr.text),
                          getWarehouseCtr.productCompanyName.value,
                          getWarehouseCtr.productCompanyID.value,
                          getWarehouseCtr.productCategoryName.value,
                          getWarehouseCtr.productCategoryID.value,
                          getWarehouseCtr.productSubCategoryID.value,
                          getWarehouseCtr.productSubCategoryName.value,
                          getWarehouseCtr.productUnitID.value,
                          getWarehouseCtr.productUnitName.value,
                          getWarehouseCtr.productPackageID.value,
                          getWarehouseCtr.productPackageName.value,
                        );
                      },
                    );
                  },
                  child: GooglePoppinsWidgets(
                    text: 'Edit',
                    fontsize: 11,
                  ),
                )
              ];
            },
          )
        ],
      ),
    );
  }
}

class ListViewTableHeaderWidget extends StatelessWidget {
  final String headerTitle;
  final double? width;

  const ListViewTableHeaderWidget({
    this.width,
    required this.headerTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
          color: cLateGrey,
          border: Border.symmetric(
            horizontal: BorderSide(color: cBlack.withOpacity(0.5)),
          )),
      child: Center(
        child: Text(
          headerTitle,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
      ),
    );
  }
}

class DataContainerWidget extends StatelessWidget {
  final int index;
  final String headerTitle;
  final double? width;
  final Color? color;
  final double? height;

  const DataContainerWidget({
    required this.index,
    this.color,
    this.width,
    this.height,
    required this.headerTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Center(
        child: Text(
          headerTitle,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12.5),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    required this.image,
    super.key,
  });

  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 30, width: 30, child: Image.asset(image));
  }
}
