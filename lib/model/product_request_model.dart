import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRequestModel {
  String productName;
  String productId;
  int quantity;
  bool pending;
  String docId;
  String category;
  String time;
  String employeeName;
  String employeeId;

  ProductRequestModel(
      {required this.productName,
      required this.productId,
      required this.quantity,
      required this.pending,
      required this.docId,
      required this.category,
      required this.time,
      required this.employeeName,
      required this.employeeId});

  factory ProductRequestModel.fromMap(DocumentSnapshot map) {
    return ProductRequestModel(
        productName: map['productName'],
        productId: map['productId'],
        quantity: map['quantity'],
        pending: map['pending'],
        docId: map['docId'],
        category: map['category'],
        time: map['time'],
        employeeName: map['employeeName'],
        employeeId: map['employeeId']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'productId': productId,
      'quantity': quantity,
      'pending': pending,
      'docId': docId,
      'category': category,
      'time': time,
      'employeeName': employeeName,
      'employeeId': employeeId
    };
  }

  String toJson() => json.encode(toMap());
}
