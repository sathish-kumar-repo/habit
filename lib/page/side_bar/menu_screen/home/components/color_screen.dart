import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../../../../data/habit_clr_list.dart';
import '../../../../../provider/theme_provider.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({
    super.key,
    required this.initialSelectedColorIndex,
  });
  final int initialSelectedColorIndex;
  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  int _selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    _selectedColorIndex = widget.initialSelectedColorIndex;
    final theme = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Selector'),
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ResponsiveGridList(
          minItemWidth: 80,
          children: List.generate(
            habitClrLst.length,
            (index) {
              Color color = habitClrLst[index];
              return GestureDetector(
                onTap: () {
                  MyProvider().playButtonClickSound('coo');
                  setState(() {
                    _selectedColorIndex = index;
                  });
                  Navigator.of(context).pop(_selectedColorIndex);
                },
                child: _selectedColorIndex == index
                    ? SelectedContainer(theme: theme, color: color)
                    : ColorContainer(theme: theme, color: color),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SelectedContainer extends StatelessWidget {
  const SelectedContainer({
    super.key,
    required this.theme,
    required this.color,
  });

  final Brightness theme;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: theme == Brightness.dark
              ? color == Colors.black
                  ? Colors.grey
                  : color
              : color,
          width: 2,
        ),
      ),
      child: ColorContainer(theme: theme, color: color),
    );
  }
}

class ColorContainer extends StatelessWidget {
  const ColorContainer({
    super.key,
    required this.theme,
    required this.color,
  });

  final Brightness theme;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme == Brightness.dark
            ? color == Colors.black
                ? Colors.grey
                : color
            : color,
      ),
    );
  }
}
