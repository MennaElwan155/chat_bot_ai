import 'package:flutter/material.dart';
import 'gradient_text.dart';
import 'chat.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for demonstration (replace with actual chat history)
    final List<Map<String, dynamic>> chatHistory = [
      {
        'date': DateTime.now().subtract(const Duration(days: 1)),
        'title': 'Conversation about AI',
        'messages': [
          {'message': 'What is AI?', 'isSender': true, 'time': DateTime.now().subtract(const Duration(days: 1, hours: 1))},
          {'message': 'AI is the simulation of human intelligence by machines.', 'isSender': false, 'time': DateTime.now().subtract(const Duration(days: 1, hours: 1))},
        ],
      },
      {
        'date': DateTime.now().subtract(const Duration(days: 2)),
        'title': 'Productivity Tips',
        'messages': [
          {'message': 'How can I be more productive?', 'isSender': true, 'time': DateTime.now().subtract(const Duration(days: 2, hours: 2))},
          {'message': 'Try time-blocking and prioritize tasks.', 'isSender': false, 'time': DateTime.now().subtract(const Duration(days: 2, hours: 2))},
        ],
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const GradientText(
          'Chat History',
          gradient: LinearGradient(
            colors: [Color(0xFFA770EF), Color(0xFFCF8BF3)],
          ),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF121212), Color(0xFF1A1A2E)],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFFA770EF), Color(0xFFCF8BF3)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.history,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Chat History',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Revisit your past conversations',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            ...chatHistory.map((conversation) => _buildConversationItem(context, conversation)).toList(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildConversationItem(BuildContext context, Map<String, dynamic> conversation) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.purpleAccent.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        iconColor: const Color(0xFFA770EF),
        collapsedIconColor: const Color(0xFFA770EF).withOpacity(0.7),
        title: Text(
          conversation['title'],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          _formatDate(conversation['date']),
          style: TextStyle(
            color: Colors.white70.withOpacity(0.5),
            fontSize: 12,
          ),
        ),
        children: [
          ...conversation['messages'].map<Widget>((msg) => _buildMessageBubble(msg)).toList(),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Navigate to ChatPage with this conversation
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatPage(),
                    settings: RouteSettings(arguments: conversation['messages'][0]['message']),
                  ),
                );
              },
              child: const Text(
                'Continue in Chat',
                style: TextStyle(
                  color: Color(0xFFA770EF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: message['isSender']
            ? const LinearGradient(
          colors: [Color(0xFFA770EF), Color(0xFFCF8BF3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
            : const LinearGradient(
          colors: [Color(0xFF2D2D2D), Color(0xFF1E1E1E)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message['message'],
            style: TextStyle(
              color: message['isSender'] ? Colors.white : Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _formatTime(message['time']),
            style: TextStyle(
              fontSize: 10,
              color: message['isSender'] ? Colors.white.withOpacity(0.7) : Colors.white70.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}