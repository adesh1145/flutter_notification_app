// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, avoid_print

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification_app/main.dart';

Future<void> initializeLocalNotifications() async {
  //! Android Initialization
  const AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  //! IOS Initialization

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    defaultPresentAlert: true,
    defaultPresentBadge: true,
    defaultPresentSound: true,
    requestCriticalPermission: true,
    requestSoundPermission: true,
  );

  // ! Whole Initialization

  final InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (details) {
      print("Clicked");
    },
    onDidReceiveBackgroundNotificationResponse: selectNotification,
  );
}

Future<void> displayNotification({
  required String channelId,
  required String channelName,
  required String channelDesc,
  required int notificationId,
  required String notificationTittle,
  required String notificationBody,
  required String notificationPayload,
  String? soundfileNameInRawFolder,
}) async {
  // ! --AndroidNotificationDetails---
  print("IIIIIIIIIIIIIIIIIIIIIIIIIIIII");

  AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    channelId,
    channelName,
    channelDescription: channelDesc,
    channelAction: AndroidNotificationChannelAction.createIfNotExists,
    importance: Importance.max,
    priority: Priority.max,
    enableLights: true,
    visibility: NotificationVisibility.public,
    playSound: true,
    sound: soundfileNameInRawFolder == null
        ? null
        : RawResourceAndroidNotificationSound(soundfileNameInRawFolder),
  );
  // ! IosNotificationDetails
  DarwinNotificationDetails iosNotificationDetails = DarwinNotificationDetails(
    presentSound: true,
    presentBadge: true,
    presentAlert: true,
    threadIdentifier: 'thread_id',
  );
  NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails, iOS: iosNotificationDetails);
  print("JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ");

  print("KKKKKKKKKKKKKKKKKKKKKKKKKKKk");
  await flutterLocalNotificationsPlugin.show(
    notificationId,
    notificationTittle,
    notificationBody,
    notificationDetails,
    payload: notificationPayload,
  );
  print("LLLLLLLLLLLLLLLLLLLLLLLLLLLL");
}

@pragma('vm:entry-point')
void selectNotification(NotificationResponse? notificationResponse) async {
  print("Background Notificartion Clicked");
}
