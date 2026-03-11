import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Profile Header
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.deepOrange.shade100,
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Guest User",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "guest@example.com",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-in');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Sign In"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Menu Items
          _buildMenuItem(
            icon: Icons.person_outline,
            title: "Edit Profile",
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.emoji_events_outlined,
            title: "My Challenges",
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.bookmark_outline,
            title: "Saved Items",
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.settings_outlined,
            title: "Settings",
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.help_outline,
            title: "Help & Support",
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.info_outline,
            title: "About",
            onTap: () {},
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepOrange),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
