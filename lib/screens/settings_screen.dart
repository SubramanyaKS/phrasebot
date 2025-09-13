import 'package:flutter/material.dart';
import 'package:phrasebot/providers/theme_provider.dart';
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
          padding: const EdgeInsets.all(16.0),
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
                          color: Colors.deepPurple,
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
                        color: Colors.deepPurple,
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
                        color: Colors.deepPurple,
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
                  height: 150,
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.error_outline,
                          color: Colors.deepPurple,
                        ),
                        title: Text('App version'),
                        subtitle: Text('v1.0.0'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {},
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
