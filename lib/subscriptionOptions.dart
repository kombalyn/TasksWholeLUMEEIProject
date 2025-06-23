import 'dart:async';
import 'dart:io';
import 'package:apptvshow/Navbar/navbar.dart';
import 'package:apptvshow/aSZF.dart';
import 'package:apptvshow/auth.dart';
import 'package:apptvshow/color/colorapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';

class SubscriptionOptions extends StatefulWidget {
  const SubscriptionOptions({super.key});

  @override
  State<SubscriptionOptions> createState() => _SubscriptionOptionsState();
}

class _SubscriptionOptionsState extends State<SubscriptionOptions> {
  final InAppPurchase _iap = InAppPurchase.instance;
  bool _available = true;
  List<ProductDetails> _products = [];
  final List<PurchaseDetails> _purchases = [];
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  bool _loading = true;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    final Stream<List<PurchaseDetails>> purchaseUpdated = _iap.purchaseStream;
    _subscription = purchaseUpdated.listen(
      (List<PurchaseDetails> purchaseDetailsList) {
        _listenToPurchaseUpdated(purchaseDetailsList);
      },
      onDone: () {
        _subscription.cancel();
      },
      onError: (Object error) {
        // Handle error here.
      },
    );
    _initializeIAP();
  }

  void _initializeIAP() async {
    _available = await _iap.isAvailable();

    if (_available) {
      const Set<String> kIds = <String>{
        'lumeei_5900ft_1m',
        'lumeei_59900ft_1y',
        'lumeeitest_99ft_1m'
      };
      final ProductDetailsResponse response =
          await _iap.queryProductDetails(kIds);

      if (response.notFoundIDs.isNotEmpty) {
        //print('Products not found : ${response.notFoundIDs}');
      }

      setState(() {
        _products = response.productDetails;
        _loading = false;
      });
    }
  }

  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      //print("PRODUCT_ID: ${purchaseDetails.productID}");
      if (Platform.isAndroid) {
        if (purchaseDetails.pendingCompletePurchase) {
          await _iap.completePurchase(purchaseDetails);
          await _verifyPurchase(purchaseDetails);
        }
      }
    }
  }

  Future<void> _verifyPurchase(PurchaseDetails purchaseDetails) async {
    const url =
        'http://104.155.99.100:5000/verify_subscription'; // Replace with your Flask server IP and port
    //print("PURCHASEDETAILS: ${purchaseDetails.productID}");
    final Map<String, dynamic> purchaseData = {
      'packageName':
          'com.lumeeikft.lumeei_test', // Replace with your app's package name
      'subscriptionId': purchaseDetails.productID,
      'purchaseToken': purchaseDetails.verificationData
          .serverVerificationData, // Token received from the purchase
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(purchaseData),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      if (result['status'] == 'Subscription is valid') {
        //print('Purchase verified successfully');
        // Unlock the purchased feature for the user
      } else {
        //print('Invalid purchase');
      }
    } else {
      //print('Verification failed: ${response.body}');
    }
    //print("PURCHASE VÉGE");
  }

  String subId = "lumeeitest_99ft_1m";

  ButtonStyle inactiveButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    side: const BorderSide(
      width: 0.5,
      color: Colors.black38,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

  ButtonStyle activeButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: ColorApp.bgHome,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

  Color inactiveSubTextColor = Colors.black54;
  Color activeSubTextColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 550;

    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          return SystemNavigator.pop();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: ColorApp.bgHome,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(
                'images/LUMEEI_logó.jpg',
                width: 50,
                height: 50,
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () async {
                    await Auth().signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorApp.bgHome,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(
                      width: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  child: const Text("Kijelentkezés"),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(isSmallScreen ? 10 : 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                              "Fejezd be a regisztrációt, és kezdd el használni",
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: isSmallScreen ? 22 : 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: isSmallScreen ? 15 : 20,),
                              Text(
                                "Majdnem kész! Az alábbi gombra kattintva tudod befejezni a regisztrációt a(z)",
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: isSmallScreen ? 16 : 20,
                                  )
                                ),
                              ),
                              Text("${Auth().currentUser?.email}",
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: isSmallScreen ? 16 : 20,
                                    )
                                ),
                              ),
                              Text("e-mail címhez.",
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: isSmallScreen ? 16 : 20,
                                  )
                                ),
                              ),
                              SizedBox(height: isSmallScreen ? 30 : 35,),
                              Text("Már csupán néhány lépés választ el a játékos tanulás megkezdésétől.",
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: isSmallScreen ? 16 : 20,
                                    )
                                ),
                              ),
                            ]
                          ),
                          SizedBox(height: isSmallScreen ? 20: 30),
                          Text("Kattints a gombra és kövesd a megjelenő utasításokat.",
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: isSmallScreen ? 10 : 14,
                                )
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 15,
                                  offset: Offset(0, -1),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: ()  {
                                  Navigator.pushNamed(context, '/home');
                                },

                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorApp.bgHome,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: SizedBox(
                                width: isSmallScreen
                                    ? screenWidth * 0.6
                                    : screenWidth * 0.4,
                                height: screenHeight * 0.06,
                                child: Center(
                                  child: Text(
                                    "Regisztráció befejezése",
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: isSmallScreen ? 16 : 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionButton(
    String subId,
    String label,
    double screenWidth,
    Widget customLabel,
  ) {
    final isActive = this.subId == subId;
    return SizedBox(
      width: screenWidth * 0.35,
      height: screenWidth < 550 ? screenWidth * 0.4 : screenWidth * 0.35,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            this.subId = subId;
          });
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: isActive ? ColorApp.bgHome : Colors.black38,
              width: isActive ? 3.0 : 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              SizedBox(
                width:
                    screenWidth < 550 ? screenWidth * 0.25 : screenWidth * 0.2,
                height:
                    screenWidth < 550 ? screenWidth * 0.1 : screenWidth * 0.08,
                child: Card(
                  color: isActive ? ColorApp.bgHome : Colors.white,
                  child: SizedBox(
                    width: 70,
                    child: Center(
                      child: Text(
                        label,
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: isActive
                                ? activeSubTextColor
                                : inactiveSubTextColor,
                            fontSize: screenWidth < 550 ? 13 : 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              customLabel,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _buyProduct() async {
    final productDetails = _products.firstWhere(
      (element) => element.id == subId,
    );
    final PurchaseParam purchaseParam =
        PurchaseParam(productDetails: productDetails);
    _iap.buyNonConsumable(purchaseParam: purchaseParam);
  }

  Future<void> _sendSubscription(String subsType) async {
    WebSocketChannel channel = WebSocketChannel.connect(
      Uri.parse('ws://104.155.99.100:8089'),
    );

    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      //print("YOU ARE A BOLD ONE!");
      if (account != null) {
        //print("Signed in as: ${account.email}");
        channel.sink.add(
            "subscribe_with_platform|${account.email}|$subsType|${Platform.operatingSystem}");
        //print("Message sent to backend: subscribe|${account.email}|$subsType|${Platform.operatingSystem}");
        channel.stream.listen((message) {
          //print("FELIRATKOZÁSI STÁTUSZ: $message");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyHomePage()));
          channel.sink.close();
        });
      } else {
        //print("User canceled the sign-in process.");
      }
    } catch (error) {
      //print("Error during Google Sign-In: $error");
    }
  }

  Future<void> testGoogleSignIn() async {
    //print("HELLOOOO THERE");
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    //print("GENERAL KENOBI");
    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      //print("YOU ARE A BOLD ONE!");
      if (account != null) {
        //print("Signed in as: ${account.email}");
      } else {
        //print("User canceled the sign-in process.");
      }
    } catch (error) {
      //print("Error during Google Sign-In: $error");
    }
  }
}
