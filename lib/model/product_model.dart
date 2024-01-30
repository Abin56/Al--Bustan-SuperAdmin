// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductAddingModel {
  String docId;
  String barcodeNumber;
  String productname;
  String categoryID;
  String categoryName;
  String inPrice;
  String outPrice;
  String quantityinStock;
  String expiryDate;
  String addDate;
  String authuid;
  String unit;
  String packageType;
  String companyName;
  String returnType;
  String time;

  ProductAddingModel(
      {required this.docId,
      required this.barcodeNumber,
      required this.productname,
      required this.categoryID,
      required this.categoryName,
      required this.inPrice,
      required this.outPrice,
      required this.quantityinStock,
      required this.expiryDate,
      required this.addDate,
      required this.authuid,
      required this.unit,
      required this.packageType,
      required this.companyName,
      required this.time,
      required this.returnType});

  ProductAddingModel copyWith({
    String? docId,
    String? barcodeNumber,
    String? productname,
    String? categoryID,
    String? categoryName,
    String? inPrice,
    String? outPrice,
    String? quantityinStock,
    String? expiryDate,
    String? addDate,
    String? authuid,
    String? unit,
    String? packageType,
    String? companyName,
    String? returnType,
    String? time,
  }) {
    return ProductAddingModel(
        docId: docId ?? this.docId,
        barcodeNumber: barcodeNumber ?? this.barcodeNumber,
        productname: productname ?? this.productname,
        categoryID: categoryID ?? this.categoryID,
        categoryName: categoryName ?? this.categoryName,
        inPrice: inPrice ?? this.inPrice,
        outPrice: outPrice ?? this.outPrice,
        quantityinStock: quantityinStock ?? this.quantityinStock,
        expiryDate: expiryDate ?? this.expiryDate,
        addDate: addDate ?? this.addDate,
        authuid: authuid ?? this.authuid,
        unit: unit ?? this.unit,
        packageType: packageType ?? this.unit,
        companyName: categoryName ?? this.companyName,
        returnType: returnType ?? this.returnType,
        time: time ?? this.time);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docId': docId,
      'barcodeNumber': barcodeNumber,
      'productname': productname,
      'categoryID': categoryID,
      'categoryName': categoryName,
      'inPrice': inPrice,
      'outPrice': outPrice,
      'quantityinStock': quantityinStock,
      'expiryDate': expiryDate,
      'addDate': addDate,
      'authuid': authuid,
      'unit': unit,
      'packageType': packageType,
      'companyName': companyName,
      'returnType': returnType,
      'time': time
    };
  }

  factory ProductAddingModel.fromMap(DocumentSnapshot map) {
    return ProductAddingModel(
        docId: map['docId'] ?? '',
        barcodeNumber: map['barcodeNumber'] ?? '',
        productname: map['productname'] ?? '',
        categoryID: map['categoryID'] ?? '',
        categoryName: map['categoryName'] ?? '',
        inPrice: map['inPrice'] ?? "0",
        outPrice: map['outPrice'] ?? "0",
        quantityinStock: map['quantityinStock'] ?? "0",
        expiryDate: map['expiryDate'] ?? '',
        addDate: map['addDate'] ?? '',
        authuid: map['authuid'] ?? '',
        unit: map['unit'] ?? '',
        packageType: map['packageType'] ?? '',
        companyName: map['companyName'] ?? '',
        returnType: map['returnType'] ?? '',
        time: map['time'] ?? '');
  }

  String toJson() => json.encode(toMap());

  // factory ProductAddingModel.fromJson(String source) =>
  //     ProductAddingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductAddingModel(docId: $docId, barcodeNumber: $barcodeNumber, productname: $productname, categoryID: $categoryID, categoryName: $categoryName, inPrice: $inPrice,outPrice: $outPrice, quantityinStock: $quantityinStock, expiryDate: $expiryDate, addDate: $addDate, authuid: $authuid,unit: $unit,packageType: $packageType,companyName:$categoryName, returnType:$returnType,time:$time )';
  }

  @override
  bool operator ==(covariant ProductAddingModel other) {
    if (identical(this, other)) return true;

    return other.docId == docId &&
        other.barcodeNumber == barcodeNumber &&
        other.productname == productname &&
        other.categoryID == categoryID &&
        other.categoryName == categoryName &&
        other.inPrice == inPrice &&
        other.outPrice == outPrice &&
        other.quantityinStock == quantityinStock &&
        other.expiryDate == expiryDate &&
        other.addDate == addDate &&
        other.authuid == authuid &&
        other.unit == unit &&
        other.packageType == packageType &&
        other.companyName == companyName &&
        other.returnType == returnType &&
        other.time == time;
  }

  @override
  int get hashCode {
    return docId.hashCode ^
        barcodeNumber.hashCode ^
        productname.hashCode ^
        categoryID.hashCode ^
        categoryName.hashCode ^
        inPrice.hashCode ^
        outPrice.hashCode ^
        quantityinStock.hashCode ^
        expiryDate.hashCode ^
        addDate.hashCode ^
        authuid.hashCode ^
        unit.hashCode ^
        packageType.hashCode ^
        companyName.hashCode ^
        returnType.hashCode ^
        time.hashCode;
  }
}
