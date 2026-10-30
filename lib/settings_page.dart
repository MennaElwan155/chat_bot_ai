import 'package:flutter/material.dart';
import 'gradient_text.dart';
import 'feedback_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = true;
  bool _notifications = true;
  double _fontSize = 16;
  String _language = 'English';
  String _aiModel = 'Gemini 1.5 Pro';
  bool _saveHistory = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const GradientText(
          'Settings',
          gradient: LinearGradient(
            colors: [Color(0xFF4776E6), Color(0xFF8E54E9)],
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
                    colors: [Color(0xFF4776E6), Color(0xFF8E54E9)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.settings,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Customize Your Experience',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            _buildSettingsSection(
              'Appearance',
              const Color(0xFF4776E6),
              [
                _buildSwitchSetting(
                  'Dark Mode',
                  'Use dark theme for the app',
                  Icons.brightness_4,
                  _darkMode,
                      (value) {
                    setState(() {
                      _darkMode = value;
                    });
                  },
                ),
                _buildSliderSetting(
                  'Font Size',
                  'Adjust text size in conversations',
                  Icons.format_size,
                  _fontSize,
                  12,
                  20,
                      (value) {
                    setState(() {
                      _fontSize = value;
                    });
                  },
                ),
                _buildDropdownSetting(
                  'Language',
                  'Select app language',
                  Icons.language,
                  _language,
                  ['English', 'Arabic', 'Spanish', 'French', 'German'],
                      (value) {
                    setState(() {
                      _language = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSettingsSection(
              'AI Settings',
              const Color(0xFF8E54E9),
              [
                _buildDropdownSetting(
                  'AI Model',
                  'Choose which AI model to use',
                  Icons.psychology,
                  _aiModel,
                  ['Gemini 1.5 Pro','Claude','Chat GPT','Deep Seek','Grok'],
                      (value) {
                    setState(() {
                      _aiModel = value!;
                    });
                  },
                ),
                _buildSwitchSetting(
                  'Save Chat History',
                  'Store conversations for future reference',
                  Icons.history,
                  _saveHistory,
                      (value) {
                    setState(() {
                      _saveHistory = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSettingsSection(
              'Notifications',
              const Color(0xFF43CEA2),
              [
                _buildSwitchSetting(
                  'Push Notifications',
                  'Receive alerts and updates',
                  Icons.notifications,
                  _notifications,
                      (value) {
                    setState(() {
                      _notifications = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSettingsSection(
              'Account',
              const Color(0xFFF857A6),
              [
                _buildActionSetting(
                  'Account Information',
                  'View and edit your profile',
                  Icons.person,
                      () {
                    // Navigate to account info screen
                  },
                ),
                _buildActionSetting(
                  'Send Feedback',
                  'Share your thoughts about the app',
                  Icons.feedback,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FeedbackPage(),
                      ),
                    );
                  },
                ),
                _buildActionSetting(
                  'Privacy Policy',
                  'Read our privacy policy',
                  Icons.privacy_tip,
                      () {
                    // Navigate to privacy policy screen
                  },
                ),
                _buildActionSetting(
                  'Terms of Service',
                  'Read our terms of service',
                  Icons.description,
                      () {
                    // Navigate to terms of service screen
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: ElevatedButton(
                onPressed: () {
                  // Sign out functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF857A6),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(String title, Color color, List<Widget> items) {
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
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(height: 1, color: Color(0xFF2D2D2D)),
          ...items,
        ],
      ),
    );
  }

  Widget _buildSwitchSetting(String title, String subtitle, IconData icon, bool value, Function(bool) onChanged) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.white54, fontSize: 12),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.blueAccent,
        activeTrackColor: Colors.blueAccent.withOpacity(0.3),
      ),
    );
  }

  Widget _buildSliderSetting(String title, String subtitle, IconData icon, double value, double min, double max, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.blueAccent),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
          trailing: Text(
            value.toInt().toString(),
            style: const TextStyle(color: Colors.white70),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.blueAccent,
              inactiveTrackColor: Colors.blueAccent.withOpacity(0.3),
              thumbColor: Colors.blueAccent,
              overlayColor: Colors.blueAccent.withOpacity(0.2),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
            ),
            child: Slider(
              value: value,
              min: min,
              max: max,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownSetting(String title, String subtitle, IconData icon, String value, List<String> options, Function(String?) onChanged) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.white54, fontSize: 12),
      ),
      trailing: DropdownButton<String>(
        value: value,
        onChanged: onChanged,
        dropdownColor: const Color(0xFF2D2D2D),
        underline: Container(
          height: 1,
          color: Colors.blueAccent,
        ),
        style: const TextStyle(color: Colors.white),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
        items: options.map<DropdownMenuItem<String>>((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildActionSetting(String title, String subtitle, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.white54, fontSize: 12),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
      onTap: onTap,
    );
  }
}