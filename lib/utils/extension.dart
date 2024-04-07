import 'package:flutter/material.dart';

extension MainExtension on BuildContext {
  double get mediaQueryWidth => MediaQuery.sizeOf(this).width;
  double get mediaQueryHeight => MediaQuery.sizeOf(this).height;
  double dynamicHeight(double value) => mediaQueryHeight * value;
  double dynamicWidth(double value) => mediaQueryWidth * value;
  Color get mainRed => const Color(0xFFEE6A57);
  Color get scaffoldColor => const Color(0xFFF2F2F2);

  TextStyle get title => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );
  TextStyle get subtitle => const TextStyle(
        color: Color(0xFF919191),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
  Future<void> bottomModalSheet(Widget child) => showModalBottomSheet<void>(
        isScrollControlled: true,
        context: this,
        builder: (context) => child,
      );
}
