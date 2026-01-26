import 'package:flutter/material.dart';
import 'package:phrasebot/providers/theme_provider.dart';
import 'package:phrasebot/screens/login_screen.dart';
import 'package:phrasebot/services/auth_service.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Appearance',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                  height: 90,
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.sunny,
                          color: Color(0xFF192BC2),
                        ),
                        title: Text('Theme'),
                        subtitle: Text('dark mode or light mode'),
                        trailing: Switch(
                          value: themeProvider.isDarkMode,
                          onChanged: (_) => themeProvider.toggleTheme(),
                        ),
                        onTap: () {},
                      ),
                    ],
                  )),
              Text(
                'Privacy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.privacy_tip,
                        color: Color(0xFF192BC2),
                      ),
                      title: Text(
                        'Privacy Policy',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('View our privacy policy'),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.description,
                        color: Color(0xFF192BC2),
                      ),
                      title: Text('Terms of Services'),
                      subtitle: Text('View our terms and conditions'),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Text(
                'About',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                  height: 80,
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.error_outline,
                          color: Color(0xFF192BC2),
                        ),
                        title: Text('App version'),
                        subtitle: Text('v1.0.0'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {},
                      ),
                    ],
                  )),
                  Text(
                'Account',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
                  SizedBox(
                  height: 150,
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Color(0xFF192BC2),
                        ),
                        title: Text('Logout'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          signOut();
                          Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      );
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.clear,
                          color: Color(0xFF192BC2),
                        ),
                        title: Text('Clear Chat History'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                        },
                      ),
                    ],
                  )
                )
            ],
          ),
        ),
      ),
    );
  }
}
