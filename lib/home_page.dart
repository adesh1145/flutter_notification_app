// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_notification_app/flutter_local_notification.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RxInt count = 1.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(" Flutter Notification"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Fix Channel Notification"),
            ElevatedButton(
                onPressed: () {
                  print("Count Value: ${count.value}");
                  displayNotification(
                      channelId: "channel_",
                      channelName: "channel_name_",
                      channelDesc: "channel_desc_",
                      notificationId: count.value,
                      notificationTittle: "Notification Tittle_",
                      notificationBody: "Notification Body_",
                      soundfileNameInRawFolder:
                          count.value % 2 == 1 ? "notification" : null,
                      notificationPayload: "Payload");
                  count.value += 1;
                },
                child: Text("Fix Channel Notification")),
            ElevatedButton(
                onPressed: () {
                  print("Count Value: ${count.value}");
                  displayNotification(
                      channelId: "channel_${count.value}",
                      channelName: "channel_name_${count.value}",
                      channelDesc: "channel_desc_${count.value}",
                      notificationId: count.value,
                      notificationTittle: "Notification Tittle_${count.value}",
                      notificationBody: "Notification Body_${count.value}",
                      soundfileNameInRawFolder:
                          count.value % 2 == 1 ? "notification" : null,
                      notificationPayload: "Payload");
                  count.value += 1;
                },
                child: Text("Pressed Count")),
            ElevatedButton(
                onPressed: () {
                  var count = 1.obs;
                  print("Count Value: ${count.value}");
                  displayNotification(
                      channelId: "channel_${count.value}",
                      channelName:
                          "channel_name_${count.value}_${count.value % 2 == 0 ? "Notification" : "Default"}",
                      channelDesc: "channel_desc_${count.value}",
                      notificationId: count.value,
                      notificationTittle: "Notification Tittle_${count.value}",
                      notificationBody: "Notification Body_${count.value}",
                      soundfileNameInRawFolder:
                          count.value % 2 == 0 ? "notification" : null,
                      notificationPayload: "Payload");
                  count.value += 1;
                },
                child: Text("Pressed 1")),
            ElevatedButton(
                onPressed: () {
                  var count = 2.obs;
                  print("Count Value: ${count.value}");
                  displayNotification(
                      channelId: "channel_${count.value}",
                      channelName: "channel_name_${count.value}",
                      channelDesc: "channel_desc_${count.value}",
                      notificationId: 1,
                      notificationTittle: "Notification Tittle_${count.value}",
                      notificationBody: "Notification Body_${count.value}",
                      soundfileNameInRawFolder: "notification",
                      notificationPayload: "Payload");
                  count.value += 1;
                },
                child: Text("Pressed 2"))
          ],
        ),
      ),
    ));
  }
}
