// import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit/provider/create_habit_provider.dart';

import 'package:habit/provider/theme_provider.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';

import 'model/habit.dart';
// import 'screens/home/home.dart';

import 'model/my_enum_for_model.dart';

import 'model/sub_item.dart';
import 'model/task.dart';
import 'provider/create_task_provider.dart';
import 'screens/splash/splash_screen.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();

  // Required enums type
  Hive.registerAdapter(EvaluationMethodTypeAdapter());
  Hive.registerAdapter(NumericAmountAdapter());
  Hive.registerAdapter(FrequencyAdapter());
  Hive.registerAdapter(WeekDaysAdapter());
  Hive.registerAdapter(MonthAdapter());
  Hive.registerAdapter(RankAdapter());
  Hive.registerAdapter(PeriodAdapter());
  Hive.registerAdapter(DoItAtPeroidAdapter());
  Hive.registerAdapter(TaskEvaluationMethodTypeAdapter());
  // sub items type
  Hive.registerAdapter(SubItemsAdapter());
  // habit type
  Hive.registerAdapter(HabitAdapter());
  // For task type
  Hive.registerAdapter(TaskAdapter());
  // DB
  await Hive.openBox<Habit>('habit');
  await Hive.openBox<Task>('task');

  // await Alarm.init(showDebugLogs: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyProvider()..init(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreateHabit(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreateTask(),
        ),
      ],
      child: Consumer<MyProvider>(
        builder: (context, MyProvider notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Habit Tracker',
            themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: darkMode(notifier),
            theme: lightMode(notifier),
            home: const SplashScreen(),
            builder: (context, child) {
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.onTertiary,
                  systemNavigationBarIconBrightness:
                      notifier.isDark ? Brightness.light : Brightness.dark,
                  statusBarIconBrightness:
                      notifier.isDark ? Brightness.light : Brightness.dark,
                ),
              );
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1.0),
                ),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
