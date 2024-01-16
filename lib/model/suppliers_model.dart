// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SuppliersModel {
  String docId;
  String suppliersName;
  String suppliersId;
  String suppliersAddress;
  String contactPerson;
  String suppliersProducts;
  String workstartTime;
  String workEndTime;
  String image;
  bool isEnabled;
  SuppliersModel({
    required this.docId,
    required this.suppliersName,
    required this.suppliersId,
    required this.suppliersAddress,
    required this.contactPerson,
    required this.suppliersProducts,
    required this.workstartTime,
    required this.workEndTime,
    required this.image,
    required this.isEnabled,
  });

  SuppliersModel copyWith({
    String? docId,
    String? suppliersName,
    String? suppliersId,
    String? suppliersAddress,
    String? contactPerson,
    String? suppliersProducts,
    String? workstartTime,
    String? workEndTime,
    String? image,
    bool? isEnabled,
  }) {
    return SuppliersModel(
      docId: docId ?? this.docId,
      suppliersName: suppliersName ?? this.suppliersName,
      suppliersId: suppliersId ?? this.suppliersId,
      suppliersAddress: suppliersAddress ?? this.suppliersAddress,
      contactPerson: contactPerson ?? this.contactPerson,
      suppliersProducts: suppliersProducts ?? this.suppliersProducts,
      workstartTime: workstartTime ?? this.workstartTime,
      workEndTime: workEndTime ?? this.workEndTime,
      image: image ?? this.image,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docId': docId,
      'suppliersName': suppliersName,
      'suppliersId': suppliersId,
      'suppliersAddress': suppliersAddress,
      'contactPerson': contactPerson,
      'suppliersProducts': suppliersProducts,
      'workstartTime': workstartTime,
      'workEndTime': workEndTime,
      'image': image,
      'isEnabled': isEnabled,
    };
  }

  factory SuppliersModel.fromMap(Map<String, dynamic> map) {
    return SuppliersModel(
      docId: map['docId'] ?? '',
      suppliersName: map['suppliersName'] ?? '',
      suppliersId: map['suppliersId'] ?? '',
      suppliersAddress: map['suppliersAddress'] ?? '',
      contactPerson: map['contactPerson'] ?? '',
      suppliersProducts: map['suppliersProducts'] ?? '',
      workstartTime: map['workstartTime'] ?? '',
      workEndTime: map['workEndTime'] ?? '',
      image: map['image'] ?? '',
      isEnabled: map['isEnabled'] ?? true,
    );
  }

  String toJson() => json.encode(toMap());

  factory SuppliersModel.fromJson(String source) =>
      SuppliersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CanteenModel(docId: $docId, suppliersName: $suppliersName, suppliersId: $suppliersId, suppliersAddress: $suppliersAddress, contactPerson: $contactPerson, suppliersProducts: $suppliersProducts,workstartTime:$workstartTime,workEndTime:$workEndTime,image:$image,isEnabled: $isEnabled)';
  }

  @override
  bool operator ==(covariant SuppliersModel other) {
    if (identical(this, other)) return true;

    return other.docId == docId &&
        other.suppliersName == suppliersName &&
        other.suppliersId == suppliersId &&
        other.suppliersAddress == suppliersAddress &&
        other.contactPerson == contactPerson &&
        other.suppliersProducts == suppliersProducts &&
        other.workstartTime == workstartTime &&
        other.workEndTime == workEndTime &&
        other.image == image &&
        other.isEnabled == isEnabled;
  }

  @override
  int get hashCode {
    return docId.hashCode ^
        suppliersName.hashCode ^
        suppliersId.hashCode ^
        suppliersAddress.hashCode ^
        contactPerson.hashCode ^
        suppliersProducts.hashCode ^
        workstartTime.hashCode ^
        workEndTime.hashCode ^
        image.hashCode ^
        isEnabled.hashCode;
  }
}
