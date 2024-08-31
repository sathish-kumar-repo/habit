import 'package:flutter/material.dart';

import '../../../../../provider/theme_provider.dart';
import '../../../../../theme/accent_colors.dart';
import '../../../../../widgets/my_expansion_tile.dart';
import 'accent_color_containers.dart';

class MyAccentColor extends StatelessWidget {
  const MyAccentColor({
    super.key,
    required this.notifier,
  });
  final MyProvider notifier;
  @override
  Widget build(BuildContext context) {
    return MyExpansionTile(
      iconData: Icons.color_lens,
      title: 'Accent colors',
      childrens: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: accentColorLst.map((clr) {
              int clrIndex = accentColorLst.indexOf(clr);

              return GestureDetector(
                onTap: () {
                  MyProvider().playButtonClickSound('coo');
                  notifier.changeAccentColorIndex(clrIndex);
                },
                child: clrIndex == notifier.accentClrIndex
                    ? SelectedAccentColorContianer(clr: clr)
                    : UnSelectedAccentColorContianer(clr: clr),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
