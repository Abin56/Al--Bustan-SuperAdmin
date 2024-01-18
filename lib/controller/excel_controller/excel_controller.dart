import 'dart:typed_data';

import 'package:canteen_superadmin_website/model/all_product_model.dart';
import 'package:canteen_superadmin_website/model/product_model.dart';
import 'package:canteen_superadmin_website/core/constant/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ExcelController extends GetxController {
  final firestore = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;

  Future<void> uploadExcelFunction() async {
    //extract excel data
    final result = await extractDataFromExcel();
    isLoading.value = true;
    if (result != null) {
      if (result.tables.isNotEmpty) {
        Sheet? table = result.tables[result.tables.keys.first];
        if (table != null) {
          List<Data?>? headRow = table.rows[0];
          if (headRow[0]?.value.toString() == "PRODUCT CODE/SKU" &&
              headRow[1]?.value.toString() == "PRODUCT NAME" &&
              headRow[2]?.value.toString() == "UNIT" &&
              headRow[3]?.value.toString() == "COMPANY NAME/ BRAND" &&
              headRow[4]?.value.toString() == "QUANTITY IN STOCK") {
            for (int i = 1; i < table.maxRows; i++) {
              final uuid = const Uuid().v1();
              String time = DateTime.now().toString();
              List<Data?>? firstRow = table.rows[i];

              //fetching data from excel cells

              // final data = ProductAddingModel(
              //     docId: uuid,
              //     barcodeNumber: firstRow[0]?.value.toString() ?? "",
              //     productname: firstRow[1]?.value.toString() ?? "",
              //     categoryID: "",
              //     categoryName: "",
              //     price: 0,
              //     quantityinStock: firstRow[4]?.value.toString() ?? "0",
              //     expiryDate: "",
              //     addDate: "",
              //     authuid: "",
              //     companyName: firstRow[3]?.value.toString() ?? "");

              // firestore
              //     .collection("temporaryCollection")
              //     .doc(uuid)
              //     .set(data.toMap());
              if (firstRow[0]?.value != null ||
                  firstRow[1]?.value != null ||
                  firstRow[2]?.value != null ||
                  firstRow[3]?.value != null ||
                  firstRow[4]?.value != null ||
                  firstRow[5]?.value != null) {
                final data = ProductAddingModel(
                    docId: uuid,
                    barcodeNumber: firstRow[0]?.value.toString() == "null"
                        ? ""
                        : firstRow[0]!.value.toString(),
                    productname: firstRow[1]?.value.toString() == "null"
                        ? ""
                        : firstRow[1]!.value.toString(),
                    categoryID: "",
                    categoryName: "",
                    inPrice: "",
                    outPrice: "",
                    quantityinStock: firstRow[4]?.value.toString() == "null"
                        ? "0"
                        : firstRow[4]!.value.toString(),
                    expiryDate: "",
                    addDate: "",
                    authuid: "",
                    unit: firstRow[2]?.value.toString() == "null"
                        ? ""
                        : firstRow[2]!.value.toString(),
                    packageType: firstRow[4]?.value.toString() == "null"
                        ? ""
                        : firstRow[4]!.value.toString(),
                    companyName: firstRow[5]?.value.toString() == "null"
                        ? ""
                        : firstRow[5]!.value.toString(),
                    returnType: '',
                    time: time);

                firestore
                    .collection("temporaryCollection")
                    .doc(uuid)
                    .set(data.toMap());
              }
            }

            isLoading.value = false;
            showToast(msg: 'Sheet added');
          } else {
            isLoading.value = false;
            showToast(msg: 'Sheet Not Match');
          }
        } else {
          isLoading.value = false;
          showToast(msg: 'Empty Sheet');
        }
      }
    }
    isLoading.value = false;
  }

  Future<Excel?> extractDataFromExcel() async {
    /// Use FilePicker to pick files in Flutter Web

    try {
      FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
        allowMultiple: false,
      );

      /// file might be picked

      if (pickedFile != null) {
        Uint8List? bytes = pickedFile.files.single.bytes;
        if (bytes != null) {
          Excel excel = Excel.decodeBytes(bytes);

          return excel;
        }
      } else {
        showToast(msg: "Excel File Error");
      }
    } catch (e) {
      showToast(msg: "Something went wrong");
      return null;
    }
    return null;
  }

  Future<void> uploadExcelFunction2() async {
    //extract excel data
    final result = await extractDataFromExcel();
    isLoading.value = true;
    if (result != null) {
      if (result.tables.isNotEmpty) {
        Sheet? table = result.tables[result.tables.keys.first];
        if (table != null) {
          List<Data?>? headRow = table.rows[0];
          if (headRow[0]?.value.toString() == "Item Name" &&
              headRow[1]?.value.toString() == "Main Category " &&
              headRow[2]?.value.toString() == "Sub Category" &&
              headRow[3]?.value.toString() == "Unit Of Measurement " &&
              headRow[4]?.value.toString() == "Packaging " &&
              headRow[5]?.value.toString() == "Company Name ") {
            for (int i = 1; i < table.maxRows; i++) {
              final uuid = const Uuid().v1();
              String time = DateTime.now().toString();
              List<Data?>? firstRow = table.rows[i];
              if (firstRow[0]?.value != null ||
                  firstRow[1]?.value != null ||
                  firstRow[2]?.value != null ||
                  firstRow[3]?.value != null ||
                  firstRow[4]?.value != null ||
                  firstRow[5]?.value != null) {
                final data = AllProductDetailModel(
                    docId: uuid,
                    barcodeNumber: "",
                    productname: firstRow[0]?.value.toString() == "null"
                        ? ""
                        : firstRow[0]!.value.toString(),
                    categoryID: "",
                    categoryName: firstRow[1]?.value.toString() == "null"
                        ? ""
                        : firstRow[1]!.value.toString(),
                    subcategoryID: "",
                    subcategoryName: firstRow[2]?.value.toString() == "null"
                        ? ""
                        : firstRow[2]!.value.toString(),
                    inPrice: 0,
                    outPrice: 0,
                    quantityinStock: 0,
                    expiryDate: "",
                    addedDate: time,
                    authuid: "",
                    unitcategoryID: "",
                    unitcategoryName: firstRow[3]?.value.toString() == "null"
                        ? ""
                        : firstRow[3]!.value.toString(),
                    packageType: firstRow[4]?.value.toString() == "null"
                        ? ""
                        : firstRow[4]!.value.toString(),
                    packageTypeID: "",
                    companyName: firstRow[5]?.value.toString() == "null"
                        ? ""
                        : firstRow[5]!.value.toString(),
                    companyNameID: "",
                    returnType: "",
                    itemcode: "",
                    outofstock: false,
                    isavailable: false);

                firestore.collection("Stock").doc(uuid).set(data.toMap());
              }
            }

            isLoading.value = false;
            showToast(msg: 'Sheet added');
          } else {
            isLoading.value = false;
            showToast(msg: 'Sheet Not Match');
          }
        } else {
          isLoading.value = false;
          showToast(msg: 'Empty Sheet');
        }
      }
    }
    isLoading.value = false;
  }
}
