import 'package:hive/hive.dart';
import 'my_enum_for_model.dart';
import 'sub_item.dart';

part 'habit.g.dart';

// Hive model class for Habit
@HiveType(typeId: 10)
class Habit extends HiveObject {
  // Habit Name
  @HiveField(0)
  String habit;

  // Habit Description
  @HiveField(1)
  String? des;

  // Evaluation method for the habit
  @HiveField(2)
  EvaluationMethodType evaluationMethod;

  // Numeric evaluation details
  @HiveField(3)
  NumericAmount? numericAmount;

  @HiveField(4)
  int? goalNumericAmount;

  @HiveField(5)
  String? unitNumericAmount;

  // Timer evaluation details
  @HiveField(6)
  int? durationTimerAmount;

  // Checklist evaluation details
  @HiveField(7)
  List<SubItems>? habitSubItems;

  // Frequency of habit execution
  @HiveField(8)
  Frequency frequency;

  // Weekly frequency
  @HiveField(9)
  List<WeekDays>? weekFrequency;

  // Monthly frequency
  @HiveField(10)
  bool? isUtilizeDays;

  // isUtilizeDays false
  @HiveField(11)
  List? monthFrequency1;

  // isUtilizeDays true
  @HiveField(12)
  List? monthFrequency2;

  // Annual frequency
  @HiveField(13)
  List? annualFrequency;

  // Periodic frequency
  @HiveField(14)
  Period? periodFrequency;

  @HiveField(15)
  int? periodFrequencyDay;

  // Recurring frequency
  @HiveField(16)
  bool? isAlernateDays;

  // isAlernateDays false
  @HiveField(17)
  int? recurringFrequency;

  // isAlernateDays true
  @HiveField(18)
  int? alernateActionDays;

  @HiveField(19)
  int? alernateRestDays;

  // Selected icon group and index
  @HiveField(20)
  String selectedIconGroup;

  @HiveField(21)
  int selectedIconIndex;

  // Selected color index
  @HiveField(22)
  int selectedClrIndex;

  // Preferred time to do the habit
  @HiveField(23)
  DoItAtPeroid doItAt;

  // Start date for the habit
  @HiveField(24)
  DateTime habitStartDate;

  // End date for the habit
  @HiveField(25)
  bool? isEnd;

  @HiveField(26)
  DateTime? habitEndDate;

  // Number of times to repeat the habit
  @HiveField(27)
  int repeat;

  // Time to remind about the habit
  @HiveField(28)
  DateTime? remindTime;

  // Priority of the habit
  @HiveField(29)
  int priority;

  // Habit tracking details
  @HiveField(30)
  Map<String, List<Object>> track;

  // Constructor for HabitModel
  Habit({
    required this.habit,
    required this.des,
    required this.evaluationMethod,
    required this.numericAmount,
    required this.goalNumericAmount,
    required this.unitNumericAmount,
    required this.durationTimerAmount,
    required this.habitSubItems,
    required this.frequency,
    required this.weekFrequency,
    required this.isUtilizeDays,
    required this.monthFrequency1,
    required this.monthFrequency2,
    required this.annualFrequency,
    required this.periodFrequency,
    required this.periodFrequencyDay,
    required this.isAlernateDays,
    required this.recurringFrequency,
    required this.alernateActionDays,
    required this.alernateRestDays,
    required this.selectedIconGroup,
    required this.selectedIconIndex,
    required this.selectedClrIndex,
    required this.doItAt,
    required this.habitStartDate,
    required this.isEnd,
    required this.habitEndDate,
    required this.repeat,
    required this.remindTime,
    required this.priority,
    required this.track,
  });
}
