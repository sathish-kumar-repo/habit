import '../model/my_enum_for_model.dart';
import '../model/sub_item.dart';

String getFormattedDate(DateTime date) {
  String formattedDate = "${date.year}-${date.month}-${date.day}";
  return formattedDate;
}

// For Daily
Map<String, List<Object>> generateTrackingMapForDaily({
  required int howManyDays,
  required DateTime startDate,
  required List<SubItems> subItems,
}) {
  Map<String, List<Object>> map = {};
  DateTime generateDate;
  String formattedDate;
  for (int i = 0; i < howManyDays; i++) {
    generateDate = startDate.add(Duration(days: i));
    formattedDate = getFormattedDate(generateDate);
    map[formattedDate] = [
      false,
      '',
      generateDate,
      0,
      0,
      generateMapForHabitSubItems(subItems)
    ];
  }

  return removeDuplicateKeys(map);
}

// For Weekly
Map<String, List<Object>> generateTrackingMapForWeekly({
  required int howManyDays,
  required List<WeekDays> weekDays,
  required DateTime startDate,
  required List<SubItems> subItems,
}) {
  Map<String, List<Object>> map = {};
  DateTime generateDate;
  String formattedDate;
  for (int i = 0; i < howManyDays; i++) {
    generateDate = startDate.add(Duration(days: i));
    formattedDate = getFormattedDate(generateDate);
    for (WeekDays element in weekDays) {
      if (getDateTimeWeekDay(element) == generateDate.weekday) {
        map[formattedDate] = [
          false,
          '',
          generateDate,
          0,
          0,
          generateMapForHabitSubItems(subItems)
        ];
      }
    }
  }
  return removeDuplicateKeys(map);
}

// For Monthly
Map<String, List<Object>> generateTrackingMapForMonthly({
  required int howManyDays,
  required List<dynamic> monthFrequency1,
  required DateTime startDate,
  required List<SubItems> subItems,
}) {
  Map<String, List<Object>> map = {};
  DateTime generateDate;
  String formattedDate;

  for (int i = 0; i < howManyDays; i++) {
    generateDate = startDate.add(Duration(days: i));
    formattedDate = getFormattedDate(generateDate);
    for (dynamic element in monthFrequency1) {
      if (element[0] == generateDate.day) {
        map[formattedDate] = [
          false,
          '',
          generateDate,
          0,
          0,
          generateMapForHabitSubItems(subItems)
        ];
      } else if (element[0] == 'last') {
        int lastDayInMonth = getDaysInMonth(generateDate.month);
        // print(getFormattedDate(DateTime(
        //     generateDate.year, generateDate.month, lastDayInMonth + 1)));
        map[getFormattedDate(DateTime(
            generateDate.year, generateDate.month, lastDayInMonth))] = [
          false,
          '',
          DateTime(generateDate.year, generateDate.month, lastDayInMonth),
          0,
          0,
          generateMapForHabitSubItems(subItems)
        ];
      }
    }
  }

  return removeDuplicateKeys(map);
}

// For Monthly utilize days
List<DateTime> getRankOfList(DateTime startDate, WeekDays weekDay) {
  int daysInMonth = getDaysInMonth(startDate.month);
  DateTime generateDateForRank = DateTime(startDate.year, startDate.month, 1);
  List<DateTime> rankList = [];
  for (int i = 0; i < daysInMonth; i++) {
    if (generateDateForRank.weekday == getDateTimeWeekDay(weekDay)) {
      rankList.add(generateDateForRank);
    }
    generateDateForRank = generateDateForRank.add(const Duration(days: 1));
  }

  return rankList;
}

Map<String, List<Object>> generateTrackingMapForMonthlyUtlizeDays({
  required int howManyDays,
  required List<dynamic> monthFrequency2,
  required DateTime startDate,
  required List<SubItems> subItems,
}) {
  Map<String, List<Object>> map = {};
  DateTime generateDate;

  // DateTime lastDayOfMonth = DateTime(startDate.year, startDate.month + 1, 0);
  // int remainingDays = lastDayOfMonth.day - startDate.day + 1;
  for (int i = 0; i < howManyDays; i++) {
    generateDate = startDate.add(Duration(days: i));

    for (var dayInfo in monthFrequency2) {
      WeekDays weekDay = dayInfo[0];
      Rank rank = dayInfo[1];
      List<DateTime> rankList = getRankOfList(generateDate, weekDay);
      if (rank == Rank.first &&
          isIndexValid(rankList, 0) &&
          isInputDateGreaterThanOrEqualCurrentDate(rankList[0])) {
        map[getFormattedDate(rankList[0])] = [
          false,
          '',
          rankList[0],
          0,
          0,
          generateMapForHabitSubItems(subItems)
        ];
      }
      // print(rankList[1]);
      // print(rank == Rank.second);
      // print('index valid ${isIndexValid(rankList, 1)}');
      // print('greater ${isInputDateGreaterThanOrEqualCurrentDate(rankList[1])}');
      if (rank == Rank.second &&
          isIndexValid(rankList, 1) &&
          isInputDateGreaterThanOrEqualCurrentDate(rankList[1])) {
        map[getFormattedDate(rankList[1])] = [
          false,
          '',
          rankList[1],
          0,
          0,
          generateMapForHabitSubItems(subItems)
        ];
      }
      if (rank == Rank.third &&
          isIndexValid(rankList, 2) &&
          isInputDateGreaterThanOrEqualCurrentDate(rankList[2])) {
        map[getFormattedDate(rankList[2])] = [
          false,
          '',
          rankList[2],
          0,
          0,
          generateMapForHabitSubItems(subItems)
        ];
      }
      if (rank == Rank.fourth &&
          isIndexValid(rankList, 3) &&
          isInputDateGreaterThanOrEqualCurrentDate(rankList[3])) {
        map[getFormattedDate(rankList[3])] = [
          false,
          '',
          rankList[3],
          0,
          0,
          generateMapForHabitSubItems(subItems)
        ];
      }
      if (rank == Rank.fifth &&
          isIndexValid(rankList, 4) &&
          isInputDateGreaterThanOrEqualCurrentDate(rankList[4])) {
        map[getFormattedDate(rankList[4])] = [
          false,
          '',
          rankList[4],
          0,
          0,
          generateMapForHabitSubItems(subItems)
        ];
      }
      if (rank == Rank.last &&
          isInputDateGreaterThanOrEqualCurrentDate(
              rankList[rankList.length - 1])) {
        map[getFormattedDate(rankList[rankList.length - 1])] = [
          false,
          '',
          rankList[rankList.length - 1],
          0,
          0,
          generateMapForHabitSubItems(subItems)
        ];
      }
    }
  }
  return removeDuplicateKeys(map);
}

// For Annually
Map<String, List<Object>> generateTrackingMapForAnnually({
  required int howManyDays,
  required List<dynamic> annualFrequency,
  required DateTime startDate,
  required List<SubItems> subItems,
}) {
  Map<String, List<Object>> map = {};
  DateTime generateDate;
  String formattedDate;
  for (int i = 0; i < howManyDays; i++) {
    generateDate = startDate.add(Duration(days: i));
    formattedDate = getFormattedDate(generateDate);
    for (List element in annualFrequency) {
      if (generateDate.month == convertMonthToDateTime(element[0]) &&
          generateDate.day == element[1]) {
        map[formattedDate] = [
          false,
          '',
          generateDate,
          0,
          0,
          generateMapForHabitSubItems(subItems)
        ];
      }
    }
  }

  return removeDuplicateKeys(map);
}

// For Periodically
Map<String, List<Object>> generateTrackingMapForPeroidically({
  required int howManyDays,
  required int periodFrequencyDay,
  required Period periodFrequency,
  required DateTime startDate,
  required List<SubItems> subItems,
}) {
  Map<String, List<Object>> map = {};
  DateTime generateDate;
  String formattedDate;
  for (int i = 0; i < howManyDays; i++) {
    generateDate = startDate.add(Duration(days: i));
    formattedDate = getFormattedDate(generateDate);
    map[formattedDate] = [
      false,
      '',
      generateDate,
      0,
      0,
      generateMapForHabitSubItems(subItems)
    ];
  }

  return removeDuplicateKeys(map);
}

Map<String, List<Object>> generateTrackingMapForRecurring({
  required int howManyDays,
  required int recurringFrequency,
  required DateTime startDate,
  required List<SubItems> subItems,
}) {
  Map<String, List<Object>> map = {};

  DateTime generateDate = startDate;
  String formattedDate;
  for (int i = 0; i < howManyDays; i += recurringFrequency) {
    formattedDate = getFormattedDate(generateDate);
    map[formattedDate] = [
      false,
      '',
      generateDate,
      0,
      0,
      generateMapForHabitSubItems(subItems)
    ];
    generateDate = generateDate.add(Duration(days: recurringFrequency));
  }
  return removeDuplicateKeys(map);
}

Map<String, List<Object>> generateTrackingMapForRecurringAlternate({
  required int howManyDays,
  required int alernateActionDays,
  required int alernateRestDays,
  required DateTime startDate,
  required List<SubItems> subItems,
}) {
  Map<String, List<Object>> map = {};
  DateTime currentDate = startDate;
  int daysCounter = 0;
  String formattedDate;
  DateTime generateDate;
  int patternCounter = 0;

  for (int i = 0; i < howManyDays; i++) {
    if (daysCounter < alernateActionDays) {
      generateDate = currentDate.add(Duration(days: i));
      formattedDate = getFormattedDate(generateDate);
      map[formattedDate] = [
        false,
        '',
        generateDate,
        0,
        0,
        generateMapForHabitSubItems(subItems)
      ];
      daysCounter++;
    } else {
      i += alernateRestDays -
          1; // Leave specified number of entries empty after creating the specified number of entries
      daysCounter = 0;
      patternCounter++;
      if (patternCounter >= alernateActionDays) {
        patternCounter = 0;
        i -= alernateRestDays -
            1; // Reset pattern if the specified number of entries is reached
      }
    }
  }

  return removeDuplicateKeys(map);
}

Map<String, List<Object>> removeDuplicateKeys(Map<String, List<Object>> map) {
  Map<String, List<Object>> uniqueMap = {};

  // Iterate over the original map
  map.forEach((key, value) {
    // Check if the key already exists in the new map
    if (!uniqueMap.containsKey(key)) {
      // If not, add the key-value pair to the new map
      uniqueMap[key] = value;
    }
    // If the key already exists, it's considered a duplicate and ignored
  });

  return uniqueMap;
}

String getWeekDaysIntToString(int weekDays) {
  switch (weekDays) {
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    case 7:
      return 'Sunday';
    default:
      throw 'Invalid type in getWeekDaysInString';
  }
}

String getWeekDaysToString(WeekDays weekDays) {
  switch (weekDays) {
    case WeekDays.monday:
      return 'Monday';
    case WeekDays.tuesday:
      return 'Tuesday';
    case WeekDays.wednesday:
      return 'Wednesday';
    case WeekDays.thursday:
      return 'Thursday';
    case WeekDays.friday:
      return 'Friday';
    case WeekDays.saturday:
      return 'Saturday';
    case WeekDays.sunday:
      return 'Sunday';
  }
}

int getDateTimeWeekDay(WeekDays weekDays) {
  switch (weekDays) {
    case WeekDays.monday:
      return DateTime.monday;
    case WeekDays.tuesday:
      return DateTime.tuesday;
    case WeekDays.wednesday:
      return DateTime.wednesday;
    case WeekDays.thursday:
      return DateTime.thursday;
    case WeekDays.friday:
      return DateTime.friday;
    case WeekDays.saturday:
      return DateTime.saturday;
    case WeekDays.sunday:
      return DateTime.sunday;
  }
}

int getDaysInMonth(int month) {
  switch (month) {
    case 1: // January
    case 3: // March
    case 5: // May
    case 7: // July
    case 8: // August
    case 10: // October
    case 12: // December
      return 31;
    case 4: // April
    case 6: // June
    case 9: // September
    case 11: // November
      return 30;
    case 2: // February
      return 28;
    default:
      throw Exception('Invalid month');
  }
}

int convertMonthToDateTime(Month month) {
  switch (month) {
    case Month.january:
      return DateTime.january;
    case Month.february:
      return DateTime.february;
    case Month.march:
      return DateTime.march;
    case Month.april:
      return DateTime.april;
    case Month.may:
      return DateTime.may;
    case Month.june:
      return DateTime.june;
    case Month.july:
      return DateTime.july;
    case Month.august:
      return DateTime.august;
    case Month.september:
      return DateTime.september;
    case Month.october:
      return DateTime.october;
    case Month.november:
      return DateTime.november;
    case Month.december:
      return DateTime.december;
    default:
      throw ArgumentError('Invalid month: $month');
  }
}

bool isInputDateGreaterThanOrEqualCurrentDate(DateTime inputDate) {
  DateTime currentDate = DateTime.now();
  if (getFormattedDate(currentDate) == getFormattedDate(inputDate)) {
    return true;
  }
  return inputDate.isAfter(currentDate) ||
      inputDate.isAtSameMomentAs(currentDate);
}

bool isIndexValid(List list, int index) {
  return index >= 0 && index < list.length;
}

Map<String, bool> generateMapForHabitSubItems(
  List<SubItems> subItems,
) {
  Map<String, bool> map = {};
  for (var subItemModel in subItems) {
    map[subItemModel.id] = false;
  }
  return map;
}
/**
 * 
 * 
 * 
 * void main() {
  final date = DateTime.parse('2019-10-08 15:43:03.887');
  
  print('Date: $date');
  print('Start of week: ${getDate(date.subtract(Duration(days: date.weekday - 1)))}');
  print('End of week: ${getDate(date.add(Duration(days: DateTime.daysPerWeek - date.weekday)))}');
}

DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

DateTime mostRecentSunday(DateTime date) =>
    DateTime(date.year, date.month, date.day - date.weekday % 7);
 */