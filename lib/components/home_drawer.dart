import 'package:flutter/material.dart';
import 'package:phrasebot/screens/welcome_screen.dart';
import 'package:phrasebot/services/auth_service.dart';
import 'package:phrasebot/utils/constant.dart';
import 'package:phrasebot/screens/profile.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF0000FF),
        child: ListView(
          children: [
            DrawerHeader(
                child: Center(
                    child: Text(TITLE.toUpperCase(),
                        style: TextStyle(fontSize: 35, color: Colors.white)))),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              },
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onTap: () {
                signOut();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(),
                  ),
                );
              },
              title: Text(
                "SignOut",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
