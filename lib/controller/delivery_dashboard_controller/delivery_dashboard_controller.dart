import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DeliveryDashBoardController extends GetxController {
  final firestore = FirebaseFirestore.instance;

  RxInt totalRevenue = 0.obs;

  void getTotalRevenue() async {
    int revenue = 0;
    final data = await firestore.collection('deliveryAssignList').get();
    for (var element in data.docs) {
      if (element['isDelivered'] == true) {
        int price = element['price'];

        revenue = revenue + price;
      }
    }
    totalRevenue.value = revenue;
  }
}
