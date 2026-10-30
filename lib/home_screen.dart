import 'package:flutter/material.dart';
import 'chat.dart';
import 'gradient_text.dart';
import 'ideas_page.dart';
import 'help_page.dart';
import 'settings_page.dart';
import 'profile_page.dart';
import 'favorites_page.dart';
import 'history_page.dart';
import 'feedback_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF121212), Color(0xFF1A1A2E)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF9D50BB), Color(0xFF6E48AA)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purpleAccent.withOpacity(0.5),
                        blurRadius: 25,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.smart_toy_rounded,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const GradientText(
                'AI Assistant',
                gradient: LinearGradient(
                  colors: [Color(0xFF9D50BB), Color(0xFF4776E6)],
                ),
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text(
                  'Your personal AI chat assistant powered by advanced machine learning',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    padding: const EdgeInsets.only(bottom: 20),
                    children: [
                      _buildFeatureCard(
                        context,
                        Icons.chat_bubble_outline,
                        'Chat',
                        'Start a conversation',
                        const Color(0xFF6E48AA),
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatPage(),
                          ),
                        ),
                      ),
                      _buildFeatureCard(
                        context,
                        Icons.lightbulb_outline,
                        'Ideas',
                        'Creative suggestions',
                        const Color(0xFF4776E6),
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IdeasPage(),
                          ),
                        ),
                      ),
                      _buildFeatureCard(
                        context,
                        Icons.help_outline,
                        'Help',
                        'App instructions',
                        const Color(0xFF00B4DB),
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HelpPage(),
                          ),
                        ),
                      ),
                      _buildFeatureCard(
                        context,
                        Icons.settings,
                        'Settings',
                        'Customize experience',
                        const Color(0xFF8E54E9),
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsPage(),
                          ),
                        ),
                      ),
                      _buildFeatureCard(
                        context,
                        Icons.person_outline,
                        'Profile',
                        'Manage your profile',
                        const Color(0xFFF857A6),
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        ),
                      ),
                      _buildFeatureCard(
                        context,
                        Icons.favorite_outline,
                        'Favorites',
                        'View saved items',
                        const Color(0xFF43CEA2),
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FavoritesPage(),
                          ),
                        ),
                      ),
                      _buildFeatureCard(
                        context,
                        Icons.history,
                        'History',
                        'Past conversations',
                        const Color(0xFFA770EF),
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HistoryPage(),
                          ),
                        ),
                      ),
                      _buildFeatureCard(
                        context,
                        Icons.feedback,
                        'Feedback',
                        'Share your thoughts',
                        const Color(0xFFFFB347),
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FeedbackPage(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9D50BB),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                    shadowColor: Colors.purpleAccent.withOpacity(0.5),
                  ),
                  child: const Text(
                    'Start Chatting',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
      BuildContext context,
      IconData icon,
      String title,
      String subtitle,
      Color color,
      VoidCallback onTap,
      ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withOpacity(0.9),
              color.withOpacity(0.7),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}