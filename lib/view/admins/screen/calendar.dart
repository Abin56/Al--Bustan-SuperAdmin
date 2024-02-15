import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime _currentDate;
  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CalendarCarousel<Event>(
        onDayPressed: (DateTime date, List<Event> events) {
          print('Selected Date: $date');
          setState(() => _currentDate = date);
          print('Current Date: $_currentDate');
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
        selectedDateTime: _currentDate,
        markedDateShowIcon: true,
        markedDateIconMaxShown: 1,
        daysHaveCircularBorder: false,
      ),
    );
  }
}
