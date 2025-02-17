import 'package:flutter/material.dart';
import 'package:phrasebot/components/texticon_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../components/background.dart';
import '../services/profile_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<String, dynamic>? userProfile;
  bool isLoading = true;
  bool editing=false;
  final supabase = Supabase.instance.client;
  final emailController = TextEditingController();
  final bioController= TextEditingController();
  
  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final profile = await fetchUserProfile();
    setState(() {
      userProfile = profile;
      isLoading = false;
      emailController.text=profile!['email'];
      bioController.text=profile['bio'];

    });
  }
  void updateState(){
    setState(() {
      editing = !editing;
    });
  }
  Future<void> _updateProfile() async {
    await updateProfile(emailController.text.trim(), bioController.text.trim());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Profile updated successfully!")),
    );

    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    // emailController.text=userProfile!['email'];
    // bioController.text=userProfile['bio'];
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body:  isLoading
        ? Center(child: CircularProgressIndicator())
        : userProfile == null
    ? Center(child: Text("No user found"))
        : GradientBackground(
        child:  Column(
          spacing: 3,
          children: [
            SizedBox(height: 100,),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage("https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_0.jpg"),
              ),
            ),
            // Positioned(child:
            Text(" ${userProfile!['name']}",style: TextStyle(color:Colors.white,fontSize: 40),),
            SizedBox(height: 20,),
            TextIconButton(onPress:  updateState, label: "Edit", icon: Icons.edit),

            editing?TextIconButton(onPress:   _updateProfile, label: "Save", icon: Icons.save):SizedBox(),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.email_outlined,color: Colors.white,),
                    title: TextFormField(
                      readOnly: !editing,
                      controller: emailController,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        border:InputBorder.none,
                        hintText: "Your email",
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person,color: Colors.white,),
                    title: TextFormField(
                      readOnly: !editing,
                      controller: bioController,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        border:InputBorder.none,
                        hintText: "Your bio",
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone,color: Colors.white,),
                    title: Text("+91 9876543210",style: TextStyle(fontSize:24,color: Colors.white),),
                  ),
                ],
              ),
            )
            // )
          ],
        ),
      ),
    );
  }
}
