import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:habit/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import 'components/info_card.dart';
import '../../widgets/my_list_tile.dart';
import '../../widgets/my_switch.dart';
import 'components/side_bar_tilte.dart';
import 'components/side_menu.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key, required this.onTap});
  final void Function(int newIndex) onTap;
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List sideMenu = [
    [
      Icons.home,
      'Home',
    ],
    [
      Icons.book,
      'Daily Journal',
    ],
    [
      Icons.widgets,
      'View All',
    ],
    [
      CupertinoIcons.settings,
      'Settings',
    ],
    [
      Icons.backup,
      'App maintenance',
    ],
    [
      Icons.support,
      'Support us',
    ],
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, MyProvider notifier, child) {
        return Scaffold(
          body: Container(
            width: 288,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              // borderRadius: const BorderRadius.all(
              //   Radius.circular(30),
              // ),
            ),
            child: SafeArea(
              child: DefaultTextStyle(
                style: const TextStyle(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InfoCard(),
                    const SideBarTitle(
                      txt: 'menu',
                    ),
                    ...sideMenu.map(
                      (lst) {
                        int index = sideMenu.indexOf(lst);
                        return SideMenu(
                          press: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            widget.onTap(selectedIndex);
                          },
                          iconData: lst[0],
                          txt: lst[1],
                          index: index,
                          selectedIndex: selectedIndex,
                        );
                      },
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: MyListTile(
                        txt: 'Get Premium',
                        iconData: Icons.workspace_premium_outlined,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: MyListTile(
                        txt: 'Dark Mode',
                        iconData: Icons.dark_mode,
                        trailing: MySwitch(
                          onChanged: (value) => notifier.changeTheme(),
                          value: notifier.isDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
