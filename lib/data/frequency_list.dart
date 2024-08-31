import '../model/my_enum_for_model.dart';

List<int> periodDays = [
  7, // week
  31, // month
  365, // year
];
List weekDays = [
  WeekDays.sunday,
  WeekDays.monday,
  WeekDays.tuesday,
  WeekDays.wednesday,
  WeekDays.thursday,
  WeekDays.friday,
  WeekDays.saturday,
];
List<String> frequencyForWeekDays = [
  'First',
  'Second',
  'Third',
  'Fourth',
  'Fifth',
  'Last',
];
List<int> daysInMonth = [
  31, // January
  28, // February
  31, // March
  30, // April
  31, // May
  30, // June
  31, // July
  31, // August
  30, // September
  31, // October
  30, // November
  31, // December
];
List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];
List<List> daySelectorList = [
  [WeekDays.sunday, false],
  [WeekDays.monday, false],
  [WeekDays.tuesday, false],
  [WeekDays.wednesday, false],
  [WeekDays.thursday, false],
  [WeekDays.friday, false],
  [WeekDays.saturday, false],
];
