import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:math' show Random;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

final _kLogName = 'NOTIFICATION-SVC';

final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
const MethodChannel _platform = MethodChannel('dexterx.dev/flutter_local_notifications_example');

final StreamController<String?> _selectNotificationStream = StreamController<String?>.broadcast();

/// A notification action which triggers a url launch event
const String _urlLaunchActionId = 'id_1';

/// A notification action which triggers a App navigation event
const String _navigationActionId = 'id_3';

/// Defines a iOS/MacOS notification category for text input actions.
const String _darwinNotificationCategoryText = 'textCategory';

/// Defines a iOS/MacOS notification category for plain actions.
const String _darwinNotificationCategoryPlain = 'plainCategory';

@pragma('vm:entry-point')
void _notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print(
    'notification(${notificationResponse.id}) action tapped: '
    '${notificationResponse.actionId} with'
    ' payload: ${notificationResponse.payload}',
  );
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print('notification action tapped with input: ${notificationResponse.input}');
  }
}

/// Notifications Details
NotificationDetails get _notificationDetails {
  const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
    'your other channel id',
    'your other channel name',
    channelDescription: 'your other channel description',
    sound: RawResourceAndroidNotificationSound('slow_spring_board'),
  );
  const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
    sound: 'slow_spring_board.aiff',
  );
  final LinuxNotificationDetails linuxPlatformChannelSpecifics = LinuxNotificationDetails(
    sound: AssetsLinuxSound('sound/slow_spring_board.mp3'),
  );
  return NotificationDetails(
    android: androidNotificationDetails,
    iOS: darwinNotificationDetails,
    macOS: darwinNotificationDetails,
    linux: linuxPlatformChannelSpecifics,
  );
}

/// Notifications Details for Alarm
NotificationDetails get _notificationDetailsAlarm {
  const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
    'alarm_clock_channel',
    'Alarm Clock Channel',
    channelDescription: 'Alarm Clock Notification',
    sound: RawResourceAndroidNotificationSound('slow_spring_board'),
    priority: Priority.high,
    importance: Importance.high,
    fullScreenIntent: true,
  );
  const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
    sound: 'slow_spring_board.aiff',
  );
  final LinuxNotificationDetails linuxPlatformChannelSpecifics = LinuxNotificationDetails(
    sound: AssetsLinuxSound('sound/slow_spring_board.mp3'),
  );
  return NotificationDetails(
    android: androidNotificationDetails,
    iOS: darwinNotificationDetails,
    macOS: darwinNotificationDetails,
    linux: linuxPlatformChannelSpecifics,
  );
}

Future<void> initializeFlutterLocalNotifications() async {
  log('initializeFlutterLocalNotifications');

  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings(
    '@mipmap/ic_launcher',
  );
  final DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings();
  final LinuxInitializationSettings initializationSettingsLinux = LinuxInitializationSettings(
    defaultActionName: 'Open notification',
  );
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
    macOS: initializationSettingsDarwin,
    linux: initializationSettingsLinux,
  );

  await _flutterLocalNotificationsPlugin.initialize(
    settings:  initializationSettings,
    onDidReceiveNotificationResponse: (details) {
      log("${details.payload}", name: _kLogName);
      switch (details.notificationResponseType) {
        case NotificationResponseType.selectedNotification:
          _selectNotificationStream.add(details.payload);
          break;
        case NotificationResponseType.selectedNotificationAction:
          if (details.actionId == _navigationActionId) {
            _selectNotificationStream.add(details.payload);
          }
          break;
      }
    },
    onDidReceiveBackgroundNotificationResponse: _notificationTapBackground,
  );
}

class NotificationService {
  Future<bool?> requestPermission() async {
    bool? result;
    if (Platform.isIOS) {
      result = await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);
      log('requestPermission [IOS] : $result', name: _kLogName);
    } else if (Platform.isMacOS) {
      result = await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);
      log('requestPermission [MacOS] : $result', name: _kLogName);
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation = _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

      result = await androidImplementation?.areNotificationsEnabled();
      // await androidImplementation?.requestPermission();
      log('requestPermission [Android] : $result', name: _kLogName);
    }

    return result;
  }

  static cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  // show
  static Future<int> show({String? title, String? message}) async {
    int id = Random().nextInt(10000);
    try {
      await _flutterLocalNotificationsPlugin.show(
        id: 0,
        title: title,
        body: message,
        notificationDetails: _notificationDetails,
      );
      log('notification show', name: _kLogName);
      return id;
    } catch (e) {
      log("Error at showNotification----------------------------", error: e, name: _kLogName);
      return -1;
    }
  }

  // schedule alarm
  Future<int> zonedScheduleAlarmClockNotification() async {
    // var tzDateTime = tz.TZDateTime.from(
    //     DateTime.now().add(const Duration(seconds: 5)), tz.local);
    int id = Random().nextInt(10000);
    try {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id: id,
        title: 'scheduled alarm clock title',
        body: 'scheduled alarm clock body',
        scheduledDate: tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        notificationDetails: _notificationDetailsAlarm,
        androidScheduleMode: AndroidScheduleMode.alarmClock,
      );
      return id;
    } catch (e) {
      log("Error at zonedScheduleNotification----------------------------", error: e, name: _kLogName);
      return -1;
    }
  }

  // alarm
  Future<void> showNotificationWithActions() async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction(
          _urlLaunchActionId,
          'Action 1',
          // icon: DrawableResourceAndroidBitmap('food'),
          contextual: true,
        ),
        AndroidNotificationAction(
          'id_2',
          'Action 2',
          titleColor: Color.fromARGB(255, 255, 0, 0),
          // icon: DrawableResourceAndroidBitmap('secondary_icon'),
        ),
        AndroidNotificationAction(
          _navigationActionId,
          'Action 3',
          // icon: DrawableResourceAndroidBitmap('secondary_icon'),
          showsUserInterface: true,
          // By default, Android plugin will dismiss the notification when the
          // user tapped on a action (this mimics the behavior on iOS).
          cancelNotification: false,
        ),
      ],
    );

    const DarwinNotificationDetails iosNotificationDetails = DarwinNotificationDetails(
      categoryIdentifier: _darwinNotificationCategoryPlain,
    );

    const DarwinNotificationDetails macOSNotificationDetails = DarwinNotificationDetails(
      categoryIdentifier: _darwinNotificationCategoryPlain,
    );

    const LinuxNotificationDetails linuxNotificationDetails = LinuxNotificationDetails(
      actions: <LinuxNotificationAction>[
        LinuxNotificationAction(key: _urlLaunchActionId, label: 'Action 1'),
        LinuxNotificationAction(key: _navigationActionId, label: 'Action 2'),
      ],
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
      macOS: macOSNotificationDetails,
      linux: linuxNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      id: Random().nextInt(10000),
      title: 'plain title',
      body: 'plain body',
      notificationDetails: notificationDetails,
      payload: 'item z',
    );
  }

  // reply message
  Future<void> showNotificationWithTextAction() async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction(
          'text_id_1',
          'Enter Text',
          // icon: DrawableResourceAndroidBitmap('food'),
          inputs: <AndroidNotificationActionInput>[AndroidNotificationActionInput(label: 'Enter a message')],
        ),
      ],
    );

    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      categoryIdentifier: _darwinNotificationCategoryText,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
      macOS: darwinNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      id: Random().nextInt(10000),
      title: 'Text Input Notification',
      body: 'Expand to see input action',
      notificationDetails: notificationDetails,
      payload: 'item x',
    );
  }

  // adzan
  Future<void> showSoundUriNotification() async {
    /// this calls a method over a platform channel implemented within the
    /// example app to return the Uri for the default alarm sound and uses
    /// as the notification sound
    final String? alarmUri = await _platform.invokeMethod<String>('getAlarmUri');
    final UriAndroidNotificationSound uriSound = UriAndroidNotificationSound(alarmUri!);
    final AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'uri channel id',
      'uri channel name',
      channelDescription: 'uri channel description',
      sound: uriSound,
      styleInformation: const DefaultStyleInformation(true, true),
    );
    final NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
      id: Random().nextInt(10000),
      title: 'uri sound title',
      body: 'uri sound body',
      notificationDetails: notificationDetails,
    );
  }

  // out of range
  Future<void> showInsistentNotification() async {
    // This value is from: https://developer.android.com/reference/android/app/Notification.html#FLAG_INSISTENT
    const int insistentFlag = 4;
    final AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      additionalFlags: Int32List.fromList(<int>[insistentFlag]),
    );
    final NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
      id: Random().nextInt(10000),
      title: 'insistent title',
      body: 'insistent body',
      notificationDetails: notificationDetails,
      payload: 'item x',
    );
  }

  // big picture
  Future<void> showBigPictureNotificationHiddenLargeIcon() async {
    const String largeIconPath = '';
    // await _downloadAndSaveFile('https://dummyimage.com/48x48', 'largeIcon');
    const String bigPicturePath = '';
    // await _downloadAndSaveFile('https://dummyimage.com/400x800', 'bigPicture');
    const BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath),
      hideExpandedLargeIcon: true,
      contentTitle: 'overridden <b>big</b> content title',
      htmlFormatContentTitle: true,
      summaryText: 'summary <i>text</i>',
      htmlFormatSummaryText: true,
    );
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'big text channel id',
      'big text channel name',
      channelDescription: 'big text channel description',
      largeIcon: FilePathAndroidBitmap(largeIconPath),
      styleInformation: bigPictureStyleInformation,
    );
    const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
      id: Random().nextInt(10000),
      title: 'big text title',
      body: 'silent body',
      notificationDetails: notificationDetails,
    );
  }

  // charging etc
  Future<void> showOngoingNotification() async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ongoing: true,
      autoCancel: false,
    );
    const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
      id: Random().nextInt(10000),
      title: 'ongoing notification title',
      body: 'ongoing notification body',
      notificationDetails: notificationDetails,
    );
  }

  // download on progress
  Future<void> showProgressNotification() async {
    final int progressId = Random().nextInt(10000);
    const int maxProgress = 5;
    for (int i = 0; i <= maxProgress; i++) {
      await Future<void>.delayed(const Duration(seconds: 1), () async {
        final AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
          'progress channel',
          'progress channel',
          channelDescription: 'progress channel description',
          channelShowBadge: false,
          importance: Importance.max,
          priority: Priority.high,
          onlyAlertOnce: true,
          showProgress: true,
          maxProgress: maxProgress,
          progress: i,
        );
        final NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
        await _flutterLocalNotificationsPlugin.show(
          id: progressId,
          title: 'progress notification title',
          body: 'progress notification body',
          notificationDetails: notificationDetails,
          payload: 'item x',
        );
      });
    }
  }

  // alarm
  Future<void> showNotificationWithAudioAttributeAlarm() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your alarm channel id',
      'your alarm channel name',
      channelDescription: 'your alarm channel description',
      importance: Importance.max,
      priority: Priority.high,
      audioAttributesUsage: AudioAttributesUsage.alarm,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
      id: 0,
      title: 'notification sound controlled by alarm volume',
      body: 'alarm notification sound body',
      notificationDetails: platformChannelSpecifics,
    );
  }

  // live location / live streaming
  Future<void> startForegroundServiceWithBlueBackgroundNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'color background channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      color: Colors.blue,
      colorized: true,
    );

    /// only using foreground service can color the background
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.startForegroundService(
          id: 1,
          title: 'colored background text title',
          body: 'colored background text body',
          notificationDetails: androidPlatformChannelSpecifics,
          payload: 'item x',
        );
  }

  Future<void> stopForegroundService() async {
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.stopForegroundService();
  }
}

// void showFlutterNotification({String? title, String? message}) async {
//   await _flutterLocalNotificationsPlugin.show(0, title, message, NotificationService().notificationDetails);
//   log('notification show', name: _kLogName);
// }
