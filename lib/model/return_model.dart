// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReturnTypeModel {
  String docid;
  String typevalue;
  ReturnTypeModel({
    required this.docid,
    required this.typevalue,
  });

  ReturnTypeModel copyWith({
    String? docid,
    String? typevalue,
  }) {
    return ReturnTypeModel(
      docid: docid ?? this.docid,
      typevalue: typevalue ?? this.typevalue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'typevalue': typevalue,
    };
  }

  factory ReturnTypeModel.fromMap(Map<String, dynamic> map) {
    return ReturnTypeModel(
      docid: map['docid'] ?? '',
      typevalue: map['typevalue'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ReturnTypeModel.fromJson(String source) =>
      ReturnTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ReturnTypeModel(docid: $docid, typevalue: $typevalue)';

  @override
  bool operator ==(covariant ReturnTypeModel other) {
    if (identical(this, other)) return true;

    return other.docid == docid && other.typevalue == typevalue;
  }

  @override
  int get hashCode => docid.hashCode ^ typevalue.hashCode;
}
