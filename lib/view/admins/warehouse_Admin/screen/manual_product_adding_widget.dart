import 'package:canteen_superadmin_website/controller/wearhouse_controller/wearhouse_controller.dart';
import 'package:canteen_superadmin_website/core/colors/colors.dart';
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
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController inPriceController = TextEditingController();
  final TextEditingController outPriceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController addedDateController = TextEditingController();
  final TextEditingController packageTypeController = TextEditingController();
  final TextEditingController itemCodeController = TextEditingController();

  ProductAddingScreen({super.key});

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
                    controller: barcodeController,
                    decoration: _customInputDecoration('Barcode Number'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: productNameController,
                    decoration: _customInputDecoration('Product Name'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: inPriceController,
                    decoration: _customInputDecoration('In Price'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: outPriceController,
                    decoration: _customInputDecoration('Out Price'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: quantityController,
                    decoration: _customInputDecoration('Quantity'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: expiryDateController,
                    decoration: _customInputDecoration('Expiry Date'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: itemCodeController,
                    decoration: _customInputDecoration('Item Code'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CategorySetUpWidget(),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Example button color
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

class CategorySetUpWidget extends StatelessWidget {
  CategorySetUpWidget({
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
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class SubCategorySetUpWidget extends StatelessWidget {
  SubCategorySetUpWidget({
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
        onChanged: (value) async {},
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class UnitSetUpWidget extends StatelessWidget {
  UnitSetUpWidget({
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
          // if (value != null) {
          //   wearhouseCtr.productCategoryName.value = value.categoryName;
          //   wearhouseCtr.productCategoryID.value = value.docid;
          // }
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class PackageSetUpWidget extends StatelessWidget {
  PackageSetUpWidget({
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
          // if (value != null) {
          //   wearhouseCtr.productCategoryName.value = value.categoryName;
          //   wearhouseCtr.productCategoryID.value = value.docid;
          // }
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}

class CompanySetUpWidget extends StatelessWidget {
  CompanySetUpWidget({
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
          // if (value != null) {
          //   wearhouseCtr.productCategoryName.value = value.categoryName;
          //   wearhouseCtr.productCategoryID.value = value.docid;
          // }
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins(
                fontSize: 13, color: Colors.black.withOpacity(0.7))),
      )),
    );
  }
}
