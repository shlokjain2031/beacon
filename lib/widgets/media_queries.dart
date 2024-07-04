import 'package:flutter/cupertino.dart';

class ResponsiveUnit {

  static const _widthOfScreen = 1512;
  static const _heightOfScreen = 982;

  double width(BuildContext context, double absoluteWidth) {
    return MediaQuery.of(context).size.width * (absoluteWidth/_widthOfScreen);
  }

  double height(BuildContext context, double absoluteHeight) {
    return MediaQuery.of(context).size.height * (absoluteHeight/_heightOfScreen);
  }
}