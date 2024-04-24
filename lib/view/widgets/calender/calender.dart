import 'package:canteen_superadmin_website/controller/calender_controller/calender_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';

class CalendarWidget extends StatelessWidget {
  CalendarWidget({super.key, required this.date});

  final calenderCtr = Get.put(CalenderController());
  final Rx<DateTime> date;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Obx(
          () => CalendarCarousel<Event>(
            onDayPressed: (DateTime selectedDate, List<Event> events) {
              date.value = selectedDate;

              Get.back();
            },
            weekendTextStyle: const TextStyle(
              color: Colors.red,
            ),
            thisMonthDayBorderColor: Colors.grey,
            customDayBuilder: (
              bool isSelectable,
              int index,
              bool isSelectedDay,
              bool isToday,
              bool isPrevMonthDay,
              TextStyle textStyle,
              bool isNextMonthDay,
              bool isThisMonthDay,
              DateTime day,
            ) {
              return null;
            },
            weekFormat: false,
            height: 360.0,
            todayButtonColor: Colors.black54,
            selectedDateTime: calenderCtr.date.value,
            markedDateShowIcon: true,
            markedDateIconMaxShown: 1,
            daysHaveCircularBorder: false,
          ),
        ));
  }
}
