import 'package:apptvshow/aSZF.dart';
import 'package:apptvshow/color/colorapp.dart';
import 'package:apptvshow/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import './register.dart';

class Opening extends StatelessWidget {
  const Opening({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorApp.bgHome, // same colour as the app background
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
                    height: screenHeight * 0.4,
                  ),
                  Text(
                    'LUMEEI',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: isSmallScreen ? 52 : 72, // Adjust font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Text(
                    'gyere tanulj & játssz velünk',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: isSmallScreen ? 16 : 20, // Adjust font size
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ButtonStyle(
                      backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.black),
                      fixedSize: WidgetStateProperty.all(
                        Size(screenWidth * 0.5, isSmallScreen ? screenHeight * 0.06 : screenHeight*0.05), // Responsive size
                      ),
                    ),
                    child: Text(
                      'Bejelentkezés',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: isSmallScreen ? 14 : 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Space between buttons
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/signup',
                      );
                    },
                    child: Text(
                      'Fiók létrehozása',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: isSmallScreen ? 16 : 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Space between buttons
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/aszf',
                      );
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
                      textAlign: TextAlign.center,
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