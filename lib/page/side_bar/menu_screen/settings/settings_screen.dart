import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit/provider/theme_provider.dart';
import 'package:habit/widgets/my_title.dart';
import 'package:provider/provider.dart';

import '../../../../utils/padding.dart';
import '../../../../widgets/my_switch.dart';
import 'components/my_accent_color.dart';
import 'components/my_click_sound.dart';
import 'components/my_date.dart';
import 'lock/get_pin.dart';
import '../../../../widgets/my_list_tile.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, MyProvider notifier, child) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              padding: menuPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyText1(txt: 'your'),
                  const MyText2(txt: 'App Settings'),
                  const SizedBox(height: 10),
                  Expanded(
                      child: ListView(
                    children: [
                      MyListTile(
                        txt: 'Notification',
                        iconData: CupertinoIcons.bell,
                        trailing: MySwitch(
                          value: true,
                          onChanged: (value) {},
                        ),
                        onTap: () {},
                      ),
                      MyListTile(
                        txt: 'Lock Screen',
                        iconData: Icons.screen_lock_portrait,
                        trailing: MySwitch(
                          value: notifier.isLockScreen,
                          onChanged: (value) {
                            notifier.confirmationForLock();
                            if (notifier.isLockScreen) {
                              // print('w');
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const GetPinScreen(),
                              ));
                            }
                          },
                        ),
                      ),
                      MyClickSound(notifier: notifier),
                      MyAccentColor(notifier: notifier),
                      MyDate(now: now, notifier: notifier),
                      MyListTile(
                        forwardIcon: true,
                        txt: 'Language',
                        iconData: Icons.language,
                        onTap: () {
                          MyProvider().playButtonClickSound('coo');
                        },
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
