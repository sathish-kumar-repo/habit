import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit/provider/theme_provider.dart';
import 'package:habit/page/side_bar/menu_screen/settings/lock/lock_screen.dart';
import 'package:provider/provider.dart';

import '../../page/entry.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer(
      builder: (context, MyProvider notifier, child) {
        return FlutterSplashScreen(
          useImmersiveMode: true,
          duration: const Duration(milliseconds: 1000),
          nextScreen: (notifier.isLockScreen && notifier.password != '')
              ? const LockScreen()
              : const EntryPoint(),
          backgroundColor: Colors.black,
          splashScreenBody: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height / 2.7,
                ),
                Container(
                  width: size.width / 2.5,
                  height: size.width / 2.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // border: Border.all(
                    //   color: Colors.white,
                    //   width: 2,
                    // ),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.checkmark_alt,
                      color: Colors.white,
                      size: size.width / 3,
                    ),
                  ),
                ),
                const Spacer(),
                SafeArea(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 30,
                      left: 20,
                      right: 20,
                      top: 10,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Track Your Habits', // Updated text
                          style: GoogleFonts.poppins(
                            fontSize: size.width / 15,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Stay motivated and reach your goals by tracking your daily habits.', // Related text
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: size.width / 23,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
