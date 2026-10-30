import 'package:flutter/material.dart';
import 'gradient_text.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const GradientText(
          'Help & Support',
          gradient: LinearGradient(
            colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
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
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.help_outline,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'How can we help you?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            _buildHelpSection(
              'Getting Started',
              const Color(0xFF00B4DB),
              [
                _HelpItem(
                  'What can this AI assistant do?',
                  'Our AI assistant can answer questions, generate creative content, help with problem-solving, provide information on various topics, and engage in conversations.',
                ),
                _HelpItem(
                  'How do I start a conversation?',
                  'Simply tap on the "Chat" option from the home screen or press the "Start Chatting" button, then type your message in the text field at the bottom of the screen.',
                ),
                _HelpItem(
                  'Is my conversation private?',
                  'Your conversations are processed securely. We prioritize your privacy and do not store conversations for longer than necessary to provide our service.',
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildHelpSection(
              'Tips for Best Results',
              const Color(0xFF43CEA2),
              [
                _HelpItem(
                  'Be specific with your requests',
                  'The more specific your question or request, the better the AI can assist you. Add details that help clarify what you\'re looking for.',
                ),
                _HelpItem(
                  'Ask follow-up questions',
                  'If the initial response doesn\'t fully address your needs, ask follow-up questions to get more information or clarification.',
                ),
                _HelpItem(
                  'Try different approaches',
                  'If you\'re not getting the results you want, try rephrasing your question or breaking complex requests into smaller parts.',
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildHelpSection(
              'Troubleshooting',
              const Color(0xFF4776E6),
              [
                _HelpItem(
                  'The AI response is taking too long',
                  'Check your internet connection. Complex questions may take longer to process. If problems persist, try restarting the app.',
                ),
                _HelpItem(
                  'I\'m getting error messages',
                  'Make sure you have the latest version of the app installed. If errors continue, please contact our support team.',
                ),
                _HelpItem(
                  'The AI misunderstood my question',
                  'Try rephrasing your question to be more clear and specific. Remember that the AI has knowledge limitations and may not understand every context.',
                ),
              ],
            ),
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyanAccent.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Still need help?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      // Implement contact support functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF0083B0),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Contact Support',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpSection(String title, Color color, List<_HelpItem> items) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(height: 1, color: Color(0xFF2D2D2D)),
          ...items.map((item) => _buildExpandableHelpItem(item, color)).toList(),
        ],
      ),
    );
  }

  Widget _buildExpandableHelpItem(_HelpItem item, Color color) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      iconColor: color,
      collapsedIconColor: color.withOpacity(0.7),
      title: Text(
        item.question,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      children: [
        Text(
          item.answer,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _HelpItem {
  final String question;
  final String answer;

  _HelpItem(this.question, this.answer);
}