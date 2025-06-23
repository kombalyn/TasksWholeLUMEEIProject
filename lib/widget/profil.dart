import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final String _userEmail = 'Felhasználónk!';

  // retrieve email
  Future<void> _getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //String? savedUserEmail = prefs.getString('useremail');
    setState(() {
      //_userEmail = savedUserEmail;
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserEmail();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 550;

    return Container(
      margin: EdgeInsets.all(isSmallScreen ? 0 : 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Üdv,",
                style: TextStyle(
                  fontSize: isSmallScreen ? 14 : 18,
                  color: Colors.white,
                ),
              ),
              Text(
                "Kedves $_userEmail",
                style: TextStyle(
                  fontSize: isSmallScreen ? 20 : 24,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: Icon(
                      Icons.verified_outlined,
                      size: isSmallScreen ? 16 : 20,
                    ),
                  ),
                  Text(
                    "Ellenőrzött fiók",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12 : 16,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text(
                  "Előfizetésed megújul: 2024.11.11",
                  style: TextStyle(
                    fontSize: isSmallScreen ? 11 : 13,
                    color: Colors.white,
                  )
                ),
              ),
            ],
          ),
          Container(
            width: isSmallScreen ? screenWidth*0.20 : screenWidth*0.18,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
              child: Icon(
                Icons.account_circle,
                color: Colors.black38,
                size: isSmallScreen ? screenWidth*0.20 : screenWidth*0.18,
              )
          ),
        ],
      ),
    );
  }


}
