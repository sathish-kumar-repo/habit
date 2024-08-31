import 'package:flutter/material.dart';

import 'field_container.dart';

class PickClr extends StatelessWidget {
  const PickClr({super.key, required this.onTap, required this.clr});
  final VoidCallback onTap;
  final Color clr;
  @override
  Widget build(BuildContext context) {
    return FieldContainer(
      iconData: Icons.color_lens,
      title: 'Pick Your Color',
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100,
          width: 100,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: clr,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
