
import 'package:apptvshow/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:apptvshow/modelview/viewHome.dart';
import '../auth.dart';
import '../color/colorapp.dart';
import 'package:get/get.dart';

class LumeeiAppbar extends StatelessWidget implements PreferredSizeWidget {
  final ViewHome viewHome = Get.put(ViewHome());
  LumeeiAppbar({super.key});



  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorApp.bgHome,
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Image.asset('images/LUMEEI_logó.jpg',
          width: 150,
          height: 150,
        ),
      ),
      actions: <Widget>[
        Text("LUMEEI",
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontSize: 29.5,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 25,),
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: 145,
          child: ElevatedButton(
            onPressed: (){
              showSearch(
                context: context,
                delegate: AppSearch(prolist: viewHome.movieshome),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor:ColorApp.bgHome,
                foregroundColor: Colors.white,
                side: const BorderSide(
                  width: 1.0,
                  color: Colors.white,
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
                children:
                [
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: const Icon(
                      Icons.search_rounded,
                      color: ColorApp.bgHome,
                    ),
                  ),
                   const SizedBox(width: 15,),
                   const Text("Keresés"),
                ]
            ),
          ),
        ),
      ],
    );
  }


  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


}


