import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  const MyBtn({
    super.key,
    required this.themeColor,
    required this.iconData,
    required this.onTap,
  });

  final Color themeColor;
  final IconData iconData;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: themeColor.withOpacity(0.1),
        ),
        child: Icon(
          iconData,
          color: themeColor,
        ),
      ),
    );
  }
}
