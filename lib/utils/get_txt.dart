import '../model/habit.dart';

String getNumericAmountText(Habit habitModel) {
  return '${habitModel.goalNumericAmount}${habitModel.unitNumericAmount != '' ? ' ${habitModel.unitNumericAmount}' : ''}';
}
