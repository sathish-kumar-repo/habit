import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({
    super.key,
    required this.compeletedIndex,
    required this.onToggle,
  });

  final int compeletedIndex;
  final void Function(int?) onToggle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ToggleSwitch(
          minHeight: 50,
          minWidth: 100.0,
          radiusStyle: true,
          totalSwitches: 3,
          cornerRadius: 50.0,
          animate: true,
          curve: Curves.fastOutSlowIn,
          initialLabelIndex: compeletedIndex,
          inactiveBgColor: Theme.of(context).scaffoldBackgroundColor,
          activeBgColor: [Theme.of(context).colorScheme.primary],
          labels: const ['Habit', 'Routines', 'Task'],
          icons: const [
            Icons.today,
            Icons.list_alt_rounded,
            Icons.done_all,
          ],
          onToggle: onToggle,
        ),
      ),
    );
  }
}
