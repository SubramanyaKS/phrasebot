import 'dart:developer';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

Future<void> addConversation(String role,String message, conversationId) async{
  try{
    await supabase.from('messages').insert({'conversation_id': conversationId,
    'role': role,
    'content': message,});
  }
  catch(e,st){
    log("Error while getting/creating conversation: $e\n$st");

  }
}

Future<List<Map<String, dynamic>>> fetchMessage() async{
  var conversationId=await getConversationalID();
  return await supabase
      .from('messages')
      .select()
      .eq('conversation_id', conversationId)
      .order('created_at', ascending: true);
}
  
Future<String> getConversationalID() async {
  try {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception("No authenticated user found.");
    }
    final result = await supabase
        .from('conversations')
        .select('id')
        .eq('user_id', user.id)
        .maybeSingle();

    if (result != null) {
      return result['id'] as String;
    }
    final newConversationId = await createConversationDB();
    return newConversationId;
  
  } catch (e, st) {
    log("Error while getting/creating conversation: $e\n$st");
    return "";
  }
}

Future<String> createConversationDB() async {
  final user = supabase.auth.currentUser;

  if (user == null) {
    return "";
  }
  try{
    final response = await supabase
      .from('conversations')
      .insert([
        {'user_id': user.id, 'title': 'New Chat'}
      ])
      .select('id')
      .single();
      return response['id'];

  }
  catch (e){
    log("Error while creating");
    return "";
  }

}
}
