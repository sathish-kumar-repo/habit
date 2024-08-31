import 'package:flutter/material.dart';

import '../../../../../provider/theme_provider.dart';
import '../../../../../widgets/my_list_tile.dart';
import '../../../../../widgets/my_switch.dart';

class MyClickSound extends StatelessWidget {
  const MyClickSound({
    super.key,
    required this.notifier,
  });
  final MyProvider notifier;
  @override
  Widget build(BuildContext context) {
    return MyListTile(
      txt: 'Click Sound',
      iconData: Icons.volume_up,
      trailing: MySwitch(
        value: notifier.isClickSound,
        onChanged: (value) => notifier.confirmationForClickSound(),
      ),
    );
  }
}
