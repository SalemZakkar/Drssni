import 'package:darssni2/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance.requestPermission();
  FirebaseMessaging.onBackgroundMessage(handleMessage);
  runApp(const DrssniApp());
}

Future<void> handleMessage(remote) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
