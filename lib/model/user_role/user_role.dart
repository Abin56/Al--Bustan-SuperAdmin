// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserRoleModel {
  String docid;
  String name;
  String value;
  UserRoleModel({
    required this.docid,
    required this.name,
    required this.value,
  });

  UserRoleModel copyWith({
    String? docid,
    String? name,
    String? value,
  }) {
    return UserRoleModel(
      docid: docid ?? this.docid,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'name': name,
      'value': value,
    };
  }

  factory UserRoleModel.fromMap(Map<String, dynamic> map) {
    return UserRoleModel(
      docid: map['docid'] ?? "",
      name: map['name'] ?? "",
      value: map['value'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRoleModel.fromJson(String source) =>
      UserRoleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserRoleModel(docid: $docid, name: $name, value: $value)';

  @override
  bool operator ==(covariant UserRoleModel other) {
    if (identical(this, other)) return true;

    return other.docid == docid && other.name == name && other.value == value;
  }

  @override
  int get hashCode => docid.hashCode ^ name.hashCode ^ value.hashCode;
}
