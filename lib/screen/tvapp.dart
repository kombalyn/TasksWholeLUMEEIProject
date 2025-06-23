// ignore_for_file: unnecessary_import, sort_child_properties_last

import 'package:apptvshow/color/colorapp.dart';
import 'package:apptvshow/modelview/modelTvCat_View.dart';
import 'package:apptvshow/widget/lumeeiAppbar.dart';
import 'package:apptvshow/widget/lumeeiPoints.dart';
import 'package:apptvshow/widget/profil.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class TvApp extends GetMaterialApp {
  TVCat tvCat = Get.put(TVCat());
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 550;
    return Scaffold(
      backgroundColor: ColorApp.bgHome,
      appBar: LumeeiAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserProfile(),
              const LumeeiPoints(),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(16.0),
                       side: const BorderSide(
                         color: Colors.white,
                         width: 1.5,
                       ),
                    ),
                  ),
                  onPressed: () => {
                    Navigator.pushNamed(context, '/quizz')
                  },
                  child: Image.asset('images/LUMEEI_Quiz.png',
                    width: screenWidth*0.55,
                  )
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text("Játékok",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isSmallScreen ? 16 : 20,
                  )
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Image.asset("images/mobile_games.png"),
                width: screenWidth*0.9,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 20),
                child: Text("Játékaink hamarosan elérhetőek!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isSmallScreen ? 14 : 20,
                  )
                ),
              )
            ],
          ),
        )
      )
    );
  }
}
