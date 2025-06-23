import 'package:apptvshow/Navbar/navbar.dart';
import 'package:apptvshow/aSZF.dart';
import 'package:apptvshow/constant.dart';
import 'package:apptvshow/forgottenPassword.dart';
import 'package:apptvshow/login.dart';
import 'package:apptvshow/quizz/quizz_screen.dart';
import 'package:apptvshow/register.dart';
import 'package:apptvshow/screen/tvapp.dart';
import 'package:apptvshow/services/subscriptionservice.dart';
import 'package:apptvshow/subscriptionOptions.dart';
import 'package:apptvshow/videoplayer/playerYoutube.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const WebSocketSubscriptionPage(),
  '/login': (context) => const Login(),
  '/signup': (context) => const Register(),
  '/aszf': (context) => const Aszf(),
  '/forgottenpw': (context) => const ForgottenPassword(),
  '/subscribe': (context) => const SubscriptionOptions(),
  '/videoplayer': (context) => const YouTubePlayer(videoUrl: videoId,),
  '/tvapp': (context) => TvApp(),
  '/home': (context) => const MyHomePage(),
  '/quizz': (context) => const QuizScreen(),
};
