import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  static final TextStyle titleApp = TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle titleSmall = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static final TextStyle bodyMedium = TextStyle(
    color: Color(0xFF1B1B1D),
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle bodySmall = TextStyle(
    color: Color(0xFF1B1B1D),
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );


}
