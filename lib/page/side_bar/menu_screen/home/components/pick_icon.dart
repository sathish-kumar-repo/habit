import 'package:flutter/material.dart';

import 'field_container.dart';

class PickIcon extends StatelessWidget {
  const PickIcon({super.key, required this.onTap, required this.iconData});
  final VoidCallback onTap;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return FieldContainer(
      iconData: Icons.now_widgets_rounded,
      title: 'Pick Your Icon',
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100,
          width: 100,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Icon(
            size: 80,
            iconData,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
