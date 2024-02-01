import 'dart:convert';
import 'dart:developer';
import 'package:canteen_superadmin_website/model/user_model/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:canteen_superadmin_website/core/core.dart';
import 'package:get/get.dart';

import '../../model/deviceTokenModel/deviceToken.dart';

class PushnotificationController extends GetxController {
  List<UserDeiveTokenModel> alluserdevicetokenlist = [];
  List<UserModel> allEmployeeUidList = [];
   List<UserDeiveTokenModel> allEmployeeDeviceToken = [];
  List<UserModel> alldeliverAdminUidList = [];
  List<UserModel> allWarehouseAdminUidList = [];
  List<UserModel> allStoreAdminUidList = [];

  Future sendNotificationApi(
      String message, String title, String deviceToken) async {
    try {
      final reponse = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAAxbdckj0:APA91bHeFNsJ_6Pfo69P9sJz_0JfZeOxV6gB6DectpcZEleEyY-CUCY21PuktRYlXVXvrvHK_XRrZdN4-DcNHL2nmPgEISL73AkNnVGbhmjRsiiX0aVb4P9iJH5RqZKdroBQLjCsOwAr'
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': message,
              'title': title,
            },
            "notification": <String, dynamic>{
              'title': title,
              'body': message,
              'android_channel_id': 'high_importance_channel'
            },
            'to': deviceToken,
          },
        ),
      );
      log("response --L>>  ${reponse.body}");
    } catch (e) {
      if (kDebugMode) {
        log("error push Notification");
      }
    }
  }
    Future sendMessageForAllUsers(
    String message,
    String title,
  ) async {
    for (var i = 0; i < alluserdevicetokenlist.length; i++) {
      sendNotificationApi("message", "title", "");
    }

    // sendNotificationApi("message","title","");
  }

  Future fetchalluserDeviceToken() async {
    final firebase = await dataserver.collection("UserDeviceToken").get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs
          .map((e) => UserDeiveTokenModel.fromMap(e.data()))
          .toList();

      alluserdevicetokenlist.add(list[i]);
    }

    return alluserdevicetokenlist;
  }
//..................................>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//allusers
  Future fetchAllEmployeesUid() async {
    final firebase = await dataserver
        .collection("AllUsersCollection")
        .where('userrole', isEqualTo: 'employee')
        .get();
    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => UserModel.fromMap(e.data())).toList();
      allEmployeeUidList.add(list[i]);
    }
    return allEmployeeUidList;
  }

  Future fetchAllEmployeeDeviceID() async {
    for (var i = 0; i < allEmployeeUidList.length; i++) {
      final   result = alluserdevicetokenlist.where(
          (element) => allEmployeeUidList[i].docid.contains(element.uid));
          allEmployeeDeviceToken.addAll(result);
    print("fetchAllEmployeeDeviceID ${allEmployeeDeviceToken[i].deviceToken}");
         
    }
    log("message  ... ${allEmployeeDeviceToken.length}");
  }

  ///............................................>>>>>>>>>>>>>>>>>>>>>>>>>>employees
  Future fetchAllDEliveryAdmin() async {
    final firebase = await dataserver
        .collection("AllUsersCollection")
        .where("userrole", isEqualTo: "deliveryadmin")
        .get();
    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => UserModel.fromMap(e.data())).toList();
      alldeliverAdminUidList.add(list[i]);
      print(alldeliverAdminUidList[i].docid);
    }
    return alldeliverAdminUidList;
  }

  Future sendMessageForDeliverAdmin() async {
    for (var i = 0; i < alldeliverAdminUidList.length; i++) {
      sendNotificationApi("message", "title", "deviceToken");
    }
  }

  //................................................>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>deliveryadmin
  Future fetchAllWarehouseAdmin() async {
    final firebase = await dataserver
        .collection("AllUsersCollection")
        .where("userrole", isEqualTo: "warehouseadmin")
        .get();
    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => UserModel.fromMap(e.data())).toList();
      allWarehouseAdminUidList.add(list[i]);
    }
  }

  Future sendMessageForWareHouseAdmin() async {
    for (var i = 0; i < allWarehouseAdminUidList.length; i++) {
      sendNotificationApi("message", "title", "deviceToken");
    }
  }

  //....................................................>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>warehouseadmin
  Future fetchAllStoreAdmin() async {
    final firebase = await dataserver
        .collection("AllUsersCollection")
        .where("userrole", isEqualTo: "storeadmin")
        .get();
    for (var i = 0; i < firebase.docs.length; i++) {
      final list =
          firebase.docs.map((e) => UserModel.fromMap(e.data())).toList();
      allStoreAdminUidList.add(list[i]);
    }
  }

  Future sendMessageForStoreAdmin() async {
    for (var i = 0; i < allStoreAdminUidList.length; i++) {
      sendNotificationApi("message", "title", "deviceToken");
    }
  }
  //.................................>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>storeadmin
}
