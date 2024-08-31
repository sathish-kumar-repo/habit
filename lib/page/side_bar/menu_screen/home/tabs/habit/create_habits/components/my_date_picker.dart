import 'package:flutter/material.dart';

class MyDatePicker extends StatelessWidget {
  const MyDatePicker({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity + 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        // color: CupertinoColors.systemBackground.resolveFrom(context),
        color: Theme.of(context).colorScheme.onTertiary,
      ),
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: child,
    );
  }
}
