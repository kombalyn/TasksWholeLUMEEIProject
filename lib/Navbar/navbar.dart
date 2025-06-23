import 'package:apptvshow/home.dart';
import 'package:apptvshow/providers/navbarProvider.dart';
import 'package:apptvshow/screen/moviesapp.dart';
import 'package:apptvshow/screen/tvapp.dart';
import 'package:apptvshow/userSettings.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(
      selectedIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutQuad,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NavbarProvider(
      switchToOtherWidgetFromNavBar: onButtonPressed,
      child: Scaffold(
          backgroundColor: Colors.black38,
          body: DoubleBackToCloseApp(
            snackBar: const SnackBar(
              content: Text('Tap back again to Exit'),
            ),
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: _listOfWidget,
            ),
          ),
          bottomNavigationBar: _buildCustomNavBar(context),
        ),
    );
  }

  Widget _buildCustomNavBar(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.black38,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_outlined,  0, context),
          _buildNavItem(Icons.sports_esports_outlined,  1, context),
          _buildNavItem(Icons.circle_notifications_outlined,  2, context),
          _buildNavItem(Icons.account_circle_outlined,  3, context),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, BuildContext context) {

    final isSelected = selectedIndex == index;
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 550;


    final double iconSize = isSmallScreen ? 26 : 40;
    final double selectedIconSize = isSmallScreen ? 32 : 44;

    return GestureDetector(
      onTap: () {
        onButtonPressed(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.pinkAccent : Colors.white,
            size: isSelected ? selectedIconSize : iconSize,
          ),
        ],
      ),
    );
  }
}

List<Widget> _listOfWidget = <Widget>[
  const Home(),
  TvApp(),
  const MoviesApp(),
  const Usersettings(),
];
