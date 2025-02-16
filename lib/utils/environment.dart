import 'package:flutter_dotenv/flutter_dotenv.dart';

final class Environment {
  static String get supabaseUrl =>dotenv.env['SUPABASE_URL']??"";
  static String get supabaseAnonKey =>dotenv.env['SUPABASE_ANON']??"";
  static String get huggingfaceKey =>dotenv.env['HUGGINGFACE_API_KEY']??'';
  static String get huggingfaceURI =>dotenv.env['HUGGINGFACE_API_URI']??'';

  static Future<void> load() async {
    await dotenv.load();
  }
}