import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../provider/theme_provider.dart';

// import '../provider/theme_provider.dart';

class MySwitch extends StatelessWidget {
  const MySwitch({
    super.key,
    required this.onChanged,
    required this.value,
  });
  final void Function(bool value) onChanged;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      alignment: Alignment.centerRight,
      child: CupertinoSwitch(
        activeColor: Theme.of(context).colorScheme.primary,
        value: value,
        onChanged: (value) {
          MyProvider().playButtonClickSound('switch');
          onChanged(value);
        },
      ),
    );
  }
}
