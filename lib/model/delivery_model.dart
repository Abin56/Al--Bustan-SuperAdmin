// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DeliveryModel {
  String orderId;
  int orderCount;
  String status;
  String time;
  DeliveryModel({
    required this.orderId,
    required this.orderCount,
    required this.status,
    required this.time,
  });

  DeliveryModel copyWith({
    String? orderId,
    int? orderCount,
    String? status,
    String? time,
  }) {
    return DeliveryModel(
      orderId: orderId ?? this.orderId,
      orderCount: orderCount ?? this.orderCount,
      status: status ?? this.status,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'orderCount': orderCount,
      'status': status,
      'time': time,
    };
  }

  factory DeliveryModel.fromMap(Map<String, dynamic> map) {
    return DeliveryModel(
      orderId: map['orderId'] ?? '',
      orderCount: map['orderCount'] ?? '',
      status: map['status'] ?? '',
      time: map['time'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryModel.fromJson(String source) =>
      DeliveryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DeliveryModel(orderId: $orderId, orderCount: $orderCount, status: $status, time: $time)';
  }

  @override
  bool operator ==(covariant DeliveryModel other) {
    if (identical(this, other)) return true;

    return other.orderId == orderId &&
        other.orderCount == orderCount &&
        other.status == status &&
        other.time == time;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
        orderCount.hashCode ^
        status.hashCode ^
        time.hashCode;
  }
}
