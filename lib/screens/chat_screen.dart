import 'package:flutter/material.dart';
import 'package:phrasebot/utils/constant.dart';
import 'package:provider/provider.dart';
import 'package:phrasebot/providers/chat_provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final TextEditingController _controller = TextEditingController();
  bool isListen = false;

  void _listen() async {
    if (!isListen) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => isListen = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _controller.text = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => isListen = false);
      _speech.stop();
    }
  }
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    return Scaffold(
      // drawer: HomeDrawer(),
      appBar: AppBar(
          title: Text(
            TITLE.toLowerCase(),
          )),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                var msg = chatProvider.messages[index];
                return Align(
                  alignment: msg["sender"] == "user"
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: msg["sender"] == "user"
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(msg["text"]!,
                        style: TextStyle(
                            color: msg["sender"] == "user"
                                ? Colors.white
                                : Colors.black)),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.blueAccent),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        chatProvider.sendMessage(_controller.text);
                        _controller.clear();
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(isListen ? Icons.mic : Icons.mic_off, color: Colors.grey),
                    onPressed: () { _listen();},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
