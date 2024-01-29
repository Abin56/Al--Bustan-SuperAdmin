import 'package:canteen_superadmin_website/controller/excel_controller/excel_controller.dart';
import 'package:canteen_superadmin_website/controller/wearhouse_controller/wearhouse_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/const.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:canteen_superadmin_website/model/canteen_model.dart';
import 'package:canteen_superadmin_website/model/category_model.dart';
import 'package:canteen_superadmin_website/model/packagetype_model.dart';
import 'package:canteen_superadmin_website/model/quantity_model.dart';
import 'package:canteen_superadmin_website/model/subcategory_model.dart';
import 'package:canteen_superadmin_website/model/suppliers_model.dart';
import 'package:canteen_superadmin_website/view/admin_panel/store_admin/all_stock_details_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/button_container_widget/button_container_widget.dart';
import 'package:canteen_superadmin_website/view/widgets/button_container_widget/custom_button.dart';
import 'package:canteen_superadmin_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StockUploadWidget extends StatelessWidget {
  StockUploadWidget({super.key});

  final excelCtr = Get.put(ExcelController());
  final wearhouseCtr = Get.put(WearHouseController());
  final GlobalKey<FormState> fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: fkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            decoration: BoxDecoration(border: Border.all()),
            // width: 1180,
            width: size.width,
            height: size.height - 110,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      GooglePoppinsWidgets(
                        text: "ADD STOCK",
                        fontsize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: ButtonContainerWidget(
                            text: 'UPLOAD EXCEL',
                            width: 120,
                            height: 40,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            onTap: () async {
                              await excelCtr.uploadExcelFunction2();
                              if (fkey.currentState?.validate() ?? false) {
                                wearhouseCtr.addToAllStock();
                              }
                            }),
                      ),
                      sWidtht10,
                      Obx(() => wearhouseCtr.isLoading.value == false
                          ? Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: ButtonContainerWidget(
                                  text: 'UPLOAD TO TEMPORARY LIST',
                                  width: 200,
                                  height: 40,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  onTap: () async {
                                    if (fkey.currentState?.validate() ??
                                        false) {
                                      wearhouseCtr.addToAllStock();
                                    }
                                  }),
                            )
                          : const CircularProgressIndicator())
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: cLateGrey,
                    border: Border.all(),
                  ),
                  child: const Row(
                    children: [
                      HeadWidget(
                        headName: 'SL. NO.',
                        flex: 1,
                      ),
                      HeadWidget(
                        headName: 'Item Name',
                        flex: 2,
                      ),
                      HeadWidget(
                        headName: 'Main Category',
                        flex: 2,
                      ),
                      HeadWidget(
                        headName: 'Sub Category',
                        flex: 2,
                      ),
                      HeadWidget(
                        headName: 'Unit',
                        flex: 2,
                      ),
                      HeadWidget(
                        headName: 'Packaging',
                        flex: 2,
                      ),
                      HeadWidget(
                        headName: 'Company',
                        flex: 2,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: StreamBuilder(
                      stream: dataserver.collection("Stock").snapshots(),
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
                            itemBuilder: (context, index) {
                              final productData = AllProductDetailModel.fromMap(
                                  snapshot.data!.docs[index].data());
                              return Row(
                                children: [
                                  StockDdetailsWidget(
                                    text: '${index + 1}',
                                    flex: 1,
                                  ),
                                  StockDdetailsWidget(
                                      text: productData.productname, flex: 2),
                                  productData.categoryID == ""
                                      ? Expanded(
                                          flex: 2,
                                          child: CategorySetUpWidget(
                                              index: index, data: productData))
                                      : Expanded(
                                          flex: 2,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    productData.categoryName,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12.5),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  wearhouseCtr
                                                      .productCategoryEdit(
                                                          "",
                                                          "",
                                                          productData.docId);
                                                },
                                                icon: const Icon(
                                                  Icons.edit_note_rounded,
                                                  color: cBlue,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                  productData.subcategoryID == ""
                                      ? Expanded(
                                          flex: 2,
                                          child: SubCategorySetUpWidget(
                                              index: index, data: productData))
                                      : Expanded(
                                          flex: 2,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    productData.subcategoryName,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12.5),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  wearhouseCtr
                                                      .productSubCategoryEdit(
                                                          "",
                                                          "",
                                                          productData.docId);
                                                },
                                                icon: const Icon(
                                                  Icons.edit_note_rounded,
                                                  color: cBlue,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                  productData.unitcategoryID == ""
                                      ? Expanded(
                                          flex: 2,
                                          child: unitSetUpWidget(
                                              index: index, data: productData))
                                      : Expanded(
                                          flex: 2,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    productData
                                                        .unitcategoryName,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12.5),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  wearhouseCtr
                                                      .productUnitCategoryEdit(
                                                          "",
                                                          "",
                                                          productData.docId);
                                                },
                                                icon: const Icon(
                                                  Icons.edit_note_rounded,
                                                  color: cBlue,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                  productData.packageTypeID == ""
                                      ? Expanded(
                                          flex: 2,
                                          child: PackageSetUpWidget(
                                              index: index, data: productData))
                                      : Expanded(
                                          flex: 2,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    productData.packageType,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12.5),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  wearhouseCtr
                                                      .productPackageTypeEdit(
                                                          "",
                                                          "",
                                                          productData.docId);
                                                },
                                                icon: const Icon(
                                                  Icons.edit_note_rounded,
                                                  color: cBlue,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                  productData.companyNameID == ""
                                      ? Expanded(
                                          flex: 2,
                                          child: CompanySetUpWidget(
                                              index: index, data: productData))
                                      : Expanded(
                                          flex: 2,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    productData.companyName,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12.5),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  wearhouseCtr
                                                      .productCompanyEdit(
                                                          "",
                                                          "",
                                                          productData.docId);
                                                },
                                                icon: const Icon(
                                                  Icons.edit_note_rounded,
                                                  color: cBlue,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: snapshot.data!.docs.length,
                          );
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategorySetUpWidget extends StatelessWidget {
  final int index;
  final AllProductDetailModel data;
  CategorySetUpWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  final wearhouseCtr = Get.put(WearHouseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? Colors.grey.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
          border: Border.all(color: cGrey.withOpacity(0.2))),
      child: Center(
          child: DropdownSearch<ProductCategoryModel>(
        validator: (item) {
          if (item == null) {
            return "Required field";
          } else {
            return null;
          }
        },
        // autoValidateMode: AutovalidateMode.onUserInteraction,
        asyncItems: (value) {
          wearhouseCtr.productCategoryList.clear();

          return wearhouseCtr.fetchProductCategoryModel();
        },
        itemAsString: (value) => value.categoryName,
        onChanged: (value) async {
          if (value != null) {
            wearhouseCtr.productCategoryName.value = value.categoryName;
            wearhouseCtr.productCategoryID.value = value.docid;
          }
          wearhouseCtr.productCategoryEdit(
              value!.categoryName, value.docid, data.docId);
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class SubCategorySetUpWidget extends StatelessWidget {
  final int index;
  final AllProductDetailModel data;
  SubCategorySetUpWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  final wearhouseCtr = Get.put(WearHouseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? Colors.grey.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
          border: Border.all(color: cGrey.withOpacity(0.2))),
      child: Center(
          child: DropdownSearch<ProductSubcategoryModel>(
        validator: (item) {
          if (item == null) {
            return "Required field";
          } else {
            return null;
          }
        },
        // autoValidateMode: AutovalidateMode.always,
        asyncItems: (value) {
          wearhouseCtr.productSubCategoryList.clear();

          return wearhouseCtr.fetchProductSubCategoryModel();
        },
        itemAsString: (value) => value.subcategoryName,
        onChanged: (value) async {
          // if (value != null) {
          //   wearhouseCtr.productCategoryName.value = value.categoryName;
          //   wearhouseCtr.productCategoryID.value = value.docid;
          // }
          wearhouseCtr.productSubCategoryEdit(
              value!.subcategoryName, value.docid, data.docId);
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class unitSetUpWidget extends StatelessWidget {
  final int index;
  final AllProductDetailModel data;
  unitSetUpWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  final wearhouseCtr = Get.put(WearHouseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? Colors.grey.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
          border: Border.all(color: cGrey.withOpacity(0.2))),
      child: Center(
          child: DropdownSearch<UnitCategoryModel>(
        validator: (item) {
          if (item == null) {
            return "Required field";
          } else {
            return null;
          }
        },
        // autoValidateMode: AutovalidateMode.always,
        asyncItems: (value) {
          wearhouseCtr.unitCategoryList.clear();

          return wearhouseCtr.fetchUnitCategoryModel();
        },
        itemAsString: (value) => value.unitCategoryName,
        onChanged: (value) async {
          // if (value != null) {
          //   wearhouseCtr.productCategoryName.value = value.categoryName;
          //   wearhouseCtr.productCategoryID.value = value.docid;
          // }
          wearhouseCtr.productUnitCategoryEdit(
              value!.unitCategoryName, value.docid, data.docId);
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class PackageSetUpWidget extends StatelessWidget {
  final int index;
  final AllProductDetailModel data;
  PackageSetUpWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  final wearhouseCtr = Get.put(WearHouseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? Colors.grey.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
          border: Border.all(color: cGrey.withOpacity(0.2))),
      child: Center(
          child: DropdownSearch<PackageTypeModel>(
        validator: (item) {
          if (item == null) {
            return "Required field";
          } else {
            return null;
          }
        },
        // autoValidateMode: AutovalidateMode.always,
        asyncItems: (value) {
          wearhouseCtr.packageTypeList.clear();

          return wearhouseCtr.fetchPackageTypeModel();
        },
        itemAsString: (value) => value.typevalue,
        onChanged: (value) async {
          // if (value != null) {
          //   wearhouseCtr.productCategoryName.value = value.categoryName;
          //   wearhouseCtr.productCategoryID.value = value.docid;
          // }
          wearhouseCtr.productPackageTypeEdit(
              value!.typevalue, value.docid, data.docId);
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class CompanySetUpWidget extends StatelessWidget {
  final int index;
  final AllProductDetailModel data;
  CompanySetUpWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  final wearhouseCtr = Get.put(WearHouseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? Colors.grey.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
          border: Border.all(color: cGrey.withOpacity(0.2))),
      child: Center(
          child: DropdownSearch<SuppliersModel>(
        validator: (item) {
          if (item == null) {
            return "Required field";
          } else {
            return null;
          }
        },
        // autoValidateMode: AutovalidateMode.always,
        asyncItems: (value) {
          wearhouseCtr.supplierList.clear();

          return wearhouseCtr.fetchSupplireModel();
        },
        itemAsString: (value) => value.suppliersName,
        onChanged: (value) async {
          // if (value != null) {
          //   wearhouseCtr.productCategoryName.value = value.categoryName;
          //   wearhouseCtr.productCategoryID.value = value.docid;
          // }
          wearhouseCtr.productCompanyEdit(
              value!.suppliersName, value.docId, data.docId);
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}
