import 'package:hive/hive.dart';

part 'my_enum_for_model.g.dart';

@HiveType(typeId: 0)
enum EvaluationMethodType {
  @HiveField(0)
  yesOrNo,
  @HiveField(1)
  numeric,
  @HiveField(2)
  timer,
  @HiveField(3)
  checkList,
}

@HiveType(typeId: 1)
enum NumericAmount {
  @HiveField(0)
  atLeast,
  @HiveField(1)
  atMost,
  @HiveField(2)
  lessThan,
  @HiveField(3)
  greaterThan,
  @HiveField(4)
  exactly,
  @HiveField(5)
  anyValue,
}

@HiveType(typeId: 2)
enum Frequency {
  @HiveField(0)
  daily,
  @HiveField(1)
  weekly,
  @HiveField(2)
  monthly,
  @HiveField(3)
  annually,
  @HiveField(4)
  periodically,
  @HiveField(5)
  recurring,
}

@HiveType(typeId: 3)
enum WeekDays {
  @HiveField(0)
  sunday,
  @HiveField(1)
  monday,
  @HiveField(2)
  tuesday,
  @HiveField(3)
  wednesday,
  @HiveField(4)
  thursday,
  @HiveField(5)
  friday,
  @HiveField(6)
  saturday,
}

@HiveType(typeId: 4)
enum Month {
  @HiveField(0)
  january,
  @HiveField(1)
  february,
  @HiveField(2)
  march,
  @HiveField(3)
  april,
  @HiveField(4)
  may,
  @HiveField(5)
  june,
  @HiveField(6)
  july,
  @HiveField(7)
  august,
  @HiveField(8)
  september,
  @HiveField(9)
  october,
  @HiveField(10)
  november,
  @HiveField(11)
  december,
}

@HiveType(typeId: 5)
enum Rank {
  @HiveField(0)
  first,
  @HiveField(1)
  second,
  @HiveField(2)
  third,
  @HiveField(3)
  fourth,
  @HiveField(4)
  fifth,
  @HiveField(5)
  last,
}

@HiveType(typeId: 6)
enum Period {
  @HiveField(0)
  week,
  @HiveField(1)
  month,
  @HiveField(2)
  year,
}

@HiveType(typeId: 7)
enum DoItAtPeroid {
  @HiveField(0)
  any,
  @HiveField(1)
  morning,
  @HiveField(2)
  afternoon,
  @HiveField(3)
  evening,
  @HiveField(4)
  night,
}

@HiveType(typeId: 8)
enum TaskEvaluationMethodType {
  @HiveField(0)
  yesOrNo,
  @HiveField(1)
  checkList,
}
