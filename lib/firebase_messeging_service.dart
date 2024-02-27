// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification_app/flutter_local_notification.dart';
import 'package:get/get.dart';

import 'main.dart';

@pragma('vm:entry-point')
Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  (message.notification == null ||
          (message.notification!.title == null &&
              message.notification!.body == null))
      ? await temp(message)
      : null;
}

Future<void> temp(RemoteMessage message) async {
  String channelId = "Akkkkkkkkkkkkkkk",
      channelName = "Akkkkkkkkkkkkkkk",
      channelDesc = "Akkkkkkkkkkkkkkk";
  print("0000000000000000000000000000000000");

  print("111111111111111111111111111111111111");
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
    sound: const RawResourceAndroidNotificationSound("notification"),
  );
  // ! IosNotificationDetails
  DarwinNotificationDetails iosNotificationDetails =
      const DarwinNotificationDetails(
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
    notificationCount,
    message.data['title1'].toString(),
    message.data['body1'].toString(),
    notificationDetails,
  );
  print("LLLLLLLLLLLLLLLLLLLLLLLLLLLL");

  notificationCount++;
}

class FirebaseMessagingService extends GetxController {
  late FirebaseMessaging messaging;
  @override
  void onInit() async {
    super.onInit();
    messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print(await messaging.getToken());
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("OnMessage Listening...................");

      _handleMessage(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onMessageOpenedApp Listening...................");

      _handleMessage(message);
    });
  }

  Future<void> _handleMessage(RemoteMessage message) async {
    print("Message: ${message.data}");

    await displayNotification(
      channelId: "Akkkkkkkkkkkkkkk222",
      channelName: "Akkkkkkkkkkkkkkk222",
      channelDesc: "Akkkkkkkkkkkkkkk2222",
      notificationId: notificationCount,
      notificationTittle: message.data['title1'].toString(),
      notificationBody: message.data['body1'].toString(),
      notificationPayload: message.data['body1'].toString(),
      soundfileNameInRawFolder: "notification",
    );

    notificationCount++;
  }
}
