// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductCategoryModel {
  String docid;
  String categoryName;
  ProductCategoryModel({
    required this.docid,
    required this.categoryName,
  });

  ProductCategoryModel copyWith({
    String? docid,
    String? categoryName,
  }) {
    return ProductCategoryModel(
      docid: docid ?? this.docid,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'categoryName': categoryName,
    };
  }

  factory ProductCategoryModel.fromMap(Map<String, dynamic> map) {
    return ProductCategoryModel(
      docid: map['docid'] ?? '',
      categoryName: map['categoryName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCategoryModel.fromJson(String source) =>
      ProductCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductCategoryModel(docid: $docid, categoryName: $categoryName)';

  @override
  bool operator ==(covariant ProductCategoryModel other) {
    if (identical(this, other)) return true;

    return other.docid == docid && other.categoryName == categoryName;
  }

  @override
  int get hashCode => docid.hashCode ^ categoryName.hashCode;
}
