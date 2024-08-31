import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/create_habit_provider.dart';
import '../provider/theme_provider.dart';

import 'tracking_map.dart';

String myDecideDate(BuildContext context, DateTime date) {
  return decideDateMethod(
    date,
    context.read<MyProvider>().dateTimeIndex,
  );
}

String getCurrentDate(BuildContext context) =>
    getFormattedDate(context.watch<CreateHabit>().selectedDate);

String decideDateMethod(DateTime dateTime, index) {
  return DateFormat(dateFormats[index]).format(dateTime);
}

bool isDateBetweenOrEqual(
    DateTime dateToCheck, DateTime startDate, DateTime endDate) {
  if (getFormattedDate(dateToCheck) == getFormattedDate(startDate) ||
      getFormattedDate(dateToCheck) == getFormattedDate(endDate)) {
    return true;
  }

  return dateToCheck.isAfter(startDate) && dateToCheck.isBefore(endDate);
}

bool isInputDateSmallerThanOrEqualCurrentDate(DateTime inputDate) {
  DateTime currentDate = DateTime.now();
  if (getFormattedDate(currentDate) == getFormattedDate(inputDate)) {
    return true;
  }
  return inputDate.isBefore(currentDate);
}

List<String> dateFormats = [
  'MMM dd, yyyy',
  'MMM dd',
  'dd-MM-yyyy',
  'dd/MM/yyyy',
  'MM/dd/yyyy',
  'MMMM dd, yyyy',
  'dd.MM.yyyy',
  'dd/MMM/yyyy',
  'yyyy-MM-dd',
  'dd.MM.yy',
  'MMM yyyy',
  'MM-yyyy',
  'MMMM dd yyyy',
  'EEE, dd MMM yyyy',
];

extension DateTimeExtensions on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool isPast() {
    final now = DateTime.now();
    return isBefore(DateTime(now.year, now.month, now.day));
  }
}
