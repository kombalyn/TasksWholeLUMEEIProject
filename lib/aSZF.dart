import 'package:apptvshow/color/colorapp.dart';
import 'package:apptvshow/texts/aszfDescription.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Aszf extends StatelessWidget {
  const Aszf({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 550;

    return SafeArea(
      child: Scaffold(
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
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/signup',
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white60,
                  foregroundColor: ColorApp.bgHome,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: const BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  ),
                ),
                child: SizedBox(
                  width: isSmallScreen ? 80 : 100,
                  height: isSmallScreen ? 50 : 65,
                  child: const Center(
                    child: Text(
                      "Regisztrálj a LUMEEI-ra",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
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
                child: const Text("Bejelentkezés"),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                  //Navigator.pop(context);
                },
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.keyboard_arrow_left,
                      size: 40,
                      color: Colors.black,
                    ),
                    Text(
                      "Vissza az előző oldalra",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: isSmallScreen ? 14 : 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "A LUMEEI felhasználási feltételei",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: isSmallScreen ? 24 : 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      aszfDescription, // Replace with your terms and conditions string
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: isSmallScreen ? 14 : 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
