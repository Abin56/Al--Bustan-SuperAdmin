// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EmployeeProfileCreateModel {
  String docid;
  String name;
  String email;
  String phoneNo;
  String imageURl;
  bool activate;
  EmployeeProfileCreateModel({
    required this.docid,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.imageURl,
    required this.activate,
  });

  EmployeeProfileCreateModel copyWith({
    String? docid,
    String? name,
    String? email,
    String? phoneNo,
    String? imageURl,
    bool? activate,
  }) {
    return EmployeeProfileCreateModel(
      docid: docid ?? this.docid,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNo: phoneNo ?? this.phoneNo,
      imageURl: imageURl ?? this.imageURl,
      activate: activate ?? this.activate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'name': name,
      'email': email,
      'phoneNo': phoneNo,
      'imageURl': imageURl,
      'activate': activate,
    };
  }

  factory EmployeeProfileCreateModel.fromMap(Map<String, dynamic> map) {
    return EmployeeProfileCreateModel(
      docid: map['docid'] ??'',
      name: map['name'] ??'',
      email: map['email'] ??'',
      phoneNo: map['phoneNo'] ??'',
      imageURl: map['imageURl'] ??'',
      activate: map['activate'] ??false,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeProfileCreateModel.fromJson(String source) =>
      EmployeeProfileCreateModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EmployeeProfileCreateModel(docid: $docid, name: $name, email: $email, phoneNo: $phoneNo, imageURl: $imageURl, activate: $activate)';
  }

  @override
  bool operator ==(covariant EmployeeProfileCreateModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.docid == docid &&
      other.name == name &&
      other.email == email &&
      other.phoneNo == phoneNo &&
      other.imageURl == imageURl &&
      other.activate == activate;
  }

  @override
  int get hashCode {
    return docid.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phoneNo.hashCode ^
      imageURl.hashCode ^
      activate.hashCode;
  }
}
