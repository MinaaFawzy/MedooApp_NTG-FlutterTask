import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color buttonColor = Color(0xff015B8A);
  static const Color foregroundButtonColor = Color(0x015B8AD1);
  static Color borderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFFFFFFF) // white border in dark mode
        : const Color(0x1F1F1F14); // your original color
  }
  static Color bottomIconColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFFFFFFF) // white border in dark mode
        : const Color(0xFFA9A9A9); // your original color
  }
  static Color iconColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFFFFFFF) // white border in dark mode
        : const Color(0xFF002538); // your original color
  }
}