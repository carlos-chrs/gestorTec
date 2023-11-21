import 'package:flutter/widgets.dart';

class ScreenSize {
  double width = 0;
  double heigth = 0;
  upadate(BuildContext context) {
    var size = MediaQuery.of(context).size;
    width = size.width;
    heigth = size.height;
  }

  ScreenSize._();

  static final i = ScreenSize._();
}
