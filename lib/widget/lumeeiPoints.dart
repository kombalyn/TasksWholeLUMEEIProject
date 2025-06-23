import 'package:apptvshow/users/models.dart';
import 'package:flutter/material.dart';
import 'package:apptvshow/services/firestore.dart';

class LumeeiPoints extends StatefulWidget {
  const LumeeiPoints({super.key});


  @override
  State<LumeeiPoints> createState() => _LumeeiPointsState();
}

class _LumeeiPointsState extends State<LumeeiPoints> {
  Future<String> getPoints() async{
    final user = await FirestoreService().getUser();
    return user.lumeeiCoins.toString();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 550;

    return Container(
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
                    "Gyűjts extra LUMEEI pontokat!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isSmallScreen ? 16 : 20,
                    ),
                ),
                SizedBox(height: isSmallScreen ? 10 : 20,),
                Row(children: [
                    Text("Eddigi pontjaid száma: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isSmallScreen ? 14 : 18,
                      ),),
                    FutureBuilder<String>(
                      future: getPoints(),
                      builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("...");

                          }else if (snapshot.hasData) {
                            return Text(
                              snapshot.data!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isSmallScreen ? 14 : 18,
                              ),
                            );
                          } else {
                            return Text("Hiba");
                          }
                      },
                    ),
                  const SizedBox(width: 8,),
                  Container(
                    height: isSmallScreen ? 16 : 20,
                    width: isSmallScreen ? 16 : 20,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 215, 0, 1)),
                    child: Icon(Icons.stars,
                      color: const Color.fromRGBO(255, 171, 0, 1),
                      size: isSmallScreen ? 16 : 20,
                    ),
                  )
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
    );
  }
}
