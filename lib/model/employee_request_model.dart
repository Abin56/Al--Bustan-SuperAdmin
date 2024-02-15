class EmployeeRequestModel {
  String docid;
  String emplopeeName;
  String emplopeeId;
  String canteenName;
  String canteenId;
  String requestId;
  String time;
  int orderCount;
  int amount;
  EmployeeRequestModel(
      {required this.docid,
      required this.emplopeeName,
      required this.emplopeeId,
      required this.canteenName,
      required this.canteenId,
      required this.requestId,
      required this.time,
      required this.orderCount,
      required this.amount});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'employeeName': emplopeeName,
      'employeeId': emplopeeId,
      'canteenName': canteenName,
      'canteeId': canteenId,
      'requestId': requestId,
      'time': time,
      'orderCount': orderCount,
      'amount': amount,
    };
  }

  factory EmployeeRequestModel.fromMap(Map<String, dynamic> map) {
    return EmployeeRequestModel(
      docid: map['docid'] ?? '',
      emplopeeName: map['employeeName'] ?? '',
      emplopeeId: map['employeeId'] ?? '',
      canteenName: map['canteenName'] ?? '',
      canteenId: map['canteeId'] ?? '',
      requestId: map['requestId'] ?? '',
      time: map['time'] ?? '',
      orderCount: map['orderCount'] ?? 0,
      amount: map['amount'] ?? 0,
    );
  }
}
