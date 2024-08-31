import 'package:flutter/material.dart';

class SideBarTitle extends StatelessWidget {
  const SideBarTitle({
    super.key,
    required this.txt,
  });
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
      child: Text(
        txt.toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.grey),
      ),
    );
  }
}
