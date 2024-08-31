import 'package:flutter/material.dart';

import '../provider/theme_provider.dart';
import 'accent_colors.dart';

ThemeData lightMode(MyProvider notifier) {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF4F4F4),
    colorScheme: ColorScheme.light(
      primary: accentColorLst[notifier.accentClrIndex],
      secondary: accentColorLst[notifier.accentClrIndex].withOpacity(0.5),
      tertiary: Colors.white,
      onBackground: Colors.black,
      onTertiary: Colors.white,
    ),
  );
}
