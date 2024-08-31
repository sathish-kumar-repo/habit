import 'package:flutter/material.dart';

import '../model/my_enum_for_model.dart';

EvaluationMethodType getEvaluationMethodType(evaluationMethodIndex) {
  switch (evaluationMethodIndex) {
    case 0:
      return EvaluationMethodType.yesOrNo;
    case 1:
      return EvaluationMethodType.numeric;
    case 2:
      return EvaluationMethodType.timer;
    case 3:
      return EvaluationMethodType.checkList;
    default:
      throw ('Error in getEvaluationMethodType');
  }
}

Frequency getFrequency(int frequencyIndex) {
  switch (frequencyIndex) {
    case 0:
      return Frequency.daily;
    case 1:
      return Frequency.weekly;
    case 2:
      return Frequency.monthly;
    case 3:
      return Frequency.annually;
    case 4:
      return Frequency.periodically;
    case 5:
      return Frequency.recurring;
    default:
      return Frequency.daily; // Default to daily if index is out of range
  }
}

String getWeekDays(WeekDays weekDays, bool isThree) {
  if (isThree) {
    switch (weekDays) {
      case WeekDays.sunday:
        return 'Sun';
      case WeekDays.monday:
        return 'Mon';
      case WeekDays.tuesday:
        return 'Tue';
      case WeekDays.wednesday:
        return 'Wed';
      case WeekDays.thursday:
        return 'Thu';
      case WeekDays.friday:
        return 'Fir';
      case WeekDays.saturday:
        return 'Sat';
    }
  } else {
    switch (weekDays) {
      case WeekDays.sunday:
        return 'Sunday';
      case WeekDays.monday:
        return 'Monday';
      case WeekDays.tuesday:
        return 'Tuesday';
      case WeekDays.wednesday:
        return 'Wednesday';
      case WeekDays.thursday:
        return 'Thursday';
      case WeekDays.friday:
        return 'Firday';
      case WeekDays.saturday:
        return 'Saturday';
    }
  }
}

NumericAmount getNumericAmount(int numericAmountIndex) {
  switch (numericAmountIndex) {
    case 0:
      return NumericAmount.atLeast;
    case 1:
      return NumericAmount.atMost;
    case 2:
      return NumericAmount.lessThan;
    case 3:
      return NumericAmount.greaterThan;
    case 4:
      return NumericAmount.exactly;
    case 5:
      return NumericAmount.anyValue;
    default:
      return NumericAmount.atLeast;
  }
}

String getNumericAmountString(NumericAmount val) {
  switch (val) {
    case NumericAmount.atLeast:
      return 'At least';
    case NumericAmount.atMost:
      return 'At most';
    case NumericAmount.lessThan:
      return 'Less than';
    case NumericAmount.greaterThan:
      return 'Greater than';
    case NumericAmount.exactly:
      return 'Exactly';
    case NumericAmount.anyValue:
      return 'Any value';
  }
}

DoItAtPeroid getDoItAt(int doItAtIndex) {
  switch (doItAtIndex) {
    case 0:
      return DoItAtPeroid.any;
    case 1:
      return DoItAtPeroid.morning;
    case 2:
      return DoItAtPeroid.afternoon;
    case 3:
      return DoItAtPeroid.evening;
    case 4:
      return DoItAtPeroid.night;
    default:
      return DoItAtPeroid.any; // Default to any if index is out of range
  }
}

Period getPeriod(int periodIndex) {
  switch (periodIndex) {
    case 0:
      return Period.week;
    case 1:
      return Period.month;
    case 2:
      return Period.year;
    default:
      return Period.week; // Default to week if index is out of range
  }
}

Month getMonthEnum(int month) {
  switch (month) {
    case 0:
      return Month.january;
    case 1:
      return Month.february;
    case 2:
      return Month.march;
    case 3:
      return Month.april;
    case 4:
      return Month.may;
    case 5:
      return Month.june;
    case 6:
      return Month.july;
    case 7:
      return Month.august;
    case 8:
      return Month.september;
    case 9:
      return Month.october;
    case 10:
      return Month.november;
    case 11:
      return Month.december;
    default:
      throw Exception('Invalid month name');
  }
}

Rank getRankEnum(int value) {
  switch (value) {
    case 0:
      return Rank.first;
    case 1:
      return Rank.second;
    case 2:
      return Rank.third;
    case 3:
      return Rank.fourth;
    case 4:
      return Rank.fifth;
    case 5:
      return Rank.last;
    default:
      throw Exception('Invalid rank value');
  }
}

WeekDays getWeekDayEnum(int value) {
  switch (value) {
    case 0:
      return WeekDays.sunday;
    case 1:
      return WeekDays.monday;
    case 2:
      return WeekDays.tuesday;
    case 3:
      return WeekDays.wednesday;
    case 4:
      return WeekDays.thursday;
    case 5:
      return WeekDays.friday;
    case 6:
      return WeekDays.saturday;
    default:
      throw Exception('Invalid week day value');
  }
}

String getWeekDaysEnumToString(WeekDays weekDays) {
  switch (weekDays) {
    case WeekDays.sunday:
      return 'Sunday';
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
  }
}

String getRankEnumToString(Rank rank) {
  switch (rank) {
    case Rank.first:
      return 'First';
    case Rank.second:
      return 'Second';
    case Rank.third:
      return 'Third';
    case Rank.fourth:
      return 'Fourth';
    case Rank.fifth:
      return 'Fifth';
    case Rank.last:
      return 'Last';
  }
}

String getMonthToString(Month month) {
  switch (month) {
    case Month.january:
      return 'January';
    case Month.february:
      return 'February';
    case Month.march:
      return 'March';
    case Month.april:
      return 'April';
    case Month.may:
      return 'May';
    case Month.june:
      return 'June';
    case Month.july:
      return 'July';
    case Month.august:
      return 'August';
    case Month.september:
      return 'September';
    case Month.october:
      return 'October';
    case Month.november:
      return 'November';
    case Month.december:
      return 'December';
  }
}

WeekDays getWeekDay(int weekDayIndex) {
  switch (weekDayIndex) {
    case 0:
      return WeekDays.sunday;
    case 1:
      return WeekDays.monday;
    case 2:
      return WeekDays.tuesday;
    case 3:
      return WeekDays.wednesday;
    case 4:
      return WeekDays.thursday;
    case 5:
      return WeekDays.friday;
    case 6:
      return WeekDays.saturday;
    default:
      return WeekDays.sunday; // Default to Sunday if index is out of range
  }
}

IconData getIcon(value) {
  switch (value) {
    case 'Morning':
      return Icons.wb_sunny;
    case 'Afternoon':
      return Icons.wb_cloudy;
    case 'Evening':
      return Icons.brightness_2;
    case 'Night':
      return Icons.nightlight_round;
    case 'All':
      return Icons.history;
    default:
      return Icons.access_time;
  }
}

getDoItAtStringToEnum(String value) {
  switch (value) {
    case 'Morning':
      return DoItAtPeroid.morning;
    case 'Afternoon':
      return DoItAtPeroid.afternoon;
    case 'Evening':
      return DoItAtPeroid.evening;
    case 'Night':
      return DoItAtPeroid.night;
    case 'Any time':
      return DoItAtPeroid.any;
    default:
      return null;
  }
}
