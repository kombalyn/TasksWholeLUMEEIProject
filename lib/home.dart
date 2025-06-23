import 'package:apptvshow/color/colorapp.dart';
import 'package:apptvshow/login.dart';
import 'package:apptvshow/modelview/viewHome.dart';
import 'package:apptvshow/modelview/viewHome2.dart';
import 'package:apptvshow/providers/navbarProvider.dart';
import 'package:apptvshow/widget/lastch2.dart';
import 'package:apptvshow/widget/lastch3.dart';
import 'package:apptvshow/widget/search.dart';
import 'package:apptvshow/widget/moviesHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import './auth.dart';
import 'modelview/modelTvCat_View.dart';
import 'modelview/viewHome3.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ViewHome viewHome = Get.put(ViewHome());
  ViewHome2 viewHome2 = Get.put(ViewHome2());
  ViewHome3 viewHome3 = Get.put(ViewHome3());
  TVCat tvCat = Get.put(TVCat());


  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  void initState() {
    tvCat.getcat();
    viewHome.moviesHomeapp();
    viewHome2.lastChHome();
    viewHome3.lastChHome();
    tvCat.getcat2();
    tvCat.getcat3();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorApp.bgHome, // same colour as the app background
      statusBarIconBrightness: Brightness.light, // Adjusts the icon color for contrast
      statusBarBrightness: Brightness.dark, // iOS status bar brightness
    ));
    final switchToOtherWidgetFromNavBar = NavbarProvider.of(context)?.switchToOtherWidgetFromNavBar;

    final screenWidth = MediaQuery.of(context).size.width;

    final bool isSmallScreen = screenWidth < 550;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.bgHome,
          leading: Image.asset('images/LUMEEI_logó.jpg',
            width: 100,
            height: 100,
          ),
          title: const Text("LUMEEI",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: AppSearch(prolist: viewHome.movieshome),
                  );
                },
                child: const Icon(Icons.search,
                  color: Colors.white,
                size: 40,),
              )
            ),
          ],
        ),
        backgroundColor: ColorApp.bgHome,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: isSmallScreen ? 130 : 210,
                width: screenWidth*0.95,
                child: ElevatedButton(
                  onPressed: () => switchToOtherWidgetFromNavBar!(1),
                  style: ElevatedButton.styleFrom(
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    height: isSmallScreen ? 130 : 210,
                    width: screenWidth*0.95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          colors:[
                            Color(0xffff69b4),
                            Color(0xff8a2be2),
                          ],
                          stops: [0.5, 1],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )
                    ),
                    child: SizedBox(
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Próbáld ki",
                                      style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontSize: isSmallScreen ? 16 : 20,
                                      ),
                                    ),
                                    Text("Játékainkat is",
                                      style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontSize: isSmallScreen ? 20 : 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: isSmallScreen ? 20 : 24,),
                                    Text("Folyamatosan bövűl kínálatunk!",
                                      style: GoogleFonts.openSans(
                                        fontSize: isSmallScreen ? 11 : 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset('images/vr_kid.png',
                                  height: double.infinity,
                                ),
                              ]
                          ),
                          Positioned(
                            right: 20,
                            top: 65,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors:[
                                    Color(0xffff69b4),
                                    Color(0xff8a2be2),
                                  ],
                                  stops: [0.5, 1],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.north_east,
                                  color: Colors.white,
                                  size: 30,
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
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Matek",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              const SizedBox(height: 110, child: MoviesHome()),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Fizika",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(height: 110, child: LastCh3()),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Történelem",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              //Container(height: 280, child: SeriesHome()),
              SizedBox(height: 110, child: LastCh2()),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "5. osztály",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              //Container(height: 280, child: SeriesHome()),
              SizedBox(height: 110, child: LastCh2()),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "6. osztály",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              //Container(height: 280, child: SeriesHome()),
              SizedBox(height: 110, child: LastCh2()),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "7. osztály",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              //Container(height: 280, child: SeriesHome()),
              SizedBox(height: 110, child: LastCh2()),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "8. osztály",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              //Container(height: 280, child: SeriesHome()),
              SizedBox(height: 110, child: LastCh2()),
            ],
          ),
        ),
      ),
    );
  }
}