import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:habit/page/side_bar/menu_screen/home/tabs/task/task.dart';
import 'package:habit/utils/sound.dart';

import 'package:habit/widgets/card_widgets.dart';
import 'package:habit/widgets/custom_model_bottom_sheet.dart';

import '../../../../provider/theme_provider.dart';

import 'tabs/completed/completed.dart';

import 'tabs/task/create_task/add_task.dart';
import 'tabs/habit/create_habits/add_habits.dart';

import 'tabs/habit/habit.dart';

List bottomMenus = [
  [Icons.today_rounded, 'Today'],
  [Icons.done_all, 'Habit'],
  [Icons.done_all, 'Task'],
  [CupertinoIcons.rocket, 'Achieve'],
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  // int compeletedDays = 0;

  bool isDouble = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      const HabitScreen(),
      const HabitScreen(),
      const TaskScreen(),
      const CompletedScreen(),
    ];

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: body[currentIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: const CircleBorder(),
          onPressed: showModalPopupForSelectingHabit,
          child: const Icon(CupertinoIcons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          height: 80,
          itemCount: bottomMenus.length,
          tabBuilder: (index, isActive) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: isActive
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                        : null,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    bottomMenus[index][0],
                    size: 24,
                    color: isActive
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                  ),
                ),
                Text(
                  bottomMenus[index][1],
                  style: TextStyle(
                    fontSize: 13,
                    color: isActive
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                  ),
                ),
              ],
            );
          },
          backgroundColor: Theme.of(context).colorScheme.onTertiary,

          splashColor: Theme.of(context).colorScheme.primary,
          splashSpeedInMilliseconds: 300,
          splashRadius: 20,
          activeIndex: currentIndex,

          // shadow: BoxShadow(
          //   color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          //   spreadRadius: 5,
          //   blurRadius: 8,
          //   offset: const Offset(0, -3),
          // ),
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          onTap: (int newIndex) {
            MyProvider().playButtonClickSound('coo');
            setState(() {
              currentIndex = newIndex;
            });
          },
          //other params
        ),
      ),
    );
  }

  void showModalPopupForSelectingHabit() {
    click(context);
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return CustomBottomModelSheet(
          child: Wrap(
            children: [
              BottomSheetTile(
                clr: Theme.of(context).colorScheme.primary,
                title: 'Habit',
                subtitle:
                    'Establish new habits to improve productivity and well-being.',
                iconData: Icons.today_rounded,
                onTap: () {
                  setState(() {
                    isDouble = false;
                  });

                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const AddHabits(),
                    ),
                  );
                },
              ),
              // BottomSheetTile(
              //   clr: Theme.of(context).colorScheme.primary,
              //   title: 'Routine',
              //   subtitle:
              //       'Empower Your Journey with Structured Routines for Productivity and Growth.',
              //   iconData: Icons.list_alt_rounded,
              //   onTap: () {
              //     setState(() {
              //       isDouble = false;
              //     });

              //     Navigator.push(
              //       context,
              //       CupertinoPageRoute(
              //         builder: (context) => const AddRoutines(),
              //       ),
              //     );
              //   },
              // ),
              BottomSheetTile(
                clr: Theme.of(context).colorScheme.primary,
                title: 'Task',
                subtitle:
                    'Efficiently Manage Your Responsibilities for Enhanced Productivity and Success',
                iconData: Icons.done_all_rounded,
                onTap: () {
                  setState(() {
                    isDouble = false;
                  });

                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const AddTask(),
                    ),
                  );
                },
              ),
              // BottomSheetTile(
              //   title: 'In-Built Habits',
              //   subtitle:
              //       'Explore pre-defined habits curated for your convenience and growth.',
              //   iconData: Icons.widgets,
              //   onTap: () {
              //     MyProvider().playButtonClickSound('coo');
              //     setState(() {
              //       isDouble = true;
              //     });

              //     Navigator.push(
              //       context,
              //       CupertinoPageRoute(
              //         builder: (context) =>
              //             AddInBuildHabits(onSave: saveDetails),
              //       ),
              //     );
              //   },
              // )
            ],
          ),
        );
      },
    );
  }
}


// if (a == b) {
//   return 0; // Elements are equal, maintain their order
// }
// if (a) {
//   return -1; // Place 'true' before 'false'
// } else {
//   return 1; // Place 'false' after 'true'
// }
//CustomFlushbarWidget.build(isEdit: isEdit, context: context).show(context);