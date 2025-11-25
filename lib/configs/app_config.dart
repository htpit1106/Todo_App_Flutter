import 'package:intl/intl.dart';

class AppConfigs {
  AppConfigs._();

  static final String appName = "Todo App";

  // format time now() example: October 20, 2022
  static String formatTimeNow(DateTime time) {
    return DateFormat('MMMM dd, yyyy').format(time);
  }

  // format dateTime: 4:00 pm
  static String formatTimeOclock(String time) {
    DateTime date = DateTime.parse(time);

    return DateFormat('hh:mm a').format(date);
  }
}
