import 'package:apptvshow/Navbar/navbar.dart';
import 'package:apptvshow/services/subscriptionservice.dart';
import 'package:apptvshow/subscriptionOptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          print('Auth state change: ${snapshot.connectionState}, ${snapshot.hasData}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('loading'));
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            print('USER LOGGED IN: ${snapshot.data?.email}');
            //return const MyHomePage();
            return StreamBuilder(
                stream: SubscriptionWebSocketService('ws://34.72.67.6:8089').stream,
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    print("WAITING");
                    return const CircularProgressIndicator();
                  }
                  else if(snapshot.hasError){
                    print("E R R O R");
                    return Text("Error: ${snapshot.error}");
                  }
                  else if(snapshot.hasData){
                    print("USER IS SUBSCRIBED!");
                    return const MyHomePage();
                  } else {
                    print("USER IS NOT SUBSCRIBED YET!");
                    return const SubscriptionOptions();
                  }
                }
            );
          } else {
            print('No user logged in.');
            return const Login();
          }
        });
  }

/*
  @override
  void dispose() {
    super.dispose();
    _channel.sink.close();
  }

  Future<bool> checkSubscription() async{
    WebSocketChannel channel = WebSocketChannel.connect(
      //Uri.parse('ws://34.72.67.6:8089'),
      Uri.parse('ws://104.155.99.100:8089'),
    );

    bool hasValidSubscription = false;

    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      //print("YOU ARE A BOLD ONE!");
      if (account != null) {
        //print("Signed in as: ${account.email}");
        channel.sink.add("issubscribed|${account.email}");
        //print("Message sent to backend: issubscribed|${account.email}");
        channel.stream.listen(
                (message) {
              //print("VAN_E ÖNNEK FELIRATKOZÁSA : $message");
              hasValidSubscription = message == "True" ? true : false;
            });
      } else {
        //print("User canceled the sign-in process.");
      }
    } catch (error) {
      //print("Error during Google Sign-In: $error");
    }
    //print("VISSZATÉRÉSI ÉRTÉK: $hasValidSubscription");
    return hasValidSubscription;
  }*/
}
