import 'package:flutter/material.dart';

class CustomBottomModelSheet extends StatelessWidget {
  const CustomBottomModelSheet({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });
  final Widget child;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.onTertiary,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: Container(
        padding: padding,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          color: Theme.of(context).colorScheme.onTertiary,
        ),
        child: child,
      ),
    );
  }
}
