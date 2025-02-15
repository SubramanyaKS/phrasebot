import 'package:flutter/material.dart';
import 'package:phrasebot/components/background.dart';
import 'package:phrasebot/components/elevation_button.dart';
import 'package:phrasebot/screens/login_screen.dart';
import 'package:phrasebot/screens/signup_screen.dart';
import 'package:phrasebot/utils/constant.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45,
        body: GradientBackground(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Spacer(),
              Text(
                TITLE,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                ),
              ),
              const Spacer(),
              Image.asset('./assets/images/chatbot.png'),
              const Spacer(),
              ElevationButton(onPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
                  foregroundColor: Color(0xFF192BC2),
                  backgroundColor: Colors.white,
                  title: LOGIN),
              const SizedBox(height: 40),
              ElevationButton(onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(),
                    ),
                  );
                },
                  foregroundColor: Color(0xFF192BC2),
                  backgroundColor: Colors.white,
                  title: SIGNUP),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
