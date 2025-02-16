import 'package:flutter/material.dart';
import 'package:phrasebot/components/background.dart';
import 'package:phrasebot/components/elevation_button.dart';
import 'package:phrasebot/screens/authcheck_screen.dart';
import 'package:phrasebot/utils/constant.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Background color
      body: GradientBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              // Chatbot Icon
              Icon(Icons.chat_bubble, size: 100, color: Colors.white),

              SizedBox(height: 20),
              Text(
                HEADING,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 10),

              // Subtitle
              Text(
                SUBTITLE,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 100),
              Spacer(),
              // Start Chat Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevationButton(onPress:  () {
                  // Navigate to Chat Screen
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => AuthCheck(),
                    ),
                  );
                }, title: "Start Chatting", foregroundColor: Colors.blueAccent, backgroundColor: Colors.white),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
