import 'package:flutter/material.dart';
import 'package:phrasebot/providers/chat_provider.dart';
import 'package:phrasebot/providers/theme_provider.dart';
import 'package:phrasebot/screens/onboard_screen.dart';
import 'package:phrasebot/utils/environment.dart';
import 'package:phrasebot/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  await Environment.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: Environment.supabaseUrl,
    anonKey: Environment.supabaseAnonKey,
  );

  runApp( MultiProvider(
      providers: [ChangeNotifierProvider(
    create: (context) => ChatProvider(),),
     ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PhraseBot',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      home: OnboardScreen(),
    );
  }
}