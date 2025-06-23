import 'package:apptvshow/Navbar/navbar.dart';
import 'package:apptvshow/login.dart';
import 'package:apptvshow/subscriptionOptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'authstate.dart';

class SubscriptionWebSocketService {
  final String url;
  late WebSocketChannel channel;

  SubscriptionWebSocketService(this.url);

  void connect(){
    channel = WebSocketChannel.connect(Uri.parse(url));
  }

  Stream<dynamic> get stream => channel.stream;

  void sendMessage(String message){
    channel.sink.add(message);
  }
  void disconnect() {
    channel.sink.close();
  }
}

class WebSocketSubscriptionPage extends StatelessWidget{
  const WebSocketSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AuthStateWidget(
      builder: (user){
        if(user == null) {
          return const Login();
        }
        return SubscriptionHandler(user: user);
    },
    );
  }
}

class SubscriptionHandler extends StatefulWidget {
  final User user;
  const SubscriptionHandler({Key? key, required this.user}) : super(key: key);


  @override
  State<SubscriptionHandler> createState() => _SubscriptionHandlerState();
}

class _SubscriptionHandlerState extends State<SubscriptionHandler> {
  late WebSocketChannel channel;
  bool isSubscribed = false;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    initializeWebSocket();
  }

  Future<void> initializeWebSocket() async {
    setState(() {
      isLoading = true;
    });

    final token = await widget.user.getIdToken();
    channel = WebSocketChannel.connect(
      Uri.parse('ws://104.155.99.100:8089'),
    );

    // Authenticate with WebSocket server
    channel.sink.add("issubscribed|${widget.user.email}");

    // Listen for subscription state
    channel.stream.listen(
          (message) {
            setState(() {
              isSubscribed = message == "True" ? true : false;
              isLoading = false;
            });
      },
      onError: (error) {
        setState(() {
          isLoading = false;
        });
        print('Error: $error');
      },
      onDone: () {
        print('WebSocket closed');
      },
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Center(
      child: isSubscribed == true
          ? const MyHomePage()
          : const SubscriptionOptions(),
    );
  }
}
