import 'package:fcm_test/ui/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:flutter_notification_channel/notification_visibility.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initFCM();
  runApp(const MyApp());
}

_initFCM() async {
  var result = await FlutterNotificationChannel.registerNotificationChannel(
    description: 'FCM Channel',
    id: 'fcm_test_channel',
    importance: NotificationImportance.IMPORTANCE_HIGH,
    name: 'FCM Test Channel',
    visibility: NotificationVisibility.VISIBILITY_PUBLIC,
    allowBubbles: true,
    enableVibration: true,
    enableSound: true,
    showBadge: true,
  );
  print('Channel created: $result');
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  String? token = await messaging.getToken(
    vapidKey: "BGpdLRs......",
  );
  // ignore: avoid_print
  print('User granted permission: ${settings.authorizationStatus}');
  // ignore: avoid_print
  print('User token: $token');
}
