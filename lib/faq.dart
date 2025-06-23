import 'package:apptvshow/screen/Series.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Faq extends StatelessWidget {
  final Function setMenuState;
  const Faq({super.key, required this.setMenuState});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setMenuState(SeriesApp(setMenuState: setMenuState));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.keyboard_arrow_left,
                    size: 32,
                    color: Colors.black,
                  ),
                  Text("Vissza az előző oldalra",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("1. Hogyan tölthetem le az alkalmazást?",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6,),
                Text("Az alkalmazás elérhető mind iOS, mind Android készülékekre. Látogass el az App Store-ba vagy a Google Play Áruházba, keresd meg az alkalmazás nevét, és kattints a „Letöltés” gombra.",
                  style: GoogleFonts.dmSans(
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16,),
                Text("2. Szükséges regisztrálnom a használathoz?",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6,),
                Text("Igen, az alkalmazás használatához regisztráció szükséges. Fiókot létrehozhatsz e-mail címeddel, vagy bejelentkezhetsz a közösségi médián keresztül (pl. Google, Facebook).",
                    style: GoogleFonts.dmSans(
                      fontSize: 11,
                      color: Colors.black,
                    ),
                  ),
                const SizedBox(height: 16,),
                Text("3. Milyen tartalmak érhetők el a platformon?",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6,),
                Text("Széles körű filmeket, sorozatokat, dokumentumfilmeket és rövid videókat kínálunk, amelyek folyamatosan frissülnek. Kategóriák szerint böngészhetsz, vagy kereshetsz a tartalmak között.",
                    style: GoogleFonts.dmSans(
                      fontSize: 11,
                      color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16,),
                Text("4. Hogyan lehet videókat letölteni és offline megtekinteni?",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6,),
                Text("Az alkalmazás lehetővé teszi a videók letöltését, hogy offline is megnézhesd őket. Keresd a letöltési ikont a videók mellett, majd válaszd ki a kívánt minőséget.",
                    style: GoogleFonts.dmSans(
                      fontSize: 11,
                      color: Colors.black,
                    ),
                ),
                const SizedBox(height: 16,),
                Text("5. Miért akadozik a videó lejátszása?",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6,),
                Text("A videólejátszás akadozhat a lassú internetkapcsolat miatt. Próbáld meg csökkenteni a videó minőségét, vagy ellenőrizd az internetkapcsolatodat.",
                  style: GoogleFonts.dmSans(
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16,),
                Text("6. Mennyibe kerül az előfizetés?",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6,),
                Text("Az előfizetés díjai eltérőek lehetnek a választott csomag alapján (havi, negyedéves vagy éves előfizetés). Aktuális árainkat megtalálod az \"Előfizetés\" menüpontban.",
                  style: GoogleFonts.dmSans(
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16,),
                Text("7. Hogyan mondhatom le az előfizetésemet?",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6,),
                Text("Az előfizetésed lemondásához lépj be a profilodba, majd válaszd az \"Előfizetések\" menüpontot, ahol lehetőséged lesz az előfizetés kezelésére vagy lemondására.",
                  style: GoogleFonts.dmSans(
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16,),
                Text("8. Több eszközön is használhatom ugyanazt a fiókot?",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6,),
                Text("Igen, ugyanazzal a fiókkal több eszközön is bejelentkezhetsz, de a videók egyidejű megtekintése eszközönként eltérő lehet az előfizetési csomag típusától függően.",
                  style: GoogleFonts.dmSans(
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16,),
                Text("9. Hogyan tudom megváltoztatni a jelszavamat?",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6,),
                Text("A jelszó megváltoztatásához lépj be a profilodba, válaszd a „Fiókbeállítások” menüpontot, majd kattints a „Jelszó módosítása” lehetőségre. Itt add meg az új jelszót.",
                  style: GoogleFonts.dmSans(
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16,),
                Text("10. Hogyan léphetek kapcsolatba az ügyfélszolgálattal?",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6,),
                Text("Az ügyfélszolgálatunk elérhető az alkalmazáson belüli „Kapcsolatfelvétel” menüpontban. E-mailben vagy élő chaten keresztül is segítünk.",
                  style: GoogleFonts.dmSans(
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
