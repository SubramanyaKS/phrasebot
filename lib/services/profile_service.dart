import 'package:supabase_flutter/supabase_flutter.dart';

Future<Map<String, dynamic>?> fetchUserProfile() async {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;
  var userId=user?.id??'';

  if (user == null) return null;

   final response = await supabase
      .from('profiles')
      .select()
      .eq('id', userId)
      .maybeSingle();   // <-- FIXED

  if (response == null) {
    // No profile found
    return {
      "email": "No email",
      "name": "No Name",
      "bio": "No Bio",
    };
  }

  return {
    "email": response['email'] ?? "No email",
    "name": response['name'] ?? "No Name",
    "bio": response['bio'] ?? "No Bio",
  };
}
// Future<void> forgotPassword(String email) async {
//   try {
//     final response = await Supabase.instance.client.auth
//         .resetPasswordForEmail(email, redirectTo: 'https://yourapp.com/reset-password');

//     print("Password reset email sent to $email");
//   } catch (e) {
//     print("Error sending password reset email: $e");
//   }
// }
Future<void> updateProfile(String email,String bio) async{

  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;
  if (user == null) return;
  await supabase.from('profiles').update({
    'email': email,
    'bio': bio,
  }).eq('id', user.id);
}