import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:habit/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../../entry.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final _lockScreenKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness;

    return Consumer(
      builder: (context, MyProvider notifier, child) {
        return Scaffold(
          body: Stack(
            children: [
              MyBgImg(theme: theme),
              ScreenLock(
                key: _lockScreenKey,
                correctString:
                    notifier.password, // Change this to your desired password
                deleteButton: const Icon(
                  Icons.backspace_outlined,
                  color: Colors.white,
                ),

                useLandscape: true,
                title: const Column(
                  children: [
                    Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                      size: 35,
                    ),
                    SizedBox(height: 20),
                    Text('Enter Passcode'),
                  ],
                ),
                onError: (value) {
                  MyProvider().playButtonClickSound('error');
                },
                secretsConfig: const SecretsConfig(
                  spacing: 20,
                  padding: EdgeInsets.only(
                    bottom: 40,
                    top: 15,
                  ),
                  secretConfig: SecretConfig(
                    borderSize: 1.5,
                    size: 14,
                  ),
                ),
                keyPadConfig: KeyPadConfig(
                  buttonConfig: KeyPadButtonConfig(
                    buttonStyle: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                useBlur: false,

                onUnlocked: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EntryPoint(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class MyBgImg extends StatelessWidget {
  const MyBgImg({
    super.key,
    required this.theme,
  });

  final Brightness theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/img/dark.png',
          ), // Change to your image path
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
