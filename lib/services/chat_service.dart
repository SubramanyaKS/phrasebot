import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:phrasebot/utils/environment.dart';

class ChatService {
  final Dio _dio = Dio();
  final String apiKey = Environment.huggingfaceKey; // Get from Hugging Face
  final String apiUrl = Environment.huggingfaceURL;
  final String model = Environment.model;


  Future<String> sendMessage(String message) async {
    int retryCount = 0;
    const int maxRetries = 3; // Number of retry attempts
    const int baseWaitTime = 2; // Initial wait time in seconds
    while (retryCount < maxRetries) {
      print(apiUrl);
      try {
        Response response = await _dio.post(
          apiUrl,
          options: Options(headers: {"Authorization": "Bearer $apiKey"}),
          data: {"messages": [
            {
              "role": "user",
              "content": message
            }
          ],
            "model": model,
            "stream": false},
        );

        if (response.statusCode == 200) {
          return response.data["choices"][0]["message"]["content"];
        } else if (response.statusCode == 503) {
          retryCount++;
          int waitTime = baseWaitTime * retryCount; // Exponential backoff
          debugPrint("503 Error - Retrying in $waitTime seconds...");
          await Future.delayed(Duration(seconds: waitTime));
        } else {
          return "Error: ${response.statusMessage}";
        }
      } catch (e) {
        print(e);
        return "Error: Unable to fetch response. ${e}";
      }
    }
    return "Service unavailable. Please try again later.";
  }
}
