import 'package:apptvshow/auth.dart';
import 'package:apptvshow/color/colorapp.dart';
import 'package:apptvshow/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'functions/errordialog.dart';

class ForgottenPassword extends StatefulWidget {
  const ForgottenPassword({super.key});

  @override
  State<ForgottenPassword> createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {

  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();

  Future<void> sendPasswordResetEmail() async {
    try {
      await Auth().sendPasswordResetEmail(
        email: _controllerEmail.text.trim(),
      );
        Navigator.pop(context);
        dialogBuilder(context, "Jelszó visszaállító e-mail elküldve", type: '');
    } on FirebaseAuthException {
      setState(() {
        if (_controllerEmail.text.isEmpty) {
          errorMessage = 'Kérlek add meg az e-mail címed!';
        } else {
          errorMessage = 'Kérlek adj meg érvényes e-mail címet!';
        }
        dialogBuilder(context, errorMessage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorApp.bgHome, // same color as the app background
      statusBarIconBrightness: Brightness.light, // Adjusts the icon color for contrast
      statusBarBrightness: Brightness.dark, // iOS status bar brightness
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
                    height: screenHeight * 0.35,
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
                    'gyere tanulj & játssz velünk',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: isSmallScreen ? 16 : 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  TextFormField(
                    controller: _controllerEmail,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: 'Add meg a regisztrált e-mail címed',
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
                  SizedBox(height: screenHeight * 0.03),
                  ElevatedButton(
                    onPressed: sendPasswordResetEmail,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
                      fixedSize: WidgetStateProperty.all(
                        Size(screenWidth * 0.5, isSmallScreen ? screenHeight * 0.06 : screenHeight * 0.05),
                      ),
                    ),
                    child: Text(
                      'Jelszó visszaállítása',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: isSmallScreen ? 12 : 18,
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

