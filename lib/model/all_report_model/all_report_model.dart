// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AllReportModel {
  String productName;
  String date;
  String companyName;
  String type;
  int countOrQty;
  int price;
  int totalPrice;

  AllReportModel({
    required this.productName,
    required this.date,
    required this.companyName,
    required this.type,
    required this.countOrQty,
    required this.price,
    required this.totalPrice,
  });
  // AllReportModel({required this.productName});

  AllReportModel copyWith({
    String? productName,
    String? date,
    String? companyName,
    String? type,
    int? countOrQty,
    int? price,
    int? totalPrice,
  }) {
    return AllReportModel(
      productName: productName ?? this.productName,
      date: date ?? this.date,
      companyName: companyName ?? this.companyName,
      type: type ?? this.type,
      countOrQty: countOrQty ?? this.countOrQty,
      price: price ?? this.price,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'date': date,
      'companyName': companyName,
      'type': type,
      'countOrQty': countOrQty,
      'price': price,
      'totalPrice': totalPrice,
    };
  }

  factory AllReportModel.fromMap(Map<String, dynamic> map) {
    return AllReportModel(
      productName: map['productName'] as String,
      date: map['date'] as String,
      companyName: map['companyName'] as String,
      type: map['type'] as String,
      countOrQty: map['countOrQty'] as int,
      price: map['price'] as int,
      totalPrice: map['totalPrice'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllReportModel.fromJson(String source) =>
      AllReportModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AllReportModel(productName: $productName, date: $date, companyName: $companyName, type: $type, countOrQty: $countOrQty, price: $price, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(covariant AllReportModel other) {
    if (identical(this, other)) return true;

    return other.productName == productName &&
        other.date == date &&
        other.companyName == companyName &&
        other.type == type &&
        other.countOrQty == countOrQty &&
        other.price == price &&
        other.totalPrice == totalPrice;
  }

  @override
  int get hashCode {
    return productName.hashCode ^
        date.hashCode ^
        companyName.hashCode ^
        type.hashCode ^
        countOrQty.hashCode ^
        price.hashCode ^
        totalPrice.hashCode;
  }
}
