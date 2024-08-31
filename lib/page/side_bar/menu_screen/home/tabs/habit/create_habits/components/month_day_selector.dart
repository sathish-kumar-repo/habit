import 'package:flutter/material.dart';

import 'selector_container.dart';

class MonthDaySelector extends StatefulWidget {
  const MonthDaySelector({
    super.key,
    required this.monthSelector,
  });
  final List<List> monthSelector;
  @override
  State<MonthDaySelector> createState() => _MonthDaySelectorState();
}

class _MonthDaySelectorState extends State<MonthDaySelector> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      alignment: WrapAlignment.center,
      children: widget.monthSelector
          .map(
            (item) => SelectorContianer(
              txt: item[0].toString(),
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
