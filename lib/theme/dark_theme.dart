import 'package:flutter/material.dart';
import 'package:habit/theme/accent_colors.dart';

import '../provider/theme_provider.dart';

ThemeData darkMode(MyProvider notifier) {
  return ThemeData(

    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0D1116),

    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: accentColorLst[notifier.accentClrIndex],
      primary: accentColorLst[notifier.accentClrIndex],
      secondary: accentColorLst[notifier.accentClrIndex].withOpacity(0.5),
      tertiary: Colors.grey[900],
      onBackground: Colors.white,
      // background: Colors.white,
      onTertiary: Colors.black,
    ),
  );
}
