import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../provider/theme_provider.dart';

import '../../../../../utils/date.dart';
import '../../../../../widgets/my_list_tile.dart';

class MyDate extends StatelessWidget {
  const MyDate({
    super.key,
    required this.now,
    required this.notifier,
  });

  final DateTime now;
  final MyProvider notifier;
  @override
  Widget build(BuildContext context) {
    return MyListTile(
      txt: 'Date',
      iconData: Icons.calendar_month,
      trailing: DropdownButton<String>(
        underline: Container(
          height: 1,
          color: Colors.grey.withOpacity(0.3),
        ),
        icon: const Icon(Icons.keyboard_arrow_down),
        dropdownColor: Theme.of(context).colorScheme.tertiary,
        value: dateFormats[notifier.dateTimeIndex],
        onChanged: (String? newValue) {
          MyProvider().playButtonClickSound('coo');
          if (newValue != null) {
            notifier.changeDateTimeMethod(dateFormats.indexOf(newValue));
          }
        },
        items: dateFormats.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              decideDateMethod(
                now,
                dateFormats.indexOf(value),
              ),
              style: GoogleFonts.poppins(),
            ),
          );
        }).toList(),
      ),
    );
  }
}
