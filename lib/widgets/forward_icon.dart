import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForwardIcon extends StatelessWidget {
  const ForwardIcon({
    super.key,
    this.size = 16,
  });
  final double size;
  @override
  Widget build(BuildContext context) {
    return Icon(
      CupertinoIcons.forward,
      size: size,
      color: Colors.grey,
    );
  }
}
