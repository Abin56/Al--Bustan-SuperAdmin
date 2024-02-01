// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class NotificationModel {
  final int icon;
  final String messageText;
  final String headerText;
  final Color whiteshadeColor;
  final Color containerColor;
  NotificationModel({
    required this.icon,
    required this.messageText,
    required this.headerText,
    required this.whiteshadeColor,
    required this.containerColor,
  });

  NotificationModel copyWith({
    int? icon,
    String? messageText,
    String? headerText,
    Color? whiteshadeColor,
    Color? containerColor,
  }) {
    return NotificationModel(
      icon: icon ?? this.icon,
      messageText: messageText ?? this.messageText,
      headerText: headerText ?? this.headerText,
      whiteshadeColor: whiteshadeColor ?? this.whiteshadeColor,
      containerColor: containerColor ?? this.containerColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'icon': icon,
      'messageText': messageText,
      'headerText': headerText,
      'whiteshadeColor': whiteshadeColor.value,
      'containerColor': containerColor.value,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      icon: map['icon'] as int,
      messageText: map['messageText'] as String,
      headerText: map['headerText'] as String,
      whiteshadeColor: Color(map['whiteshadeColor'] as int),
      containerColor: Color(map['containerColor'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotificationModel(icon: $icon, messageText: $messageText, headerText: $headerText, whiteshadeColor: $whiteshadeColor, containerColor: $containerColor)';
  }

  @override
  bool operator ==(covariant NotificationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.icon == icon &&
      other.messageText == messageText &&
      other.headerText == headerText &&
      other.whiteshadeColor == whiteshadeColor &&
      other.containerColor == containerColor;
  }

  @override
  int get hashCode {
    return icon.hashCode ^
      messageText.hashCode ^
      headerText.hashCode ^
      whiteshadeColor.hashCode ^
      containerColor.hashCode;
  }
}
