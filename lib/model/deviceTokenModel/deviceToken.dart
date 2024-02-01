// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDeiveTokenModel {
  String uid;
  String deviceToken;
  UserDeiveTokenModel({
    required this.uid,
    required this.deviceToken,
  });

  UserDeiveTokenModel copyWith({
    String? uid,
    String? deviceToken,
  }) {
    return UserDeiveTokenModel(
      uid: uid ?? this.uid,
      deviceToken: deviceToken ?? this.deviceToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'deviceToken': deviceToken,
    };
  }

  factory UserDeiveTokenModel.fromMap(Map<String, dynamic> map) {
    return UserDeiveTokenModel(
      uid: map['uid'] ??"",
      deviceToken: map['deviceToken'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDeiveTokenModel.fromJson(String source) => UserDeiveTokenModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserDeiveTokenModel(uid: $uid, deviceToken: $deviceToken)';

  @override
  bool operator ==(covariant UserDeiveTokenModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.deviceToken == deviceToken;
  }

  @override
  int get hashCode => uid.hashCode ^ deviceToken.hashCode;
}