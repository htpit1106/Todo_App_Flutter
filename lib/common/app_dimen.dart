import 'package:flutter/cupertino.dart';

class AppDimen {
  AppDimen._();

  static const double paddingNormal = 16;
  static const double paddingSmall = 8;
  static const double radiusNormal = 16;
  static const double radiusSmall = 8;
  static const double marginNormal = 16;
  static const double marginSmall = 8;


  static BorderRadius getBorderRadius(index, lengthList){
    if(lengthList == 1){
      return BorderRadius.circular(radiusNormal);
    }
    else if (index == 0) {
      return BorderRadius.only(
        topLeft: Radius.circular(radiusNormal),
        topRight: Radius.circular(radiusNormal),
      );
    } else if (index == lengthList-1) {
      return BorderRadius.only(
        bottomLeft: Radius.circular(radiusNormal),
        bottomRight: Radius.circular(radiusNormal),
      );
    } else {
      return BorderRadius.zero;
    }
  }
}