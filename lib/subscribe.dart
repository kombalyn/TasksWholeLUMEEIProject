import 'dart:convert';

import 'package:apptvshow/Navbar/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SubscriptionHandle extends StatefulWidget {
  final User user;
  const SubscriptionHandle({Key? key, required this.user}) : super(key: key);

  @override
  State<SubscriptionHandle> createState() => _SubscriptionHandleState();
}

class _SubscriptionHandleState extends State<SubscriptionHandle> {
  late WebSocketChannel channel;
  bool isSubscribed = false;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    initializeWebSocket();
  }

  Future<void> initializeWebSocket() async{
    setState(() {
      isLoading = true;
    });

    // TODO: token authentication, for example: final token = await widget.user.getIdToken();
    channel = WebSocketChannel.connect(Uri.parse('ws://104.155.99.100:8089'));


    // Listen for subscription state
    channel.stream.listen(
          (message) {
        final response = jsonDecode(message);
/* handling backend response:
        if (response['type'] == 'subscription_state') {
          setState(() {
            isSubscribed = response['isSubscribed'];
            isLoading = false;
          });
        } else if (response['type'] == 'error') {
          setState(() {
            errorMessage = response['message'];
            isLoading = false;
          });
        }
      },
      onError: (error) {
        setState(() {
          errorMessage = 'An error occurred: $error';
          isLoading = false;
        });
        */
      },
    );
    setState(() {
      isLoading = false;
    });
  }


  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (errorMessage != null) {
      return Scaffold(
        body: Center(child: Text('Error: $errorMessage')),
      );
    }

    if (isSubscribed) {
      return const MyHomePage(); // Show premium content if subscribed
    }
    /*return const Scaffold(
      body: Center(child: Text('Please Subscribe!')),
    );*/
    return const MyHomePage();
    //return SubscriptionOptionsWidget(channel: channel); // Show subscription options
  }
}
