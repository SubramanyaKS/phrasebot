import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:phrasebot/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> createProfile(String userId, String email,String name) async {
  final supabase = Supabase.instance.client;
  await supabase.from('profiles').insert({
    'id': userId,
    'email': email,
    'name': name,
    'phone': '',
    'profile_url': '',
    'bio': '',
  });
}
Future<void> signUp(String email, String password, String name) async {
  final supabase = Supabase.instance.client;

  try {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {"name": name}, // Store name in metadata
    );

    if (response.user != null) {
      await createProfile(response.user!.id, email,name);
      log("✅ User Signed Up: ${response.user!.email}");
    } else {
      log("❌ Error: Unknown issue occurred during signup.");
    }
  } catch (e) {
    log("❌ Exception: $e"); // Prints any errors
  }
}


Future<void> login(String email, String password,BuildContext context) async {
  final supabase = Supabase.instance.client;

  try {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user != null) {
      log("✅ User Logged In: ${response.user!.email}");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("✅ User Logged In:")));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );

    } else {
      log("❌ Error: Unknown issue occurred during login.");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("❌ Error: Unknown issue occurred during login.")));
    }
  } catch (e) {
    log("❌ Exception: $e"); // Prints any errors
  }
}
Future<void> signOut() async {
  final supabase = Supabase.instance.client;

  try {
    await supabase.auth.signOut();
    print("✅ User Signed Out Successfully");
  } catch (e) {
    print("❌ Error Signing Out: $e");
  }
}
Future<void> resetPassword(String email) async {
  final supabase = Supabase.instance.client;

  try {
    await supabase.auth.resetPasswordForEmail(email);
    print("📩 Password Reset Email Sent to $email");
  } catch (e) {
    print("❌ Error Sending Reset Email: $e");
  }
}
bool isUserLoggedIn() {
  final supabase = Supabase.instance.client;
  return supabase.auth.currentUser != null;
}

Future<String> getUserProfile() async {
  final supabase = Supabase.instance.client;

  final user = supabase.auth.currentUser;
  if (user != null) {
    print("User Email: ${user.email}");
    print("User Name: ${user.userMetadata?['name'] ?? 'No name set'}");
  return user.userMetadata?['name'] ?? 'No name set';

  }
  return 'No user';
}
