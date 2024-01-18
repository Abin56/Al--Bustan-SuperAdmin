// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UnitCategoryModel {
  String docid;
  String unitCategoryName;
  UnitCategoryModel({
    required this.docid,
    required this.unitCategoryName,
  });

  UnitCategoryModel copyWith({
    String? docid,
    String? quantityTypeName,
  }) {
    return UnitCategoryModel(
      docid: docid ?? this.docid,
      unitCategoryName: quantityTypeName ?? this.unitCategoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'value': unitCategoryName,
    };
  }

  factory UnitCategoryModel.fromMap(Map<String, dynamic> map) {
    return UnitCategoryModel(
      docid: map['docid'] ?? '',
      unitCategoryName: map['value'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UnitCategoryModel.fromJson(String source) =>
      UnitCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductCategoryModel(docid: $docid, value: $unitCategoryName)';

  @override
  bool operator ==(covariant UnitCategoryModel other) {
    if (identical(this, other)) return true;

    return other.docid == docid && other.unitCategoryName == unitCategoryName;
  }

  @override
  int get hashCode => docid.hashCode ^ unitCategoryName.hashCode;
}
