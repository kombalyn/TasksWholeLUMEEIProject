// ignore_for_file: unnecessary_import, sort_child_properties_last

import 'package:apptvshow/color/colorapp.dart';
import 'package:apptvshow/widget/lumeeiAppbar.dart';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 550;
    return Scaffold(
      backgroundColor: ColorApp.bgHome,
      appBar: LumeeiAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text("Értesítések",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isSmallScreen ? 20 : 24,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(20),
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
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Üdvözlünk a LUMEEI-ban!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isSmallScreen ? 16 : 20,
                              ),
                            ),
                            SizedBox(height: isSmallScreen ? 10 : 20,),
                            Row(children: [
                              Text("Gyere tanulj & játssz velünk!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isSmallScreen ? 14 : 18,
                                ),
                              ),
                            ]
                            )
                          ],
                        ),
                        SizedBox(
                          width: isSmallScreen ? screenWidth*0.2 : screenWidth*0.18,
                          child: Image.asset(
                            "images/lumeei_coins.png",
                          ),
                        ),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      )
    );
  }
}
