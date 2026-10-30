import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'gradient_text.dart';

class ChatPage extends StatefulWidget {
  static const routeName = '/chat';
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _chatHistory = [];

  void getAnswer() async {
    final url = "https://generativelanguage.googleapis.com/v1/models/gemini-2.0-flash:generateContent?key=AIzaSyDdDJ1O1PKqztxP12Ye9Jjarr8Qb9Cogsg";
    final uri = Uri.parse(url);

    List<Map<String, dynamic>> contents = [];
    for (var i = 0; i < _chatHistory.length; i++) {
      contents.add({
        "role": _chatHistory[i]["isSender"] ? "user" : "model",
        "parts": [{"text": _chatHistory[i]["message"]}]
      });
    }

    Map<String, dynamic> request = {
      "contents": contents,
      "generationConfig": {
        "temperature": 0.25,
        "maxOutputTokens": 1000,
        "topP": 1.0,
        "topK": 1,
      }
    };

    try {
      final response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request),
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        final generatedText = responseBody["candidates"][0]["content"]["parts"][0]["text"];

        setState(() {
          _chatHistory.add({
            "time": DateTime.now(),
            "message": generatedText,
            "isSender": false,
          });
        });
      } else {
        setState(() {
          _chatHistory.add({
            "time": DateTime.now(),
            "message": "Error: Failed to get response from API",
            "isSender": false,
          });
        });
      }
    } catch (e) {
      setState(() {
        _chatHistory.add({
          "time": DateTime.now(),
          "message": "Error: $e",
          "isSender": false,
        });
      });
    }

    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const GradientText(
          'AI Assistant',
          gradient: LinearGradient(
            colors: [Color(0xFF9D50BB), Color(0xFF6E48AA)],
          ),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF121212), Color(0xFF1A1A2E)],
                ),
              ),
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _chatHistory.length,
                itemBuilder: (context, index) {
                  return _buildMessageBubble(_chatHistory[index]);
                },
              ),
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: message["isSender"] ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        decoration: BoxDecoration(
          gradient: message["isSender"]
              ? const LinearGradient(
            colors: [Color(0xFF6E48AA), Color(0xFF9D50BB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : const LinearGradient(
            colors: [Color(0xFF2D2D2D), Color(0xFF1E1E1E)],
          ),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: message["isSender"] ? const Radius.circular(20) : const Radius.circular(4),
            bottomRight: message["isSender"] ? const Radius.circular(4) : const Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: message["isSender"]
                  ? Colors.purple.withOpacity(0.3)
                  : Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message["message"],
              style: TextStyle(
                color: message["isSender"] ? Colors.white : Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              _formatTime(message["time"]),
              style: TextStyle(
                fontSize: 10,
                color: message["isSender"]
                    ? Colors.white.withOpacity(0.7)
                    : Colors.white70.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2D2D2D),
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: _chatController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Type a message...",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF9D50BB), Color(0xFF6E48AA)],
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                if (_chatController.text.isNotEmpty) {
                  setState(() {
                    _chatHistory.add({
                      "time": DateTime.now(),
                      "message": _chatController.text,
                      "isSender": true,
                    });
                    _chatController.clear();
                  });
                  getAnswer();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}