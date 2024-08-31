import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  bool _isDark = false;
  int _accentClrIndex = 0;
  int _dateTimeIndex = 0;
  bool _isClickSound = false;
  bool _isLockScreen = false;
  String _password = '';

  bool get isDark => _isDark;
  int get accentClrIndex => _accentClrIndex;
  int get dateTimeIndex => _dateTimeIndex;
  bool get isClickSound => _isClickSound;
  bool get isLockScreen => _isLockScreen;
  String get password => _password;

  late SharedPreferences storage;
  Future<void> playButtonClickSound(String type, {ex = 'wav'}) async {
    storage = await SharedPreferences.getInstance();

    try {
      final player = AudioPlayer();
      if (type != 'coo') {
        await player.play(
          AssetSource('sound/$type.$ex'),
        );
      } else if (storage.getBool('isClickSound') ?? false) {
        await player.play(AssetSource('sound/coo.wav'));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Toggle Button
  changeTheme() {
    _isDark = !_isDark;
    storage.setBool('isDark', _isDark);
    notifyListeners();
  }

  changeAccentColorIndex(int clrIndex) async {
    storage.setInt('accentClrIndex', clrIndex);
    _accentClrIndex = storage.getInt('accentClrIndex') ?? 0;
    notifyListeners();
  }

  changeDateTimeMethod(index) async {
    storage.setInt('dateTimeMethod', index);
    _dateTimeIndex = storage.getInt('dateTimeMethod') ?? 0;
    notifyListeners();
  }

  confirmationForClickSound() async {
    _isClickSound = !_isClickSound;
    storage.setBool('isClickSound', _isClickSound);
    notifyListeners();
  }

  confirmationForLock() {
    _isLockScreen = !_isLockScreen;
    storage.setBool('isLockScreen', _isLockScreen);
    notifyListeners();
  }

  setPassword(String newPassword) {
    storage.setString('password', newPassword);
    notifyListeners();
  }

  // Init method of provider
  init() async {
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool('isDark') ?? false;
    _accentClrIndex = storage.getInt('accentClrIndex') ?? 0;
    _dateTimeIndex = storage.getInt('dateTimeMethod') ?? 0;
    _isClickSound = storage.getBool('isClickSound') ?? false;
    _isLockScreen = storage.getBool('isLockScreen') ?? false;
    _password = storage.getString('password') ?? '';
    notifyListeners();
  }
}
