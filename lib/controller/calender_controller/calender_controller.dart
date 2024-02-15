import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalenderController extends GetxController {
  Rx<DateTime> date = DateTime.now().obs;
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;

  TextEditingController startDateCtr = TextEditingController();
  TextEditingController endDateCtr = TextEditingController();
}
