import 'package:supabase_flutter/supabase_flutter.dart';

Future<Map<String, dynamic>?> fetchUserProfile() async {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;

  if (user == null) return null;

  // Fetch user metadata (if stored in Auth)
  // final userData = user.userMetadata;
  // userData!['bio']="Hi";
  // if (userData != null) {
  //   print(userData);
  //   return {
  //     "email": user.email,
  //     "name": userData["name"] ?? "No Name",
  //   };
  // }

  // Alternative: Fetch from 'profiles' table
  final response = await supabase
      .from('profiles')
      .select()
      .eq('id', user.id)
      .single();

  return {
    "email": response['email']??"No email",
    "name": response["name"] ?? "No Name",
    "bio": response["bio"] ?? "No Bio",
  };
}
Future<void> updateProfile(String email,String bio) async{

  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;
  if (user == null) return null;
  await supabase.from('profiles').update({
    'email': email,
    'bio': bio,
  }).eq('id', user.id);
}