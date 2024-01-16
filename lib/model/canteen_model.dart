// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CanteenModel {
  String docId;
  String schoolName;
  String canteenId;
  String schoolAddress;
  String contactPerson;
  String albustanPerson;
  String workstartTime;
  String workEndTime;
  String image;
  CanteenModel(
      {required this.docId,
      required this.schoolName,
      required this.canteenId,
      required this.schoolAddress,
      required this.contactPerson,
      required this.albustanPerson,
      required this.workstartTime,
      required this.workEndTime,
      required this.image});

  CanteenModel copyWith({
    String? docId,
    String? schoolName,
    String? canteenId,
    String? schoolAddress,
    String? contactPerson,
    String? albustanPerson,
    String? workstartTime,
    String? workEndTime,
    String? image,
  }) {
    return CanteenModel(
      docId: docId ?? this.docId,
      schoolName: schoolName ?? this.schoolName,
      canteenId: canteenId ?? this.canteenId,
      schoolAddress: schoolAddress ?? this.schoolAddress,
      contactPerson: contactPerson ?? this.contactPerson,
      albustanPerson: albustanPerson ?? this.albustanPerson,
      workstartTime: workstartTime ?? this.workstartTime,
      workEndTime: workEndTime ?? this.workEndTime,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docId': docId,
      'schoolName': schoolName,
      'canteenId': canteenId,
      'schoolAddress': schoolAddress,
      'contactPerson': contactPerson,
      'albustanPerson': albustanPerson,
      'workstartTime': workstartTime,
      'workEndTime': workEndTime,
      'image': image
    };
  }

  factory CanteenModel.fromMap(Map<String, dynamic> map) {
    return CanteenModel(
      docId: map['docId'] ?? '',
      schoolName: map['schoolName'] ?? '',
      canteenId: map['canteenId'] ?? '',
      schoolAddress: map['schoolAddress'] ?? '',
      contactPerson: map['contactPerson'] ?? '',
      albustanPerson: map['albustanPerson'] ?? '',
      workstartTime: map['workstartTime'] ?? '',
      workEndTime: map['workEndTime'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CanteenModel.fromJson(String source) =>
      CanteenModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CanteenModel(docId: $docId, schoolName: $schoolName, canteenId: $canteenId, schoolAddress: $schoolAddress, contactPerson: $contactPerson, albustanPerson: $albustanPerson,workstartTime:$workstartTime,workEndTime:$workEndTime,image:$image)';
  }

  @override
  bool operator ==(covariant CanteenModel other) {
    if (identical(this, other)) return true;

    return other.docId == docId &&
        other.schoolName == schoolName &&
        other.canteenId == canteenId &&
        other.schoolAddress == schoolAddress &&
        other.contactPerson == contactPerson &&
        other.albustanPerson == albustanPerson &&
        other.workstartTime == workstartTime &&
        other.workEndTime == workEndTime &&
        other.image == image;
  }

  @override
  int get hashCode {
    return docId.hashCode ^
        schoolName.hashCode ^
        canteenId.hashCode ^
        schoolAddress.hashCode ^
        contactPerson.hashCode ^
        albustanPerson.hashCode ^
        workstartTime.hashCode ^
        workEndTime.hashCode ^
        image.hashCode;
  }
}
