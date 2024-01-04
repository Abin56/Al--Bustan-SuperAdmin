// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PackageTypeModel {
  String docid;
  String typevalue;
  PackageTypeModel({
    required this.docid,
    required this.typevalue,
  });

  PackageTypeModel copyWith({
    String? docid,
    String? typevalue,
  }) {
    return PackageTypeModel(
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

  factory PackageTypeModel.fromMap(Map<String, dynamic> map) {
    return PackageTypeModel(
      docid: map['docid'] ?? '',
      typevalue: map['typevalue'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PackageTypeModel.fromJson(String source) =>
      PackageTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PackageTypeModel(docid: $docid, typevalue: $typevalue)';

  @override
  bool operator ==(covariant PackageTypeModel other) {
    if (identical(this, other)) return true;

    return other.docid == docid && other.typevalue == typevalue;
  }

  @override
  int get hashCode => docid.hashCode ^ typevalue.hashCode;
}
