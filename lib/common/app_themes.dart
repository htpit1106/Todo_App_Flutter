import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
        iconColor: AppColors.buttonPurple,
        // contentPadding:EdgeInsetsGeometryTween(begin: 0, end: 0),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none
        ),
        // icon: Icon(Icons.calendar_today_outlined)
        // filled: true
      ),
    );
  }
}
