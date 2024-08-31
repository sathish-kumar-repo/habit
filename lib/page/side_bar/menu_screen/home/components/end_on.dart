import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'field_container.dart';

class EndOn extends StatelessWidget {
  const EndOn({
    super.key,
    required this.selectedEndDate,
    required this.howManyDaysSelected,
    required this.onToggle,
    required this.isShow,
  });
  final String selectedEndDate;
  final int howManyDaysSelected;
  final void Function(int? index) onToggle;
  final bool isShow;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      child: isShow
          ? FieldContainer(
              iconData: Icons.date_range_rounded,
              title: 'End on',
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ToggleSwitch(
                      minHeight: 50,
                      customWidths: const [
                        150,
                        100,
                      ],
                      radiusStyle: true,
                      cornerRadius: 50.0,
                      inactiveBgColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      activeBgColor: [Theme.of(context).colorScheme.primary],
                      labels: [
                        selectedEndDate,
                        '$howManyDaysSelected days',
                      ],
                      centerText: true,
                      changeOnTap: false,
                      onToggle: onToggle,
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
