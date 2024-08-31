import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/enum_fn.dart';

class RollingSwitch extends StatelessWidget {
  const RollingSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final String value;
  final void Function(String val) onChanged;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedToggleSwitch<String>.rolling(
        styleBuilder: (value) => ToggleStyle(
          indicatorColor: Theme.of(context).colorScheme.primary,
          borderColor: Colors.transparent,
        ),
        current: value,
        iconBuilder: (value, foreground) {
          return Icon(
            getIcon(value),
            color: foreground ? Colors.white : null,
          );
        },
        values: const [
          'All',
          'Any time',
          'Morning',
          'Afternoon',
          'Evening',
          'Night'
        ],
        onChanged: onChanged,
      ),
    );
  }
}
