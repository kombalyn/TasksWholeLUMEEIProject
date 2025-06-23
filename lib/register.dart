
import 'package:apptvshow/color/colorapp.dart';
import 'package:apptvshow/functions/errordialog.dart';
import 'package:apptvshow/modelview/viewHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  ViewHome viewHome = Get.put(ViewHome());
  final GlobalKey<FormState> _regFormKey = GlobalKey<FormState>();

  String? errorMessage = '';
  bool isTaSAccepted = false;
  Color colorTaS = Colors.white;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    var success = false;

    // Alapértelmezett hibakezelés: üres mezők
    if (_controllerEmail.text.trim().isEmpty) {
      setState(() {
        errorMessage = 'Kérlek add meg az e-mail címed!';
      });
      dialogBuilder(context, errorMessage);
      return;
    }

    if (_controllerPassword.text.isEmpty) {
      setState(() {
        errorMessage = 'Kérlek adj meg egy jelszót!';
      });
      dialogBuilder(context, errorMessage);
      return;
    }
    if (isTaSAccepted) {
      try {
        success = await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text.trim(),
          password: _controllerPassword.text,
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
        print("H I B A: ${e.code}");
        switch (e.code) {
          case 'invalid-email':
            errorMessage = 'Hibás e-mail cím formátum.';
            break;
          case 'email-already-in-use':
            errorMessage = 'Az email címmel már foglalt, jelentkezz be vele vagy regisztrálj másikkal!';
            break;
          case 'weak-password':
            errorMessage = 'A jelszavad túl gyenge. Minimum 6 karakter szükséges.';
            break;
          case 'network-request-failed':
            errorMessage = 'Nincs internetkapcsolat. Kérlek, csatlakozz a hálózathoz!';
            break;
          default:
            errorMessage = 'Hiba történt: ${e.message}';
        }
          dialogBuilder(context, errorMessage);
        });
      } catch (e) {
        setState(() {
          errorMessage = 'Ismeretlen hiba történt. Próbáld újra később.';
        });
        dialogBuilder(context, errorMessage);
      }
    } else {
      setState(() {
        colorTaS = Colors.red;
      });
    }
    if(success) Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorApp.bgHome, // Same color as app background
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 550;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp.bgHome,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/LUMEEI_logó.jpg',
                    width: isSmallScreen ? screenWidth * 0.35 : screenWidth * 0.45,
                  ),
                  Text(
                    'LUMEEI',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: isSmallScreen ? 52 : 72,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Fiók Létrehozása',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: isSmallScreen ? 16 : 20,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                    child: Text(
                      'Már van fiókod? Bejelentkezés itt.',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: isSmallScreen ? 14 : 18,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Form(
                    key: _regFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: isSmallScreen ? 50 : 65,
                          child: TextFormField(
                            controller: _controllerEmail,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              hintText: 'Add meg az e-mail címed',
                              hintStyle: TextStyle(
                              color: ColorApp.bgHome,
                              fontSize: isSmallScreen ? 16 : 20,
                            ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Kérlek add meg az e-mail címed';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        SizedBox(
                          height: isSmallScreen ? 50 : 65,
                          child: TextFormField(
                            controller: _controllerPassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              hintText: 'Add meg a jelszavad',
                              hintStyle: TextStyle(
                                color: ColorApp.bgHome,
                                fontSize: isSmallScreen ? 16 : 20,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Kérlek adj meg érvényes jelszót';
                              }
                              return null;
                            },
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isTaSAccepted,
                        onChanged: (bool? value) {
                          setState(() {
                            isTaSAccepted = value!;
                            colorTaS = Colors.white;
                          });
                        },
                        side: BorderSide(width: 1.0, color: colorTaS),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/aszf');
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          "Elfogadom a felhasználási feltételeket",
                          style: GoogleFonts.dmSans(
                            color: colorTaS,
                            fontSize: isSmallScreen ? 12 : 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: createUserWithEmailAndPassword,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
                      fixedSize: WidgetStateProperty.all(
                        Size(screenWidth * 0.5, isSmallScreen ? screenHeight * 0.06 : screenHeight * 0.05),
                      ),
                    ),
                    child: Text(
                      'Regisztráció',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: isSmallScreen ? 14 : 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/aszf');
                    },
                    child: Text(
                      'ÁSZF & Adatvédelmi tájékoztató',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          fontWeight: FontWeight.w300,
                            fontSize: isSmallScreen ? 10 : 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
