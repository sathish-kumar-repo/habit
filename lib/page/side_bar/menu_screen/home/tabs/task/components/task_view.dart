import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class TaskView extends StatelessWidget {
  const TaskView({
    super.key,
    required this.taskIndex,
    required this.onToggle,
  });

  final int taskIndex;
  final void Function(int?) onToggle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ToggleSwitch(
          minHeight: 50,
          customWidths: const [
            90,
            110,
            120,
            120,
          ],
          radiusStyle: true,
          totalSwitches: 4,
          cornerRadius: 50.0,
          animate: true,
          curve: Curves.fastOutSlowIn,
          initialLabelIndex: taskIndex,
          inactiveBgColor: Theme.of(context).scaffoldBackgroundColor,
          activeBgColor: [Theme.of(context).colorScheme.primary],
          labels: const ['All', 'Today', 'Overdue', 'Finished'],
          icons: const [
            Icons.view_list_rounded,
            Icons.today,
            Icons.warning,
            Icons.done,
          ],
          onToggle: onToggle,
        ),
      ),
    );
  }
}
