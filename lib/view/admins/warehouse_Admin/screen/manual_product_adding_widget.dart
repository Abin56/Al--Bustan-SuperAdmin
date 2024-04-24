import 'package:canteen_superadmin_website/controller/wearhouse_controller/wearhouse_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
import 'package:canteen_superadmin_website/core/constant/constant.validate.dart';
import 'package:canteen_superadmin_website/core/fonts/google_poppins.dart';
import 'package:canteen_superadmin_website/model/category_model.dart';
import 'package:canteen_superadmin_website/model/packagetype_model.dart';
import 'package:canteen_superadmin_website/model/quantity_model.dart';
import 'package:canteen_superadmin_website/model/subcategory_model.dart';
import 'package:canteen_superadmin_website/model/suppliers_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductAddingScreen extends StatelessWidget {
  ProductAddingScreen({super.key});

  final getWarehouseCtr = Get.put(WearHouseController());

  InputDecoration _customInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: getWarehouseCtr.barcodeController,
                    decoration: _customInputDecoration('Barcode Number'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: getWarehouseCtr.productNameController,
                    decoration: _customInputDecoration('Product Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: getWarehouseCtr.inPriceController,
                    decoration: _customInputDecoration('In Price'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: getWarehouseCtr.outPriceController,
                    decoration: _customInputDecoration('Out Price'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: getWarehouseCtr.quantityController,
                    decoration: _customInputDecoration('Quantity'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: getWarehouseCtr.expiryDateController,
                    decoration: _customInputDecoration('Expiry Date'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: getWarehouseCtr.itemCodeController,
                    decoration: _customInputDecoration('Item Code'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GooglePoppinsWidgets(text: "Company Name", fontsize: 14),
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
                  GooglePoppinsWidgets(text: "Package Type", fontsize: 14),
                  PackageSetUpWidget1(),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      getWarehouseCtr.addManualStock();
                    },
                    style: ElevatedButton.styleFrom(
                
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Add Product'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategorySetUpWidget1 extends StatelessWidget {
  CategorySetUpWidget1({
    Key? key,
  }) : super(key: key);

  final wearhouseCtr = Get.put(WearHouseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.3),
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
        // autoValidateMode: AutovalidateMode.always,
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
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class SubCategorySetUpWidget1 extends StatelessWidget {
  SubCategorySetUpWidget1({
    Key? key,
  }) : super(key: key);

  final wearhouseCtr = Get.put(WearHouseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.3),
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
          if (value != null) {
            wearhouseCtr.productSubCategoryName.value = value.subcategoryName;
            wearhouseCtr.productSubCategoryID.value = value.docid;
          }
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class UnitSetUpWidget1 extends StatelessWidget {
  UnitSetUpWidget1({
    Key? key,
  }) : super(key: key);

  final wearhouseCtr = Get.put(WearHouseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.3),
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
          if (value != null) {
            wearhouseCtr.productUnitName.value = value.unitCategoryName;
            wearhouseCtr.productUnitID.value = value.docid;
          }
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class PackageSetUpWidget1 extends StatelessWidget {
  PackageSetUpWidget1({
    Key? key,
  }) : super(key: key);

  final wearhouseCtr = Get.put(WearHouseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.3),
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
          if (value != null) {
            wearhouseCtr.productPackageName.value = value.typevalue;
            wearhouseCtr.productPackageID.value = value.docid;
          }
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class CompanySetUpWidget1 extends StatelessWidget {
  CompanySetUpWidget1({
    Key? key,
  }) : super(key: key);

  final wearhouseCtr = Get.put(WearHouseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.3),
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
          if (value != null) {
            wearhouseCtr.productCompanyName.value = value.suppliersName;
            wearhouseCtr.productCompanyID.value = value.docId;
          }
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}
