import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit/widgets/my_title.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;
import '../../../../provider/theme_provider.dart';
import '../../../../utils/padding.dart';
import '../../../../widgets/my_list_tile.dart';

class SupportUs extends StatefulWidget {
  const SupportUs({super.key});

  @override
  State<SupportUs> createState() => _SupportUsState();
}

class _SupportUsState extends State<SupportUs> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: menuPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyText2(txt: 'Support us'),
              const SizedBox(height: 10),
              MyListTile(
                txt: 'Send Feedback',
                forwardIcon: true,
                iconData: CupertinoIcons.chat_bubble,
                onTap: () => sendFeedBack(context, size),
              ),
              MyListTile(
                txt: 'Rate us',
                forwardIcon: true,
                iconData: CupertinoIcons.star_fill,
                onTap: rateUs,
              ),
              MyListTile(
                txt: 'Share with friends',
                forwardIcon: true,
                iconData: CupertinoIcons.square_arrow_up,
                onTap: onShare,
              ),
              MyListTile(
                txt: 'More apps',
                forwardIcon: true,
                iconData: Icons.apps,
                onTap: moreApps,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Send FeedBack
  Future<void> sendFeedBack(BuildContext context, Size size) async {
    // MyProvider().playButtonClickSound('coo');
    // Obtain device information
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    var platformDispatcher = ui.PlatformDispatcher.instance;
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String deviceModel = '';
    String osVersion = '';
    String deviceId = '';
    String screenResolution = '';
    String language = '';
    String timezone = '';
    String processorType = '';
    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

        deviceModel = androidInfo.model;

        osVersion = androidInfo.version.release;
        deviceId = androidInfo.id;
        screenResolution =
            '${platformDispatcher.views.first.physicalSize.width}x${platformDispatcher.views.first.physicalSize.height}';
        language = await _getDeviceLanguage();
        timezone = await _getTimezone();
        processorType = androidInfo.hardware;
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceModel = iosInfo.utsname.machine;
        osVersion = iosInfo.systemVersion;
        deviceId = iosInfo.identifierForVendor ?? '-';
        screenResolution =
            '${platformDispatcher.views.first.physicalSize.width}x${platformDispatcher.views.first.physicalSize.height}';
        language = await _getDeviceLanguage();
        timezone = await _getTimezone();
        processorType = iosInfo.utsname.machine;
      }
    } catch (e) {
      // print('Error obtaining device info: $e');
    }

    // Construct email subject with device and app information
    String body =
        'From - Device: $deviceModel, OS Version: $osVersion, Device ID: $deviceId, Screen Resolution: $screenResolution, Language: $language, Timezone: $timezone, Processor: $processorType';
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'sathishwebdeveloper08032006@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'HabitUp Feedback',
        'body': body,
      }),
    );

    try {
      await launchUrl(emailLaunchUri).then((value) {
        customFloatingSnackBars('Appreciate your valuable contribution.');
      });
    } catch (e) {
      customFloatingSnackBars('Apologies, feedback couldn\'t be processed.');
    }
    // //
    // if (await canLaunchUrl(emailLaunchUri)) {
    // } else {}
  }

  // Rating
  void rateUs() {
    MyProvider().playButtonClickSound('coo');
  }

  // Share app
  void onShare() async {
    MyProvider().playButtonClickSound('coo');
    final result = await Share.shareWithResult(
        'Join me in optimizing routines, reaching goals, and fostering growth with our cutting-edge Habit Tracker app.');
    if (result.status == ShareResultStatus.success) {
      customFloatingSnackBars('Thanks for spreading motivation!');
    }
  }

  // more apps
  void moreApps() {
    MyProvider().playButtonClickSound('coo');
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<String> _getDeviceLanguage() async {
    var platformDispatcher = ui.PlatformDispatcher.instance;
    var locale = platformDispatcher.locale;
    return locale.toString();
  }

  Future<String> _getTimezone() async {
    DateTime now = DateTime.now();
    String timeZoneName = now.timeZoneName;
    Duration offset = now.timeZoneOffset;
    String offsetInHoursMinutes =
        '${offset.inHours >= 0 ? '+' : ''}${offset.inHours.abs().toString().padLeft(2, '0')}:${(offset.inMinutes.remainder(60)).abs().toString().padLeft(2, '0')}';
    return '$timeZoneName (GMT$offsetInHoursMinutes)';
  }

  void customFloatingSnackBars(text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
  }
}
