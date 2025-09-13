import 'package:flutter/material.dart';
import 'package:phrasebot/services/chat_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatProvider with ChangeNotifier {
  final ChatService _chatService = ChatService();
  List<Map<String, String>> messages = [];
  List<Map<String,String>> userdetails=[];

  Future<void> getUserProfile() async {
    final supabase = Supabase.instance.client;

    final user = supabase.auth.currentUser;
    if (user != null) {
      userdetails.add({"username":user.userMetadata?['name'],"email":user.email.toString()});
    }
  }

  Future<void> sendMessage(String userMessage) async {
    messages.add({"sender": "user", "text": userMessage});
    notifyListeners();

    String aiResponse = await _chatService.sendMessage(userMessage);
    messages.add({"sender": "bot", "text": aiResponse});
    notifyListeners();
  }
}
