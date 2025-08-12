import 'package:flutter/material.dart';

const Color primary = Color(0xffEF2A39);
const Color primaryText = Color(0xff666666);
const Color placeholder = Color(0xffA3A3A3);
const Color titleText = Color(0xff52525B);
const Color bg = Color(0xffF5F5F5);
Color get secondaryText => const Color(0xff7C7D7E);
Color get textfield => const Color(0xffF2F2F2);

extension AppContext on BuildContext {
  Size get size => MediaQuery.sizeOf(this);
  double get width => size.width;
  double get height => size.height;

  Future push(Widget widget) async {
    return Navigator.push(
        this, MaterialPageRoute(builder: (context) => widget));
  }

  void pop() async {
    return Navigator.pop(this);
  }
}
