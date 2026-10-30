import 'package:flutter/material.dart';
import 'gradient_text.dart';
import 'chat.dart';

class IdeasPage extends StatelessWidget {
  const IdeasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const GradientText(
          'Creative Ideas',
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
                      color: Colors.purpleAccent.withOpacity(0.4),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.lightbulb,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Get Inspired',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Explore creative prompts and ideas to make the most of your AI assistant',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),

            _buildCategory(
              context,
              'Writing Prompts',
              Icons.edit,
              const Color(0xFFF857A6),
              [
                'Create a short story about a hidden world',
                'Write a poem about nature and technology',
                'Draft an engaging blog introduction about AI',
                'Generate creative social media captions',
                'Create a dialogue between two historical figures',
              ],
            ),
            const SizedBox(height: 20),

            _buildCategory(
              context,
              'Problem Solving',
              Icons.psychology,
              const Color(0xFF4776E6),
              [
                'Brainstorm solutions for climate change',
                'Design a daily productivity system',
                'Create a learning strategy for a new skill',
                'Develop ideas for a community project',
                'Design an innovative mobile app concept',
              ],
            ),
            const SizedBox(height: 20),

            _buildCategory(
              context,
              'Creative Projects',
              Icons.brush,
              const Color(0xFF43CEA2),
              [
                'Design a fictional character profile',
                'Create a concept for a sci-fi universe',
                'Generate ideas for a short film',
                'Plan a themed event or party',
                'Design a board game concept',
              ],
            ),
            const SizedBox(height: 20),

            _buildCategory(
              context,
              'Learning & Knowledge',
              Icons.school,
              const Color(0xFF00B4DB),
              [
                'Explain complex topics in simple terms',
                'Create study guides for various subjects',
                'Learn about different cultures and traditions',
                'Explore philosophical concepts and debates',
                'Discover scientific theories and breakthroughs',
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(BuildContext context, String title, IconData icon, Color color, List<String> ideas) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ExpansionTile(
        iconColor: color,
        collapsedIconColor: color,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        children: ideas.map((idea) => _buildIdeaItem(context, idea, color)).toList(),
      ),
    );
  }

  Widget _buildIdeaItem(BuildContext context, String idea, Color color) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      leading: Icon(Icons.lightbulb_outline, color: color.withOpacity(0.7), size: 20),
      title: Text(
        idea,
        style: const TextStyle(color: Colors.white70, fontSize: 16),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.arrow_forward_ios, size: 18),
        color: color,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatPage(),
              settings: RouteSettings(arguments: idea),
            ),
          );
        },
      ),
    );
  }
}