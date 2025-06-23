import 'package:apptvshow/color/colorapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './auth.dart';
import './functions/errordialog.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String? errorMessage = '';


  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    try {
      if (_controllerEmail.text.isEmpty) {
        setState(() {
          errorMessage = 'Kérlek add meg az e-mail címed!';
        });
        dialogBuilder(context, errorMessage);
        return;
      }

      if (_controllerPassword.text.isEmpty) {
        setState(() {
          errorMessage = 'Kérlek add meg a jelszavad!';
        });
        dialogBuilder(context, errorMessage);
        return;
      }

      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text,
      );

    } on FirebaseAuthException catch (e){
      setState(() {
        print("H I B A: ${e.code}");
        switch(e.code){
          case 'invalid-email':
            errorMessage = 'Hibás e-mail cím formátum.';
            break;
          case 'user-disabled':
            errorMessage = 'Ez a felhasználói fiók le van tiltva.';
            break;
          case ('invalid-credential'):
            errorMessage = 'Kérlek adj meg érvényes bejelentkezési adatokat!';
            break;
          case 'network-request-failed':
            errorMessage = 'Nincs internetkapcsolat. Kérlek, csatlakozz a hálózathoz!';
            break;
          default:
            errorMessage = 'Bejelentkezési hiba!';
        }
        dialogBuilder(context, errorMessage);
      });
    } catch (e) {
      // Bármilyen egyéb hiba
      setState(() {
      errorMessage = 'Ismeretlen hiba történt. Próbáld újra később.';
      });
      dialogBuilder(context, errorMessage);
    }
  }


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

    return Scaffold(
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
                  width: isSmallScreen ? screenWidth*0.35 : screenWidth * 0.45,
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
                SizedBox(height: screenHeight * 0.04),
                TextFormField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: 'Írd be az e-mail címed',
                    hintStyle: TextStyle(
                      color: ColorApp.bgHome,
                      fontSize: isSmallScreen ? 16 : 20,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Kérlek add meg a neved';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                TextFormField(
                  controller: _controllerPassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "Kérlek add meg a jelszavad",
                    hintStyle: TextStyle(
                      color: ColorApp.bgHome,
                      fontSize: isSmallScreen ? 16 : 20,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: screenHeight * 0.015),
                ElevatedButton(
                  onPressed: () => signInWithEmailAndPassword(context),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
                    fixedSize: WidgetStateProperty.all(
                      Size(screenWidth * 0.5, isSmallScreen ? screenHeight * 0.06 : screenHeight*0.05),
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
                SizedBox(height: screenHeight * 0.015),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/forgottenpw',
                    );
                  },
                  child: Text(
                    'Elfelejtetted a jelszavad?',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: isSmallScreen ? 14 : 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
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
                SizedBox(height: screenHeight * 0.03),
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
    );
  }
}
