import 'dart:convert';
import 'dart:developer';
import 'package:canteen_superadmin_website/model/user_model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:canteen_superadmin_website/core/core.dart';
import 'package:get/get.dart';

import '../../model/deviceTokenModel/deviceToken.dart';

class PushnotificationController extends GetxController {
  List<UserDeiveTokenModel> alluserdevicetokenlist = [];
  List<UserModel> allEmployeeUidList = [];
  List<UserModel> alldeliverAdminUidList = [];
  List<UserModel> allWarehouseAdminUidList = [];
  List<UserModel> allStoreAdminUidList = [];
  List<String> allEmployeeDeviceToken = [];
  List<String> allDeliveryAdminDeviceToken = [];
  List<String> allWarehouseAdminDeviceToken = [];
  List<String> allStoreAdminDeviceToken=[];

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

 

  Future fetchalluserDeviceToken() async {
    final firebase = await dataserver.collection("UserDeviceToken").get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs
          .map((e) => UserDeiveTokenModel.fromMap(e.data()))
          .toList();

      alluserdevicetokenlist.add(list[i]);
      // print(alluserdevicetokenlist[i].deviceToken);
    }
  }
   Future sendMessageForAllUsers() async {
    for (var i = 0; i < alluserdevicetokenlist.length; i++) {
      sendNotificationApi("message", "title",// "$alluserdevicetokenlist[i]",
      ""
      );
    }

    // sendNotificationApi("message","title","");
  }

//..................................>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//allusers
  Future fetchAllEmployeesUid() async {
    final firebase = await dataserver
        .collection("AllUsersCollection")
        .where('userrole', isEqualTo: 'employee')
        .get();
    final list = firebase.docs.map((e) => UserModel.fromMap(e.data())).toList();
    allEmployeeUidList.addAll(list);
    // print(allEmployeeUidList.docid);
    // print(allEmployeeUidList.length);
  }

  Future fetchAllEmployeeDeviceID() async {
    for (var i = 0; i < allEmployeeUidList.length; i++) {
      final firebase = await dataserver
          .collection("UserDeviceToken")
          .doc(allEmployeeUidList[i].docid)
          .get();
      if (firebase.data() != null) {
        allEmployeeDeviceToken.add(firebase.data()?['deviceToken']);
      }
    }
    print('....$allEmployeeDeviceToken');

    // for (var i = 0; i < allEmployeeUidList.length; i++) {
    //   final result = alluserdevicetokenlist.where(
    //       (element) => allEmployeeUidList[i].docid.contains(element.uid));
    //   allEmployeeDeviceToken.addAll(result);
    //   print(
    //       "fetchAllEmployeeDeviceID ${allEmployeeDeviceToken[i].deviceToken}");
    // }
    // log("message  ... ${allEmployeeDeviceToken.length}");
  }

  Future sendMessageForEmployee() async {
    for (var i = 0; i < allEmployeeDeviceToken.length; i++) {
      sendNotificationApi("message", "title", allEmployeeDeviceToken[i]);
    }
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
      //  print(alldeliverAdminUidList[i].docid);
    }
    // return alldeliverAdminUidList;
  }

  Future FetchAllDeliveryAdminDeviceID() async {
    for (var i = 0; i < alldeliverAdminUidList.length; i++) {
      final firebase = await dataserver
          .collection("UserDeviceToken")
          .doc(alldeliverAdminUidList[i].docid)
          .get();
      if (firebase.data() != null) {
        allDeliveryAdminDeviceToken.add(firebase.data()?['deviceToken']);
      }
    }
    print('....$allDeliveryAdminDeviceToken');
  }

  Future sendMessageForDeliverAdmin() async {
    for (var i = 0; i < allDeliveryAdminDeviceToken.length; i++) {
      sendNotificationApi("message", "title", allDeliveryAdminDeviceToken[i]);
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

  Future fetchAllWarehouseAdminDeviceID() async {
    for (var i = 0; i < allWarehouseAdminUidList.length; i++) {
      final Firebase = await dataserver
          .collection("UserDeviceToken")
          .doc(allWarehouseAdminUidList[i].docid)
          .get();
      if (Firebase.data() != null) {
        allWarehouseAdminDeviceToken.add(Firebase.data()?["deviceToken"]);
      }
    }
    print('....$allWarehouseAdminDeviceToken');
  }

  Future sendMessageForWareHouseAdmin() async {
    for (var i = 0; i < allWarehouseAdminDeviceToken.length; i++) {
      sendNotificationApi("message", "title", allWarehouseAdminDeviceToken[i]);
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
  Future fetchAllStoreAdminDEviceId()async{
    for(var i=0;i < allStoreAdminUidList.length;i++){
      final firebase= await dataserver.collection("UserDeviceToken").doc(allStoreAdminUidList[i].docid).get();
      if(firebase.data()!=null){
        allStoreAdminDeviceToken.add(firebase.data()?["deviceToken"]);

      }
    }
    print('....$allStoreAdminDeviceToken');
  }

  Future sendMessageForStoreAdmin() async {
    for (var i = 0; i < allStoreAdminDeviceToken.length; i++) {
      sendNotificationApi("message", "title", allStoreAdminDeviceToken[i]);
    }
  }
  //.................................>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>storeadmin
}
