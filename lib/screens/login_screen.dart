import 'package:flutter/material.dart';
import 'package:phrasebot/components/background.dart';
import 'package:phrasebot/components/bottom_card.dart';
import 'package:phrasebot/components/elevation_button.dart';
import 'package:phrasebot/screens/signup_screen.dart';
import 'package:phrasebot/services/auth_service.dart';
import 'package:phrasebot/utils/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black45,
      // appBar: AppBar(
      //   title: const Text("Login"),
      // ),
      body: GradientBackground(
        child: Stack(
          children: [
            Positioned(
              top: 100,
              left: 150,
              child: Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
            ),
            Positioned(
                bottom: 0,
                child: BottomCard(mediaSize: mediaSize, child: _buildForm()))
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Text(
            "Email address",
            style: const TextStyle(color: Colors.black),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            "Password",
            style: const TextStyle(color: Colors.black),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.remove_red_eye),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 40),
          TextButton(
              onPressed: () {
                debugPrint("Password : ${passwordController.text}");
              },
              child: Text("Forgot Password")),
          const SizedBox(height: 30),
          ElevationButton(onPress: () {
            debugPrint("Email : ${emailController.text}");
            // debugPrint("Password : ${passwordController.text}");
            login(emailController.text, passwordController.text,context);

          }, title: LOGIN,

            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF192BC2),),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(NOTHAVEACCOUNT),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => SignupScreen(),
                      ),
                    );
                  },
                  child: Text("Sign up")),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
