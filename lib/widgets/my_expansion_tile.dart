import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/theme_provider.dart';

class MyExpansionTile extends StatelessWidget {
  const MyExpansionTile({
    super.key,
    required this.iconData,
    required this.childrens,
    required this.title,
  });
  final String title;
  final IconData iconData;
  final List<Widget> childrens;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
          collapsedIconColor: Colors.grey,
          iconColor: Colors.grey,
          tilePadding: EdgeInsetsDirectional.zero,
          onExpansionChanged: (value) {
            MyProvider().playButtonClickSound('coo');
          },
          leading: Icon(
            iconData,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          children: childrens),
    );
  }
}
