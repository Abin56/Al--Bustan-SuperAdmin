// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductQuantityModel {
  String docid;
  String quantityTypeName;
  ProductQuantityModel({
    required this.docid,
    required this.quantityTypeName,
  });

  ProductQuantityModel copyWith({
    String? docid,
    String? quantityTypeName,
  }) {
    return ProductQuantityModel(
      docid: docid ?? this.docid,
      quantityTypeName: quantityTypeName ?? this.quantityTypeName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'value': quantityTypeName,
    };
  }

  factory ProductQuantityModel.fromMap(Map<String, dynamic> map) {
    return ProductQuantityModel(
      docid: map['docid'] ?? '',
      quantityTypeName: map['value'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductQuantityModel.fromJson(String source) =>
      ProductQuantityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductCategoryModel(docid: $docid, value: $quantityTypeName)';

  @override
  bool operator ==(covariant ProductQuantityModel other) {
    if (identical(this, other)) return true;

    return other.docid == docid && other.quantityTypeName == quantityTypeName;
  }

  @override
  int get hashCode => docid.hashCode ^ quantityTypeName.hashCode;
}
