import 'package:flutter/material.dart';

import '../data/habit_clr_list.dart';

Color getClr(int selectedClrIndex, BuildContext context) {
  final theme = Theme.of(context).brightness;
  return theme == Brightness.dark
      ? habitClrLst[selectedClrIndex] == Colors.black
          ? Colors.grey
          : habitClrLst[selectedClrIndex]
      : habitClrLst[selectedClrIndex];
}
