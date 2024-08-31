import 'package:hive/hive.dart';

import '../model/habit.dart';
import '../model/task.dart';

class Boxes {
  static Box<Habit> getHabit() => Hive.box<Habit>('habit');
  static Box<Task> getTask() => Hive.box<Task>('task');
}
