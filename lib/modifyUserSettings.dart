import 'dart:io';

import 'package:apptvshow/auth.dart';
import 'package:apptvshow/color/colorapp.dart';
import 'package:apptvshow/widget/profil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ModifyUserSetting extends StatefulWidget {
  final Function setMenuState;
  const ModifyUserSetting({super.key, required this.setMenuState});

  @override
  State<ModifyUserSetting> createState() => _ModifyUserSettingState();
}

class _ModifyUserSettingState extends State<ModifyUserSetting> {
  String? _userEmail = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // retrieve email
  Future<void> _getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUserEmail = prefs.getString('useremail');
    setState(() {
      _userEmail = savedUserEmail;
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserEmail();
  }

  Future<void> passwordReset() async {
    await Auth().sendPasswordResetEmail(email: '$_userEmail');
  }

  Future<void> _openSubscriptions() async {
    String? url;

    // Determine the URL based on the platform
    if (Platform.isAndroid) {
      url = "https://play.google.com/store/account/subscriptions";
    } else if (Platform.isIOS) {
      url = "appstore://subscriptions";
    }

    if (url != null && await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch subscriptions page';
    }
  }

  Future<void> _showDeleteDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Fiók törlése"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Jelszó"),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Mégse"),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Bezárja a dialógust
                await _reauthenticateAndDelete();
              },
              child: const Text("Törlés"),
            ),
          ],
        );
      },
    );
  }
  Future<void> _reauthenticateAndDelete() async {
    try {
      User? user = Auth().currentUser;
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Újra-hitelesítés
        await user.reauthenticateWithCredential(credential);

        // Felhasználó törlése
        await user.delete();

        // Sikeres törlés üzenet
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Felhasználó sikeresen törölve!")),
        );
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Hiba történt: $e")),
      );
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: ColorApp.bgHome,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const UserProfile(),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      border: const Border.fromBorderSide(
                          BorderSide(
                            width: 1.5,
                            color: Colors.black,
                          )
                      )
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 205,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Már csak 0 pontra vagy attól, hogy folytasd a kedvenc játékod!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Row(children: [
                                const Text("Eddigi pontjaid száma: 0 ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Container(
                                  height: 13,
                                  width: 13,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(255, 215, 0, 1)),
                                  child: const Icon(Icons.stars,
                                    color: Color.fromRGBO(255, 171, 0, 1),
                                    size: 13,
                                  ),
                                )
                              ]
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: Image.asset(
                            "images/lumeei_coins.png",
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(15), // Customize the radius
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Jelszó módosítása'),
                            content: const Text('Ennek megerősítésével egy jelszó módosító email lesz küldve felhasználói email címre.\nBiztos, hogy folytatod?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Mégse'),
                              ),
                              TextButton(
                                onPressed: passwordReset,
                                child: const Text('Igen!'),
                              ),
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const ContinuousRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          padding: EdgeInsets.zero,
                          foregroundColor: Colors.transparent,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    children: [
                                      Icon(
                                        Icons.lock_reset,
                                        color: Colors.black87,
                                      ),
                                      SizedBox(width: 10,),
                                      Text("Jelszó módosítása",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ]
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 35,
                                  color: Colors.black87,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _openSubscriptions,
                        style: ElevatedButton.styleFrom(
                          shape:  const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    children: [
                                      Icon(
                                        Icons.subscriptions,
                                        color: Colors.black87,
                                      ),
                                      SizedBox(width: 10,),
                                      Text("Feliratkozás kezelése",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ]
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 35,
                                  color: Colors.black87,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _showDeleteDialog,
                        style: ElevatedButton.styleFrom(
                          shape: const ContinuousRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          padding: EdgeInsets.zero,
                          foregroundColor: Colors.transparent,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    children: [
                                      Icon(
                                        Icons.delete_forever,
                                        color: Colors.black87,
                                      ),
                                      SizedBox(width: 10,),
                                      Text("Felhasználó törlése",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ]
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 35,
                                  color: Colors.black87,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
