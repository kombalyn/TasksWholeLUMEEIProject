import 'package:apptvshow/screen/Series.dart';
import 'package:apptvshow/widget/lumeeiAppbar.dart';
import 'package:flutter/material.dart';

class Usersettings extends StatefulWidget {
  const Usersettings({super.key});

  @override
  State<Usersettings> createState() => _UsersettingsState();
}

class _UsersettingsState extends State<Usersettings> {

  late Widget menuState;

  @override
  void initState() {
    super.initState();
    menuState =  SeriesApp(setMenuState: setMenuState,);
  }

  void setMenuState(Widget newMenuState){
    setState(() {
      menuState = newMenuState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: LumeeiAppbar(),
      body: menuState,
    ));
  }
}
