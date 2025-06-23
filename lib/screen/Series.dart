import 'package:apptvshow/auth.dart';
import 'package:apptvshow/color/colorapp.dart';
import 'package:apptvshow/faq.dart';
import 'package:apptvshow/login.dart';
import 'package:apptvshow/modifyUserSettings.dart';
import 'package:apptvshow/widget/profil.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SeriesApp extends StatefulWidget {
  final Function setMenuState;
  const SeriesApp({super.key, required this.setMenuState});

  @override
  State<SeriesApp> createState() => _SeriesAppState();
}

class _SeriesAppState extends State<SeriesApp> {
  Future<void> signOut() async {
    await Auth().signOut();
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }

  Future<void> launchEmail(
      {required String toEmail, String? subject, String? body}) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      query: {
        'subject': subject ?? '',
        'body': body ?? '',
      }
          .entries
          .map((e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&'),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      //print('Could not launch $emailUri'); // For debugging purposes
      throw 'Could not launch $emailUri';
    }
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 360;

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
                      border: const Border.fromBorderSide(BorderSide(
                        width: 1.5,
                        color: Colors.black,
                      ))),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  fontSize: 12,
                                ),
                              ),
                              Row(children: [
                                const Text(
                                  "Eddigi pontjaid száma: 0 ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                  ),
                                ),
                                Container(
                                  height: 13,
                                  width: 13,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(255, 215, 0, 1)),
                                  child: const Icon(
                                    Icons.stars,
                                    color: Color.fromRGBO(255, 171, 0, 1),
                                    size: 13,
                                  ),
                                )
                              ])
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
                  )),
              Container(
                margin: EdgeInsets.all(isSmallScreen ? 25 : 20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius:
                        BorderRadius.circular(15), // Customize the radius
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          widget.setMenuState(ModifyUserSetting(
                            setMenuState: widget.setMenuState,
                          ));
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const Faq()));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const ContinuousRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          padding: EdgeInsets.zero,
                          foregroundColor: Colors.transparent,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, top: 10, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: EdgeInsets.all(isSmallScreen ? 8 : 10),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.manage_accounts,
                                    color: Colors.black87,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Fiók adatainak módosítása",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                    ),
                                  ),
                                ]),
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
                        onPressed: () => launchEmail(
                          toEmail: 'lumeei@gmail.com',
                          subject: 'kérdés Lumeei ügyfélszolgálatáshoz',
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, top: 5, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: EdgeInsets.all(isSmallScreen ? 8 : 10),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.sms,
                                    color: Colors.black87,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Lépj velünk kapcsolatba",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                    ),
                                  ),
                                ]),
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
                        onPressed: () {
                          widget.setMenuState(Faq(
                            setMenuState: widget.setMenuState,
                          ));
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const Faq()));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, top: 5, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: EdgeInsets.all(isSmallScreen ? 8 : 10),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.help,
                                    color: Colors.black87,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Gyakran Ismételt kérdések",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                    ),
                                  ),
                                ]),
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
                        onPressed: signOut,
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, top: 5, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: EdgeInsets.all(isSmallScreen ? 8 : 10),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.logout,
                                    color: Colors.black87,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Kijelentkezés",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                    ),
                                  ),
                                ]),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 35,
                                  color: Colors.black87,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
