// ignore_for_file: avoid_print, file_names, deprecated_member_use, avoid_unnecessary_containers

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:apptvshow/constant.dart';
import 'package:apptvshow/model/modelMovies.dart';
import 'package:apptvshow/model/modelch.dart';
import 'package:apptvshow/screen/tvShow.dart';
import 'package:apptvshow/videoplayer/flag.dart';
import 'package:apptvshow/videoplayer/intent.dart';
import 'package:device_apps/device_apps.dart';
import 'package:external_video_player_launcher/external_video_player_launcher.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ViewHome extends GetxController {
  late List<List<String>> parsedList;
  late WebSocketChannel _channel = WebSocketChannel.connect(
    Uri.parse('ws://104.155.99.100:8089'),
  );
  List<Channel> get catindex => _catindex;
  final List<Channel> _catindex = [];
  // Létrehozunk egy Completert
  Completer<void> completer_2 = Completer<void>();

  List<Posts> get moviesSlider => _moviesSlider;
  final List<Posts> _moviesSlider = [];

  List<Posts> get movieshome => _movieshome;
  final List<Posts> _movieshome = [];

  List<Channel> get lastch => _lastch;
  final List<Channel> _lastch = [];
  List<Channel> get series => _series;
  final List<Channel> _series = [];


  Future<void> setupWebSocket(String uri, String messageToSend, Function(String) onMessage) async {
    _channel = WebSocketChannel.connect(Uri.parse(uri));
    _channel.sink.add(messageToSend);
    _channel.stream.listen(
          (message) {
        onMessage(message);
        if (!completer_2.isCompleted) {
          completer_2.complete();
        }
        _channel.sink.close();
      },
      onError: (error) {
        if (!completer_2.isCompleted) {
          completer_2.completeError(error);
        }
        _channel.sink.close();
      },
      onDone: () {
        if (!completer_2.isCompleted) {
          completer_2.complete();
        }
      },
    );
  }

  Future sliderhome() async {
    var url = Uri.parse('$UrlApp$getmovies$count2$apikey');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List movis = [];
      movis.addAll(data["posts"]);

      for (int i = 0; i < movis.length; i++) {
        _moviesSlider.add(
          Posts(
              categoryId: movis[i]["category_id"],
              categoryName: movis[i]["category_name"],
              channelDescription: movis[i]["channel_description"],
              channelId: movis[i]["channel_id"],
              channelName: movis[i]["channel_name"],
              channelImage: movis[i]["channel_image"],
              channelType: movis[i]["channel_type"],
              channelUrl: movis[i]["channel_url"],
              userAgent: movis[i]["user_agent"],
              videoId: movis[i]["video_id"]),
        );
      }
    } else {
    }

    update();
  }

  List movis = [];
  Future moviesHomeapp() async {
    await setupWebSocket('ws://104.155.99.100:8089', "catitem|50", (message) {
      // A lista kinyerése a message stringből
      // A zárójelek szögletes zárójelekre cserélése
      String modifiedMessage =
      message.replaceAll('(', '[').replaceAll(')', ']');

      // Az egyes idézőjelek cseréje dupla idézőjelekre
      modifiedMessage = modifiedMessage.replaceAll("'", '"');

      // A lista kinyerése és listák listájává alakítása dinamikus típusokkal
      List<dynamic> parsedDynamicList = jsonDecode(modifiedMessage);

      // Minden belső lista átkonvertálása List<String>-gé
      parsedList = parsedDynamicList.map((dynamic innerList) {
        return List<String>.from(innerList);
      }).toList();

      for (int i = 0; i < parsedList.length; i++) {
        _movieshome.add(
          Posts(
              categoryId: 2,
              categoryName: parsedList[i][4],
              channelDescription: parsedList[i][5],
              channelId: 2,
              channelName: parsedList[i][0],
              channelImage: parsedList[i][
              1],
              channelType: "Tortenelem",
              channelUrl: parsedList[i][1],
              userAgent: "ali",
              videoId: parsedList[i][3]),
        );
      }

      update();
    });
  }

  /////
  Future lastChHome() async {
    await setupWebSocket('ws://104.155.99.100:8089', "catitem|50", (message) {
      // A lista kinyerése a message stringből
      // A zárójelek szögletes zárójelekre cserélése
      String modifiedMessage =
      message.replaceAll('(', '[').replaceAll(')', ']');

      // Az egyes idézőjelek cseréje dupla idézőjelekre
      modifiedMessage = modifiedMessage.replaceAll("'", '"');

      // A lista kinyerése és listák listájává alakítása dinamikus típusokkal
      List<dynamic> parsedDynamicList = jsonDecode(modifiedMessage);

      // Minden belső lista átkonvertálása List<String>-gé
      parsedList = parsedDynamicList.map((dynamic innerList) {
        return List<String>.from(innerList);
      }).toList();


      for (int i = 0; i < parsedList.length; i++) {
        _lastch.add(
          Channel(
              categoryId: 2,
              categoryName: parsedList[i][4],
              channelDescription: parsedList[i][5],
              channelId: 2,
              channelName: parsedList[i][0],
              channelImage: parsedList[i][
              1],
              channelType: "Tortenelem",
              channelUrl: parsedList[i][1],
              userAgent: "ali",
              videoId: parsedList[i][3]),
        );
      }

      update();
    });
  }

  Future seriesHome() async {
    var url = Uri.parse('$UrlApp$gettvseries$count3$apikey');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List ch = [];
      ch.addAll(data["posts"]);

      for (int i = 0; i < ch.length; i++) {
        _series.add(
          Channel(
              categoryId: 2,
              categoryName: parsedList[i][4],
              channelDescription: parsedList[i][5],
              channelId: 2,
              channelName: parsedList[i][0],
              channelImage: parsedList[i][
                  1],
              channelType: "Tortenelem",
              channelUrl: parsedList[i][1],
              userAgent: "ali",
              videoId: parsedList[i][3]),
        );
      }
    } else {

    }

    update();
  }

  bool? get asd => _asd;
  bool? _asd;

  getdata(String topic) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool('ahmed') == null) {
      _asd = true;
      if (_asd == true) {
        FirebaseMessaging.instance.subscribeToTopic(topic);
      } else {
        FirebaseMessaging.instance.unsubscribeFromTopic(topic);
      }
    } else {
      _asd = pref.getBool('ahmed')!;
      if (_asd == true) {
        FirebaseMessaging.instance.subscribeToTopic(topic);
      } else {
        FirebaseMessaging.instance.unsubscribeFromTopic(topic);
      }
    }

    update();
  }

  static launchWebVideoCasttt(
      String url, String? mime, Map<String, dynamic>? args) {
    if (Platform.isAndroid) {
      final intent = AndroidIntent(
        package: 'com.instantbits.cast.webvideo',
        type: mime ?? MIME.applicationXMpegURL,
        action: 'action_view',
        data: Uri.parse(url).toString(),
        arguments: args,
        flags: <int>[
          Flag.FLAG_ACTIVITY_NEW_TASK,
          Flag.FLAG_GRANT_PERSISTABLE_URI_PERMISSION
        ],
      );

      intent.launch();
    }
  }

  void checkVLCInstallation2(
    String url,
  ) async {
    bool isMXInstalled =
        await DeviceApps.isAppInstalled("com.instantbits.cast.webvideo");
    if (isMXInstalled) {
      launchWebVideoCasttt(url, MIME.applicationMp4, {});

      lisner = true;
    } else {
      Get.defaultDialog(
          title:
              "Web Video Cast is not installed on the device! \n install the application",
          content: Container(
            child: MaterialButton(
              color: Colors.yellow,
              textColor: Colors.black,
              onPressed: () async {
                await launch(appcast);
              },
              child: const Text("install App"),
            ),
          ));
    }
    update();
  }
}
