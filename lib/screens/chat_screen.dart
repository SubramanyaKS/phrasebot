import 'package:flutter/material.dart';
import 'package:phrasebot/components/home_drawer.dart';
import 'package:phrasebot/components/ripple_iconbutton.dart';
import 'package:phrasebot/utils/constant.dart';
import 'package:provider/provider.dart';
import 'package:phrasebot/utils/chat_provider.dart';
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
      drawer: HomeDrawer(),
      appBar: AppBar(
          backgroundColor: Color(0xFF192BC2),
          title: Text(
            TITLE.toLowerCase(),
            style: TextStyle(color: Colors.white),
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
          Container(
            // color: Color(0xFF192BC2),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30),
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(fontSize: 20.0),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "Type a message...",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.white, style: BorderStyle.solid),
                          ),
                        ),
                      ),
                    ),
                  ),
                  RippleIconbutton(
                      onTap: () {
                        if (_controller.text.isNotEmpty) {
                          chatProvider.sendMessage(_controller.text);
                          _controller.clear();
                        }
                      },
                      icon: Icons.send),
                  RippleIconbutton(
                      onTap: () {
                        _listen();
                      },
                      icon: isListen ? Icons.mic : Icons.mic_off),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
