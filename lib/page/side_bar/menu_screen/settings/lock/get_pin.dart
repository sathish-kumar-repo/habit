import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class GetPinScreen extends StatefulWidget {
  const GetPinScreen({super.key});

  @override
  State<GetPinScreen> createState() => _GetPinScreenState();
}

class _GetPinScreenState extends State<GetPinScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final int maxLength = 6;
  bool isButtonEnabled = false;
  @override
  void initState() {
    super.initState();
    passwordController.addListener(_checkButtonState);
    confirmPasswordController.addListener(_checkButtonState);
  }

  void _checkButtonState() {
    setState(() {
      isButtonEnabled = passwordController.text.length == maxLength &&
          passwordController.text == confirmPasswordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Consumer(
      builder: (context, MyProvider notifier, child) {
        return PopScope(
          canPop: true,
          onPopInvoked: (didPop) {
            if (didPop) {
              notifier.confirmationForLock();
            }
          },
          child: SafeArea(
            child: Scaffold(
              backgroundColor: colorScheme.onTertiary,
              body: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                  bottom: 0,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Icon(
                      Icons.lock_outline,
                      size: 35,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Set up screen lock',
                      style: GoogleFonts.poppins(
                        fontSize: size.width / 15,
                      ),
                    ),
                    Text(
                      'For Security, set PIN',
                      style: GoogleFonts.poppins(),
                    ),
                    const SizedBox(height: 30),
                    const ScreenLockTitleFieldHeading('Enter your passcode'),
                    const SizedBox(height: 5),
                    LockScreenTextField(
                      controller: passwordController,
                      colorScheme: colorScheme,
                    ),
                    const SizedBox(height: 20),
                    const ScreenLockTitleFieldHeading('Verify your passcode'),
                    const SizedBox(height: 5),
                    LockScreenTextField(
                      controller: confirmPasswordController,
                      colorScheme: colorScheme,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'The PIN must be 6 digits',
                      style: GoogleFonts.poppins(),
                    ),
                  ],
                ),
              ),
              bottomSheet: Container(
                decoration: BoxDecoration(
                  color: colorScheme.onTertiary,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: clear,
                        child: Text(
                          'Clear',
                          style: GoogleFonts.poppins(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: isButtonEnabled
                            ? () {
                                String pin = passwordController.text;
                                notifier.setPassword(pin);
                                Navigator.pop(context);
                                notifier.confirmationForLock();
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text('Confirm'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void clear() {
    passwordController.clear();
    confirmPasswordController.clear();
  }
}

class LockScreenTextField extends StatelessWidget {
  const LockScreenTextField({
    super.key,
    required this.controller,
    required this.colorScheme,
  });

  final TextEditingController controller;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      controller: controller,
      maxLength: 6,
      obscureText: true,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.center,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      keyboardType: const TextInputType.numberWithOptions(decimal: false),
      decoration: InputDecoration(
        counterText: '',
        filled: true,
        fillColor: Colors.grey.withOpacity(0.15),
        labelStyle: const TextStyle(color: Colors.red),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: colorScheme.primary,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class ScreenLockTitleFieldHeading extends StatelessWidget {
  const ScreenLockTitleFieldHeading(
    this.txt, {
    super.key,
  });
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$txt :',
          style: GoogleFonts.poppins(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
