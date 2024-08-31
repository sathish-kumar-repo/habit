// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_enum_for_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EvaluationMethodTypeAdapter extends TypeAdapter<EvaluationMethodType> {
  @override
  final int typeId = 0;

  @override
  EvaluationMethodType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EvaluationMethodType.yesOrNo;
      case 1:
        return EvaluationMethodType.numeric;
      case 2:
        return EvaluationMethodType.timer;
      case 3:
        return EvaluationMethodType.checkList;
      default:
        return EvaluationMethodType.yesOrNo;
    }
  }

  @override
  void write(BinaryWriter writer, EvaluationMethodType obj) {
    switch (obj) {
      case EvaluationMethodType.yesOrNo:
        writer.writeByte(0);
        break;
      case EvaluationMethodType.numeric:
        writer.writeByte(1);
        break;
      case EvaluationMethodType.timer:
        writer.writeByte(2);
        break;
      case EvaluationMethodType.checkList:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EvaluationMethodTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NumericAmountAdapter extends TypeAdapter<NumericAmount> {
  @override
  final int typeId = 1;

  @override
  NumericAmount read(BinaryReader reader) {
    switch (reader.readByte()) {
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

  @override
  void write(BinaryWriter writer, NumericAmount obj) {
    switch (obj) {
      case NumericAmount.atLeast:
        writer.writeByte(0);
        break;
      case NumericAmount.atMost:
        writer.writeByte(1);
        break;
      case NumericAmount.lessThan:
        writer.writeByte(2);
        break;
      case NumericAmount.greaterThan:
        writer.writeByte(3);
        break;
      case NumericAmount.exactly:
        writer.writeByte(4);
        break;
      case NumericAmount.anyValue:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NumericAmountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FrequencyAdapter extends TypeAdapter<Frequency> {
  @override
  final int typeId = 2;

  @override
  Frequency read(BinaryReader reader) {
    switch (reader.readByte()) {
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
        return Frequency.daily;
    }
  }

  @override
  void write(BinaryWriter writer, Frequency obj) {
    switch (obj) {
      case Frequency.daily:
        writer.writeByte(0);
        break;
      case Frequency.weekly:
        writer.writeByte(1);
        break;
      case Frequency.monthly:
        writer.writeByte(2);
        break;
      case Frequency.annually:
        writer.writeByte(3);
        break;
      case Frequency.periodically:
        writer.writeByte(4);
        break;
      case Frequency.recurring:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FrequencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeekDaysAdapter extends TypeAdapter<WeekDays> {
  @override
  final int typeId = 3;

  @override
  WeekDays read(BinaryReader reader) {
    switch (reader.readByte()) {
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
        return WeekDays.sunday;
    }
  }

  @override
  void write(BinaryWriter writer, WeekDays obj) {
    switch (obj) {
      case WeekDays.sunday:
        writer.writeByte(0);
        break;
      case WeekDays.monday:
        writer.writeByte(1);
        break;
      case WeekDays.tuesday:
        writer.writeByte(2);
        break;
      case WeekDays.wednesday:
        writer.writeByte(3);
        break;
      case WeekDays.thursday:
        writer.writeByte(4);
        break;
      case WeekDays.friday:
        writer.writeByte(5);
        break;
      case WeekDays.saturday:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekDaysAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MonthAdapter extends TypeAdapter<Month> {
  @override
  final int typeId = 4;

  @override
  Month read(BinaryReader reader) {
    switch (reader.readByte()) {
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
        return Month.january;
    }
  }

  @override
  void write(BinaryWriter writer, Month obj) {
    switch (obj) {
      case Month.january:
        writer.writeByte(0);
        break;
      case Month.february:
        writer.writeByte(1);
        break;
      case Month.march:
        writer.writeByte(2);
        break;
      case Month.april:
        writer.writeByte(3);
        break;
      case Month.may:
        writer.writeByte(4);
        break;
      case Month.june:
        writer.writeByte(5);
        break;
      case Month.july:
        writer.writeByte(6);
        break;
      case Month.august:
        writer.writeByte(7);
        break;
      case Month.september:
        writer.writeByte(8);
        break;
      case Month.october:
        writer.writeByte(9);
        break;
      case Month.november:
        writer.writeByte(10);
        break;
      case Month.december:
        writer.writeByte(11);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MonthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RankAdapter extends TypeAdapter<Rank> {
  @override
  final int typeId = 5;

  @override
  Rank read(BinaryReader reader) {
    switch (reader.readByte()) {
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
        return Rank.first;
    }
  }

  @override
  void write(BinaryWriter writer, Rank obj) {
    switch (obj) {
      case Rank.first:
        writer.writeByte(0);
        break;
      case Rank.second:
        writer.writeByte(1);
        break;
      case Rank.third:
        writer.writeByte(2);
        break;
      case Rank.fourth:
        writer.writeByte(3);
        break;
      case Rank.fifth:
        writer.writeByte(4);
        break;
      case Rank.last:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RankAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PeriodAdapter extends TypeAdapter<Period> {
  @override
  final int typeId = 6;

  @override
  Period read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Period.week;
      case 1:
        return Period.month;
      case 2:
        return Period.year;
      default:
        return Period.week;
    }
  }

  @override
  void write(BinaryWriter writer, Period obj) {
    switch (obj) {
      case Period.week:
        writer.writeByte(0);
        break;
      case Period.month:
        writer.writeByte(1);
        break;
      case Period.year:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeriodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DoItAtPeroidAdapter extends TypeAdapter<DoItAtPeroid> {
  @override
  final int typeId = 7;

  @override
  DoItAtPeroid read(BinaryReader reader) {
    switch (reader.readByte()) {
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
        return DoItAtPeroid.any;
    }
  }

  @override
  void write(BinaryWriter writer, DoItAtPeroid obj) {
    switch (obj) {
      case DoItAtPeroid.any:
        writer.writeByte(0);
        break;
      case DoItAtPeroid.morning:
        writer.writeByte(1);
        break;
      case DoItAtPeroid.afternoon:
        writer.writeByte(2);
        break;
      case DoItAtPeroid.evening:
        writer.writeByte(3);
        break;
      case DoItAtPeroid.night:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoItAtPeroidAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaskEvaluationMethodTypeAdapter
    extends TypeAdapter<TaskEvaluationMethodType> {
  @override
  final int typeId = 8;

  @override
  TaskEvaluationMethodType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskEvaluationMethodType.yesOrNo;
      case 1:
        return TaskEvaluationMethodType.checkList;
      default:
        return TaskEvaluationMethodType.yesOrNo;
    }
  }

  @override
  void write(BinaryWriter writer, TaskEvaluationMethodType obj) {
    switch (obj) {
      case TaskEvaluationMethodType.yesOrNo:
        writer.writeByte(0);
        break;
      case TaskEvaluationMethodType.checkList:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskEvaluationMethodTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
