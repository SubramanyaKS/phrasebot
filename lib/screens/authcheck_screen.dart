import 'package:flutter/material.dart';
import 'package:phrasebot/screens/chat_screen.dart';
import 'package:phrasebot/screens/welcome_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  void checkUserLoggedIn() async {
    final user = Supabase.instance.client.auth.currentUser;
    await Future.delayed(Duration(seconds: 1));  // Optional delay for smooth transition

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Chat()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

