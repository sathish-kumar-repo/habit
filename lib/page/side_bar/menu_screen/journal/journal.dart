import 'package:flutter/material.dart';

import '../../../../utils/padding.dart';

class Journal extends StatelessWidget {
  const Journal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: menuPadding(),
          child: const Column(
            children: [Text('journal')],
          ),
        ),
      ),
    );
  }
}
