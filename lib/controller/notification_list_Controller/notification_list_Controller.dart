import 'package:canteen_superadmin_website/core/core.dart';
import 'package:canteen_superadmin_website/model/notification_model/notification_model.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class NotificationListController extends GetxController {
  final firebase = dataserver.collection("Notification_Collection");

  Future newUserSentNotification(NotificationModel datamodel) async {
    final uuid = const Uuid().v1();
    await firebase.doc(uuid).set(datamodel.toMap());
  }
}
