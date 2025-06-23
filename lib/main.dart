// ignore_for_file: non_constant_identifier_names
import 'package:apptvshow/sqldb/dbModelView.dart';
import 'package:apptvshow/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

DBModelView dbModelView = Get.put(DBModelView());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InAppPurchase.instance.isAvailable().then((available) {
    if (!available) {
    }
  });

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  dbModelView.reddate();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(const MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
    );
  }
}
