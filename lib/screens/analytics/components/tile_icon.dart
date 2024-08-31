import 'package:flutter/material.dart';

class TileIcon extends StatelessWidget {
  const TileIcon({
    super.key,
    required this.iconData,
    required this.onTap,
  });
  final IconData iconData;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        iconData,
        color: Colors.grey,
        size: 20,
      ),
    );
  }
}
