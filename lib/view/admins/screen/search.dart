import 'package:canteen_superadmin_website/controller/store_controller/all_product_controller.dart';
import 'package:canteen_superadmin_website/controller/wearhouse_controller/wearhouse_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:canteen_superadmin_website/view/admins/store_Admin/screen/supplier_adding_widget.dart';
import 'package:canteen_superadmin_website/view/admins/warehouse_Admin/screen/manual_product_adding_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  final AllProductController allProductCtr = Get.find<AllProductController>();
  final TextEditingController searchController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    allProductCtr.getallStockList();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: searchController,
                onChanged: (String keyword) {
                  // if (keyword.isNotEmpty) {
                  //   // allProductCtr.searchProductsByName(keyword);

                  // }
                  allProductCtr.searchByProductName(keyword);
                },
                decoration: InputDecoration(
                  labelText: 'Search by Product Name',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      // searchController.clear();
                      // allProductCtr.searchProductsByName('');
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  // if (allProductCtr.loading.value) {
                  //   return const Center(
                  //     child: CircularProgressIndicator(),
                  //   );
                  // }

                  // List<AllProductDetailModel> searchResults =
                  //     allProductCtr.searchResults;

                  // if (allProductCtr.error.value.isNotEmpty) {
                  //   return Center(
                  //     child: Text(allProductCtr.error.value),
                  //   );
                  // }

                  if (allProductCtr.searchList.isEmpty) {
                    return const Center(
                      child: Text('No results found.'),
                    );
                  }

                  return AllProductSearchContainer(
                      allProductCtr: allProductCtr);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AllProductSearchContainer extends StatelessWidget {
  const AllProductSearchContainer({
    super.key,
    required this.allProductCtr,
  });

  final AllProductController allProductCtr;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 1700,
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: cGrey,
                border: Border.all(),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: 150, child: Text('Item Code')),
                    SizedBox(width: 150, child: Text('Item Name')),
                    SizedBox(width: 150, child: Text('Company')),
                    SizedBox(width: 150, child: Text('Category')),
                    SizedBox(width: 150, child: Text('Subcategory')),
                    SizedBox(width: 150, child: Text('Unit')),
                    SizedBox(width: 150, child: Text('Package Type')),
                    SizedBox(width: 150, child: Text('Limit')),
                    SizedBox(width: 150, child: Text('Expiry Date')),
                    SizedBox(width: 150, child: Text('InPrice')),
                    SizedBox(width: 150, child: Text('Action')),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  // final product = searchResults[index];
                  final product = allProductCtr.searchList.value[index];
                  return InventoryTileWidget(
                    productData: product,
                    index: index,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemCount: allProductCtr.searchList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InventoryTileWidget extends StatelessWidget {
  final AllProductDetailModel productData;
  final allProductCtr = Get.put(AllProductController());
  final getWarehouseCtr = Get.put(WearHouseController());
  final int index;

  InventoryTileWidget({
    super.key,
    required this.productData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          SizedBox(width: 150, child: Text(productData.barcodeNumber)),
          SizedBox(width: 150, child: Text(productData.productname)),
          SizedBox(width: 150, child: Text(productData.companyName)),
          SizedBox(
              width: 150, child: Text(productData.categoryName.toString())),
          SizedBox(
              width: 150, child: Text(productData.subcategoryName.toString())),
          SizedBox(
              width: 150, child: Text(productData.unitcategoryName.toString())),
          SizedBox(width: 150, child: Text(productData.packageType.toString())),
          SizedBox(width: 150, child: Text(productData.limit.toString())),
          SizedBox(width: 150, child: Text(productData.expiryDate.toString())),
          SizedBox(width: 150, child: Text(productData.inPrice.toString())),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                // PopupMenuItem(
                //   onTap: () {

                //   },
                //   child: Text('Edit Quantity'),
                // ),
                // PopupMenuItem(
                //   onTap: () {

                //   },
                //   child: Text('Storekeeper details'),
                // ),
                PopupMenuItem(
                  onTap: () {
                    allProductCtr.productNameController.text =
                        productData.productname;
                    allProductCtr.limitCtr.text = productData.limit.toString();
                    allProductCtr.expiryDateController.text =
                        productData.expiryDate;
                    allProductCtr.inPriceController.text =
                        productData.inPrice.toString();
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
                  child: const Text('Edit'),
                ),
              ];
            },
          )
        ],
      ),
    );
  }
}
