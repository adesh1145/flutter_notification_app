// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification_app/firebase_messeging_service.dart';
import 'package:flutter_notification_app/flutter_local_notification.dart';
import 'package:flutter_notification_app/home_page.dart';
import 'package:get/get.dart';

int notificationCount = 0;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  print("1111111111111111111111111111111111111");
  WidgetsFlutterBinding.ensureInitialized();
  // try {
  //   await Firebase.initializeApp();
  // } catch (e) {
  //   print(e.toString());
  // }

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCA5LRDT_2QWThR4sx3oi9W_cu7ulkw1qo",
      appId: "1:933762820318:android:6085f93940d589890fba4f",
      messagingSenderId: "933762820318",
      projectId: "flutter-notification-app-e08dc",
      storageBucket: "flutter-notification-app-e08dc.appspot.com",
    ),
  );
  print("2222222222222222222222222222");
  await initializeLocalNotifications();
  Get.put(FirebaseMessagingService());
  print("33333333333333333333333333333333");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}



// void _configureFirebase() {
//   _firebaseMessaging.configure(
//     onMessage: (Map<String, dynamic> message) async {
//       // Handle notification when app is in foreground
//     },
//     onLaunch: (Map<String, dynamic> message) async {
//       // Handle notification when app is terminated
//       // Navigate to the desired route here
//     },
//     onResume: (Map<String, dynamic> message) async {
//       // Handle notification when app is in background
//       // Navigate to the desired route here
//     },
//   );
// }