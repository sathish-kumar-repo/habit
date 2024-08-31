import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../../../../data/icon_list.dart';
import '../../../../../provider/theme_provider.dart';

class IconSelector extends StatefulWidget {
  const IconSelector({
    super.key,
    required this.initialSelectedIconGroup,
    required this.initialSelectedIconIndex,
  });
  final String initialSelectedIconGroup;
  final int initialSelectedIconIndex;
  @override
  State<IconSelector> createState() => _IconSelectorState();
}

class _IconSelectorState extends State<IconSelector>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _selectedGroupIndex = 0;
  int _selectedIconIndex = 0;
  @override
  void initState() {
    _selectedGroupIndex =
        groupedIcons.keys.toList().indexOf(widget.initialSelectedIconGroup);
    _selectedIconIndex = widget.initialSelectedIconIndex;

    _tabController = TabController(
      vsync: this,
      length: groupedIcons.length,
      initialIndex: _selectedGroupIndex,
    );
    _tabController.addListener(() {
      setState(() {
        _selectedGroupIndex = _tabController.index;
        _selectedIconIndex = 0; // Reset icon index when changing group
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: groupedIcons.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: const Text('Icons'),
          bottom: TabBar(
            tabAlignment: TabAlignment.center,
            physics: const BouncingScrollPhysics(),
            labelStyle: GoogleFonts.poppins(fontSize: 16),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            isScrollable: true,
            controller: _tabController,
            tabs: groupedIcons.keys.map((group) => Tab(text: group)).toList(),
            onTap: (index) {
              setState(() {
                _selectedGroupIndex = index;
                _selectedIconIndex = 0; // Reset icon index when changing group
              });
            },
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: _tabController,
          children: groupedIcons.values.map((icons) {
            return ResponsiveGridList(
              minItemWidth: 80,
              children: List.generate(icons.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      MyProvider().playButtonClickSound('coo');
                      _selectedIconIndex = index;
                    });
                    Navigator.of(context).pop([
                      groupedIcons.keys.elementAt(_selectedGroupIndex),
                      _selectedIconIndex
                    ]);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _selectedIconIndex == index
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey.withOpacity(0.3),
                    ),
                    child: Center(
                      child: Icon(
                        icons[index],
                        size: 30,
                        color:
                            _selectedIconIndex == index ? Colors.white : null,
                      ),
                    ),
                  ),
                );
              }),
            );
          }).toList(),
        ),
      ),
    );
  }
}
