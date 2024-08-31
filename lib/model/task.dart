import 'package:habit/model/sub_item.dart';
import 'package:hive/hive.dart';

import 'my_enum_for_model.dart';

part 'task.g.dart';

// Task class
@HiveType(typeId: 11)
class Task extends HiveObject {
  @HiveField(0)
  TaskEvaluationMethodType evaluationMethod;

  @HiveField(1)
  String task;

  @HiveField(2)
  String? des;

  @HiveField(3)
  DateTime date;

  @HiveField(4)
  bool isTaskComplete;

  @HiveField(5)
  int priority;

  @HiveField(6)
  DateTime remainder;

  @HiveField(7)
  String selectedIconGroup;

  @HiveField(8)
  int selectedIconIndex;

  @HiveField(10)
  int selectedClrIndex;

  @HiveField(11)
  DoItAtPeroid doItAt;

  @HiveField(12)
  List<SubItems>? taskSubitems;

  Task({
    required this.evaluationMethod,
    required this.task,
    required this.des,
    required this.date,
    required this.isTaskComplete,
    required this.priority,
    required this.remainder,
    required this.selectedIconGroup,
    required this.selectedIconIndex,
    required this.selectedClrIndex,
    required this.doItAt,
    required this.taskSubitems,
  });
}
