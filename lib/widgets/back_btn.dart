import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit/utils/sound.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          click(context);
          Navigator.pop(context);
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).colorScheme.primary),
          ),
          child: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
