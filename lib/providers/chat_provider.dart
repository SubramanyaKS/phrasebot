import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:phrasebot/services/chat_service.dart';
import 'package:phrasebot/services/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatProvider with ChangeNotifier {
  final ChatService _chatService = ChatService();
  final SupabaseService _supabaseService = SupabaseService();
  List<Map<String, String>> messages = [];
  List<Map<String,String>> userdetails=[];

  ChatProvider() {
    _init();
  }

  Future<void> getUserProfile() async {
    final supabase = Supabase.instance.client;

    final user = supabase.auth.currentUser;
    if (user != null) {
      userdetails.add({"username":user.userMetadata?['name'],"email":user.email.toString()});
    }
  }

  /// Internal initialization called when provider is constructed.
  /// Attempts to fetch existing conversation messages from Supabase.
  Future<void> _init() async {
    // allow event loop to settle
    await Future.delayed(Duration.zero);
    try {
      final fetched = await _supabaseService.fetchMessage();
      if (fetched.isNotEmpty) {
        messages = fetched.map<Map<String, String>>((m) {
          return {
            'sender': (m['role'] ?? 'unknown').toString(),
            'text': (m['content'] ?? '').toString(),
          };
        }).toList();
        notifyListeners();
        // helpful console log for verification
        log('ChatProvider: fetched ${messages.length} messages from Supabase during init.');
      } else {
        log('ChatProvider: no messages found during init.');
      }
    } catch (e, st) {
      log('ChatProvider: error fetching messages during init: $e\n$st');
    }
  }

  /// Manual method to fetch conversation messages from Supabase on demand.
  Future<void> fetchConversationMessages() async {
    try {
      final fetched = await _supabaseService.fetchMessage();
      messages = fetched.map<Map<String, String>>((m) {
        return {
          'sender': (m['role'] ?? 'unknown').toString(),
          'text': (m['content'] ?? '').toString(),
        };
      }).toList();
      notifyListeners();
      log('ChatProvider: fetched ${messages.length} messages from Supabase (manual).');
    } catch (e, st) {
      log('ChatProvider: error fetching messages (manual): $e\n$st');
    }
  }

  Future<void> sendMessage(String userMessage) async {
    messages.add({"sender": "user", "text": userMessage});
    notifyListeners();
    String conversationId = await _supabaseService.getConversationalID();
     unawaited(_supabaseService.addConversation("user", userMessage, conversationId));

    String aiResponse = await _chatService.sendMessage(userMessage);
    messages.add({"sender": "bot", "text": aiResponse});
    await _supabaseService.addConversation("assistant", aiResponse, conversationId);
    notifyListeners();
    
    
  }
}
