import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:phrasebot/utils/environment.dart';

class ChatService {
  final Dio _dio = Dio();
  final String apiKey = Environment.huggingfaceKey; // Get from Hugging Face
  final String apiUrl = Environment.huggingfaceURL;
  final String model = Environment.model;

  final String googleGemini = Environment.googleGemini;
  final String googleAPI = Environment.googleAPI;

  Future<String> sendMessage(String message) async {
    int retryCount = 0;
    const int maxRetries = 3;
    const int baseWaitTime = 2;
    while (retryCount < maxRetries) {
      try {
        Response response = await _dio.post(
          googleGemini,
          options: Options(headers: {"X-goog-api-key": googleAPI}),
          data: {
            "contents": [
              {
                "parts": [
                  {"text": "Answer in max 1 lines only:\n$message"}
                ]
              }
            ]
          },
        );

        if (response.statusCode == 200) {
          return response.data["candidates"]?[0]?["content"]?["parts"]?[0]
              ?["text"];
        } else if (response.statusCode == 503) {
          retryCount++;
          int waitTime = baseWaitTime * retryCount; // Exponential backoff
          debugPrint("503 Error - Retrying in $waitTime seconds...");
          await Future.delayed(Duration(seconds: waitTime));
        } else {
          return "Error: ${response.statusMessage}";
        }
      } catch (e) {
        return "Error: Unable to fetch response. $e";
      }
    }
    return "Service unavailable. Please try again later.";
  }
}
