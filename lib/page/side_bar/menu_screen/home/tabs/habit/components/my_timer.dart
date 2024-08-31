// import 'package:alarm/alarm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../utils/padding.dart';
import '../../../../../../../widgets/custom_header_title.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key, required this.durationInSec});
  final int durationInSec;
  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen>
    with SingleTickerProviderStateMixin {
  final CountDownController _controller = CountDownController();
  late AnimationController _animationController;
  bool isPlay = true;
  bool isReset = true;
  bool flag = true;
  Duration counterDuration = const Duration(seconds: 0);
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: homePadding(),
            child: Column(
              children: [
                const CustomHeaderTitleWithBack(),
                const SizedBox(height: 10),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.timer_rounded,
                            color: colorScheme.primary,
                            size: size.width * 0.12,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Time',
                            style: GoogleFonts.poppins(
                              fontSize: size.width / 25,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            getTilteFormatDuration(
                              Duration(seconds: widget.durationInSec),
                            ),
                            style: GoogleFonts.poppins(
                              fontSize: size.width / 15,
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onBackground,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CircularCountDownTimer(
                      // duration: 10,
                      duration: widget.durationInSec,
                      initialDuration: 0,
                      controller: _controller,
                      width: size.width * 0.7,
                      height: size.height * 0.45,
                      ringColor: colorScheme.primary.withOpacity(0.2),
                      fillColor: colorScheme.primary,
                      backgroundGradient: null,
                      strokeWidth: size.width * 0.14,
                      strokeCap: StrokeCap.round,
                      textFormat: CountdownTextFormat.S,
                      isReverse: false,
                      isReverseAnimation: false,
                      isTimerTextShown: true,
                      autoStart: false,

                      onChange: (String timeStamp) {
                        debugPrint('Countdown Changed $timeStamp');
                      },
                      timeFormatterFunction:
                          (defaultFormatterFunction, duration) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          setState(() {
                            counterDuration = duration;
                          });
                        });

                        if (duration ==
                                Duration(seconds: widget.durationInSec) &&
                            flag) {
                          flag = false;
                          Navigator.of(context).pop(true);
                        }
                      },
                    ),
                  ],
                ),
                Text(
                  getFormatDuration(counterDuration),
                  style: GoogleFonts.poppins(
                    fontSize: size.width / 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                if (_controller.isResumed) {
                  _controller.pause();
                  _animationController.reverse();
                  setState(() {
                    isReset = true;
                  });
                } else {
                  _controller.resume();
                  _animationController.forward();
                  setState(() {
                    isReset = false;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.primary,
                ),
                child: Center(
                  child: AnimatedIcon(
                    icon: AnimatedIcons.play_pause,
                    size: size.width / 10,
                    progress: _animationController,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: isReset
                      ? () {
                          _controller.reset();
                        }
                      : null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: isReset
                          ? colorScheme.primary
                          : colorScheme.primary.withOpacity(0.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 17,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Reset',
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: colorScheme.primary,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.check_mark,
                            color: Colors.white,
                            size: 17,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Finish',
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> myAlram() async {
    // final AlarmSettings alarmSettings = AlarmSettings(
    //   id: 42,
    //   dateTime: DateTime.now().add(Duration(seconds: 2)),
    //   assetAudioPath: 'assets/sound/finish.mp3',
    //   loopAudio: true,
    //   vibrate: true,
    //   volume: 0.8,
    //   fadeDuration: 3.0,
    //   notificationTitle: 'This is the title',
    //   notificationBody: 'This is the body',
    //   enableNotificationOnKill: true,
    // );
    // await Alarm.set(alarmSettings: alarmSettings);
    // await Alarm.setNotificationOnAppKillContent('title', 'body');
    // await Alarm.stop(42);
  }
}

String getFormatDuration(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

String getTilteFormatDuration(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  if (duration.inHours == 0) {
    return "$twoDigitMinutes mins";
  }
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes ${duration.inHours > 1 ? 'hrs' : 'hr'}";
}
