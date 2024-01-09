// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductSubcategoryModel {
  String docid;
  String subcategoryName;
  ProductSubcategoryModel({
    required this.docid,
    required this.subcategoryName,
  });

  ProductSubcategoryModel copyWith({
    String? docid,
    String? subcategoryName,
  }) {
    return ProductSubcategoryModel(
      docid: docid ?? this.docid,
      subcategoryName: subcategoryName ?? this.subcategoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'subcategoryName': subcategoryName,
    };
  }

  factory ProductSubcategoryModel.fromMap(Map<String, dynamic> map) {
    return ProductSubcategoryModel(
      docid: map['docid'] ?? '',
      subcategoryName: map['subcategoryName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductSubcategoryModel.fromJson(String source) =>
      ProductSubcategoryModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductSubcategoryModel(docid: $docid, subcategoryName: $subcategoryName)';

  @override
  bool operator ==(covariant ProductSubcategoryModel other) {
    if (identical(this, other)) return true;

    return other.docid == docid && other.subcategoryName == subcategoryName;
  }

  @override
  int get hashCode => docid.hashCode ^ subcategoryName.hashCode;
}
