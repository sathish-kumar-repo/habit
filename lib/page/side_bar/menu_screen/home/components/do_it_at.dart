import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'do_it_at_text.dart';
import 'field_container.dart';

class DoItAt extends StatelessWidget {
  const DoItAt({
    super.key,
    required this.doItAtIndex,
    required this.onToggle,
  });

  final int doItAtIndex;
  final void Function(int?) onToggle;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FieldContainer(
      iconData: Icons.repeat_rounded,
      title: 'Do it at',
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
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
              initialLabelIndex: doItAtIndex,
              labels: const ['Any', 'Morning', 'Afternoon', 'Evening', 'Night'],
              icons: const [
                Icons.access_time,
                Icons.wb_sunny,
                Icons.wb_cloudy,
                Icons.brightness_2,
                Icons.nightlight_round,
              ],
              animate: true,
              curve: Curves.fastOutSlowIn,
              onToggle: onToggle,
            ),
            const SizedBox(height: 10),
            DoItAtText(doItAtIndex: doItAtIndex),
          ],
        ),
      ),
    );
  }
}
