import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDateUtils {
  AppDateUtils._();

  // format time now() example: October 20, 2022
  static String formatDateNow(DateTime time) {
    return DateFormat('MMMM dd, yyyy').format(time);
  }

  static String formatDate(DateTime time) {
    return DateFormat('MM/dd/yyyy').format(time);
  }

  static String formatTimeOfDayToString(TimeOfDay time, DateTime date) {
  
    final dateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    return DateFormat('hh:mm a').format(dateTime);
    
  }


  // format dateTime: 4:00 pm
  static String formatTimeOclock(String time) {
    DateTime date = DateTime.parse(time);

    return DateFormat('hh:mm a').format(date);
  }

  static Future<DateTime> pickerDateShow(BuildContext context,
      DateTime initialDate) async {
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
        initialDate: initialDate
    );

    return selectedDate?? initialDate;
  }

  static Future<TimeOfDay> pickerTimeShow(BuildContext context,
      TimeOfDay initialDate) async {
    final TimeOfDay? selectedTime = await showTimePicker(
        context: context, initialTime: initialDate);
    return selectedTime?? initialDate;
  }

  static dateToStringISO8601 (DateTime date, TimeOfDay time){
     final day = DateTime(
       date.year,
       date.month,
       date.day,
       time.hour,
       time.minute
     );
     return day.toIso8601String();
  }
}
