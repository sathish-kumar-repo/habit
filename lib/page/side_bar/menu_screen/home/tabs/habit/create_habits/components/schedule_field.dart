import 'package:animated_switcher_plus/animated_switcher_plus.dart';

import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../components/field_container.dart';

class ScheduleField extends StatelessWidget {
  const ScheduleField({
    super.key,
    required this.frequencyIndex,
    required this.onToggle,
    required this.child,
  });
  final int frequencyIndex;
  final void Function(int? index) onToggle;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FieldContainer(
      iconData: Icons.refresh,
      title:
          'How frequently would you prefer to schedule this task or activity?',
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            ToggleSwitch(
              activeBgColor: [Theme.of(context).colorScheme.primary],
              activeFgColor: Colors.white,
              inactiveBgColor: Theme.of(context).scaffoldBackgroundColor,
              isVertical: true,
              minWidth: size.width * 0.7,
              radiusStyle: true,
              minHeight: 50,
              centerText: false,
              cornerRadius: 20.0,
              initialLabelIndex: frequencyIndex,
              labels: const [
                'Daily',
                'Weekly on designated days',
                'Monthly on specified dates',
                'Annually on particular dates',
                'Periodically on selected days',
                'Recurring',
              ],
              icons: const [
                Icons.calendar_today,
                Icons.today,
                Icons.calendar_month,
                Icons.event,
                Icons.sync,
                Icons.repeat,
              ],
              animate: true,
              curve: Curves.fastOutSlowIn,
              onToggle: onToggle,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedSwitcherPlus.translationLeft(
                duration: const Duration(milliseconds: 600),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
