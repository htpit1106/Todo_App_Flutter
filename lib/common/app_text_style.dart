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
  static final TextStyle bodyMediumRed = TextStyle(
    color: Colors.red,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle bodySmall = TextStyle(
    color: Color(0xFF1B1B1D),
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
  static final TextStyle grayBodySmall = TextStyle(color: Colors.grey[600], fontSize: 12);
  static final TextStyle bodyThroughMedium = TextStyle(
    color: Color(0xFF1B1B1D),
    fontSize: 16,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.lineThrough,
  );

  static final TextStyle bodyThroughSmall = TextStyle(
    color: Color(0xFF1B1B1D),
    fontSize: 14,
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.lineThrough,
  );
}
