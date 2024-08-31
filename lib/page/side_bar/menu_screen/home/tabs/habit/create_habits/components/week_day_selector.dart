import 'package:flutter/material.dart';
import 'package:habit/utils/enum_fn.dart';

import 'selector_container.dart';

class WeekDaySelector extends StatefulWidget {
  const WeekDaySelector({super.key, required this.daySelectorList});
  final List<List> daySelectorList;
  @override
  State<WeekDaySelector> createState() => _WeekDaySelectorState();
}

class _WeekDaySelectorState extends State<WeekDaySelector> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 15,
      spacing: 15,
      alignment: WrapAlignment.center,
      children: widget.daySelectorList
          .map(
            (item) => SelectorContianer(
              txt: getWeekDays(item[0], true),
              isSelected: item[1],
              onTap: () {
                setState(() {
                  item[1] = !item[1];
                });
              },
            ),
          )
          .toList(),
    );
  }
}
