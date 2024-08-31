// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitAdapter extends TypeAdapter<Habit> {
  @override
  final int typeId = 10;

  @override
  Habit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Habit(
      habit: fields[0] as String,
      des: fields[1] as String?,
      evaluationMethod: fields[2] as EvaluationMethodType,
      numericAmount: fields[3] as NumericAmount?,
      goalNumericAmount: fields[4] as int?,
      unitNumericAmount: fields[5] as String?,
      durationTimerAmount: fields[6] as int?,
      habitSubItems: (fields[7] as List?)?.cast<SubItems>(),
      frequency: fields[8] as Frequency,
      weekFrequency: (fields[9] as List?)?.cast<WeekDays>(),
      isUtilizeDays: fields[10] as bool?,
      monthFrequency1: (fields[11] as List?)?.cast<dynamic>(),
      monthFrequency2: (fields[12] as List?)?.cast<dynamic>(),
      annualFrequency: (fields[13] as List?)?.cast<dynamic>(),
      periodFrequency: fields[14] as Period?,
      periodFrequencyDay: fields[15] as int?,
      isAlernateDays: fields[16] as bool?,
      recurringFrequency: fields[17] as int?,
      alernateActionDays: fields[18] as int?,
      alernateRestDays: fields[19] as int?,
      selectedIconGroup: fields[20] as String,
      selectedIconIndex: fields[21] as int,
      selectedClrIndex: fields[22] as int,
      doItAt: fields[23] as DoItAtPeroid,
      habitStartDate: fields[24] as DateTime,
      isEnd: fields[25] as bool?,
      habitEndDate: fields[26] as DateTime?,
      repeat: fields[27] as int,
      remindTime: fields[28] as DateTime?,
      priority: fields[29] as int,
      track: (fields[30] as Map).map((dynamic k, dynamic v) =>
          MapEntry(k as String, (v as List).cast<Object>())),
    );
  }

  @override
  void write(BinaryWriter writer, Habit obj) {
    writer
      ..writeByte(31)
      ..writeByte(0)
      ..write(obj.habit)
      ..writeByte(1)
      ..write(obj.des)
      ..writeByte(2)
      ..write(obj.evaluationMethod)
      ..writeByte(3)
      ..write(obj.numericAmount)
      ..writeByte(4)
      ..write(obj.goalNumericAmount)
      ..writeByte(5)
      ..write(obj.unitNumericAmount)
      ..writeByte(6)
      ..write(obj.durationTimerAmount)
      ..writeByte(7)
      ..write(obj.habitSubItems)
      ..writeByte(8)
      ..write(obj.frequency)
      ..writeByte(9)
      ..write(obj.weekFrequency)
      ..writeByte(10)
      ..write(obj.isUtilizeDays)
      ..writeByte(11)
      ..write(obj.monthFrequency1)
      ..writeByte(12)
      ..write(obj.monthFrequency2)
      ..writeByte(13)
      ..write(obj.annualFrequency)
      ..writeByte(14)
      ..write(obj.periodFrequency)
      ..writeByte(15)
      ..write(obj.periodFrequencyDay)
      ..writeByte(16)
      ..write(obj.isAlernateDays)
      ..writeByte(17)
      ..write(obj.recurringFrequency)
      ..writeByte(18)
      ..write(obj.alernateActionDays)
      ..writeByte(19)
      ..write(obj.alernateRestDays)
      ..writeByte(20)
      ..write(obj.selectedIconGroup)
      ..writeByte(21)
      ..write(obj.selectedIconIndex)
      ..writeByte(22)
      ..write(obj.selectedClrIndex)
      ..writeByte(23)
      ..write(obj.doItAt)
      ..writeByte(24)
      ..write(obj.habitStartDate)
      ..writeByte(25)
      ..write(obj.isEnd)
      ..writeByte(26)
      ..write(obj.habitEndDate)
      ..writeByte(27)
      ..write(obj.repeat)
      ..writeByte(28)
      ..write(obj.remindTime)
      ..writeByte(29)
      ..write(obj.priority)
      ..writeByte(30)
      ..write(obj.track);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
