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

  static DateTime toDateTime(String date) {
    return DateTime.parse(date);
  }

  static TimeOfDay toTimeOfDay(DateTime date) {
    return TimeOfDay.fromDateTime(date);
  }

  static String formatTimeOfDayToString(TimeOfDay time) {
    final dateTime = DateTime(1970, 1, 1, time.hour, time.minute);
    return DateFormat.jm().format(dateTime);
  }

  // format dateTime: 4:00 pm
  static String stringToOclock(String time) {
    DateTime date = DateTime.parse(time);
    return DateFormat('hh:mm a').format(date);
  }

  static Future<DateTime> pickerDateShow(BuildContext context,
      DateTime initialDate) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: initialDate,
    );

    return selectedDate ?? initialDate;
  }

  static Future<TimeOfDay> pickerTimeShow(BuildContext context,
      TimeOfDay initialDate) async {
    final TimeOfDay? selectedTime =
    await showTimePicker(context: context, initialTime: initialDate);
    return selectedTime ?? initialDate;
  }

  static String dateToStringISO8601(DateTime date, TimeOfDay time) {
    final day = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    return day.toIso8601String();
  }
}