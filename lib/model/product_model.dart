// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductAddingModel {
  String docId;
  String barcodeNumber;
  String productname;
  String categoryID;
  String categoryName;
  int price;
  int quantityinStock;
  String expiryDate;
  String addDate;
  String authuid;

  ProductAddingModel({
    required this.docId,
    required this.barcodeNumber,
    required this.productname,
    required this.categoryID,
    required this.categoryName,
    required this.price,
    required this.quantityinStock,
    required this.expiryDate,
    required this.addDate,
    required this.authuid,
  });

  ProductAddingModel copyWith({
    String? docId,
    String? barcodeNumber,
    String? productname,
    String? categoryID,
    String? categoryName,
    int? price,
    int? quantityinStock,
    String? expiryDate,
    String? addDate,
    String? authuid,
  }) {
    return ProductAddingModel(
      docId: docId ?? this.docId,
      barcodeNumber: barcodeNumber ?? this.barcodeNumber,
      productname: productname ?? this.productname,
      categoryID: categoryID ?? this.categoryID,
      categoryName: categoryName ?? this.categoryName,
      price: price ?? this.price,
      quantityinStock: quantityinStock ?? this.quantityinStock,
      expiryDate: expiryDate ?? this.expiryDate,
      addDate: addDate ?? this.addDate,
      authuid: authuid ?? this.authuid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docId': docId,
      'barcodeNumber': barcodeNumber,
      'productname': productname,
      'categoryID': categoryID,
      'categoryName': categoryName,
      'price': price,
      'quantityinStock': quantityinStock,
      'expiryDate': expiryDate,
      'addDate': addDate,
      'authuid': authuid,
    };
  }

  factory ProductAddingModel.fromMap(DocumentSnapshot map) {
    return ProductAddingModel(
      docId: map['docId'] ?? '',
      barcodeNumber: map['barcodeNumber'] ?? '',
      productname: map['productname'] ?? '',
      categoryID: map['categoryID'] ?? '',
      categoryName: map['categoryName'] ?? '',
      price: map['price'] as int,
      quantityinStock: map['quantityinStock'] ?? 0,
      expiryDate: map['expiryDate'] ?? '',
      addDate: map['addDate'] ?? '',
      authuid: map['authuid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  // factory ProductAddingModel.fromJson(String source) =>
  //     ProductAddingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductAddingModel(docId: $docId, barcodeNumber: $barcodeNumber, productname: $productname, categoryID: $categoryID, categoryName: $categoryName, price: $price, quantityinStock: $quantityinStock, expiryDate: $expiryDate, addDate: $addDate, authuid: $authuid)';
  }

  @override
  bool operator ==(covariant ProductAddingModel other) {
    if (identical(this, other)) return true;

    return other.docId == docId &&
        other.barcodeNumber == barcodeNumber &&
        other.productname == productname &&
        other.categoryID == categoryID &&
        other.categoryName == categoryName &&
        other.price == price &&
        other.quantityinStock == quantityinStock &&
        other.expiryDate == expiryDate &&
        other.addDate == addDate &&
        other.authuid == authuid;
  }

  @override
  int get hashCode {
    return docId.hashCode ^
        barcodeNumber.hashCode ^
        productname.hashCode ^
        categoryID.hashCode ^
        categoryName.hashCode ^
        price.hashCode ^
        quantityinStock.hashCode ^
        expiryDate.hashCode ^
        addDate.hashCode ^
        authuid.hashCode;
  }
}
