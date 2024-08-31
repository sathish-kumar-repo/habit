import 'package:flutter/material.dart';

import '../../../../../provider/theme_provider.dart';
import '../../../../../widgets/my_expansion_tile.dart';
import 'back_up_option.dart';

class MyBackUp extends StatelessWidget {
  const MyBackUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyExpansionTile(
      title: 'Back up',
      iconData: Icons.backup_outlined,
      childrens: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              BackUpOption(
                ctx: context,
                iconData: Icons.file_copy,
                txt: 'Create backup file',
                onTap: () {
                  MyProvider().playButtonClickSound('coo');
                },
              ),
              BackUpOption(
                ctx: context,
                iconData: Icons.restore,
                txt: 'Import backup file',
                onTap: () {
                  MyProvider().playButtonClickSound('coo');
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
