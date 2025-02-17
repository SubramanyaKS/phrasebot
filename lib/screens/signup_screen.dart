import 'package:flutter/material.dart';
import 'package:phrasebot/components/background.dart';
import 'package:phrasebot/components/elevation_button.dart';
import 'package:phrasebot/services/auth_service.dart';
import 'package:phrasebot/utils/constant.dart';

import '../components/bottom_card.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Sign up"),
      // ),
      body: GradientBackground(
        child: Stack(
          children: [
            Positioned(
              top: 100,
              left: 150,
              child: Text(
                "SIGN UP",
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
            "Name",
            style: const TextStyle(color: Colors.black),
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 40),
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
          ElevationButton(
            onPress: () {
              signUp(emailController.text, passwordController.text,
                  nameController.text);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Signup Successful")));
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            title: SIGNUP,
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF192BC2),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(HAVEACCOUNT),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text("Login")),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
