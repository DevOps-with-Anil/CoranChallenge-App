import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final int tabIndex;
  final Function(int) onTabChange;

  const AppScaffold({
    super.key,
    required this.body,
    required this.tabIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      resizeToAvoidBottomInset: false, // Prevents FAB from moving with keyboard

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              "assets/images/app_logo.png",
              height: 55,
            ),

            const Spacer(),

            // Language Selector with Dropdown
            PopupMenuButton<String>(
              onSelected: (String value) {
                // Handle language change
              },
              offset: const Offset(0, 50),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 163, 163, 163)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "🇬🇧",
                      style: TextStyle(fontSize: 18),
                    ),
                    // SizedBox(width: 8),
                    Text(
                      "EN",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // SizedBox(width: 4),
                    Icon(Icons.arrow_drop_down, size: 16),
                  ],
                ),
              ),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'en',
                  child: Row(
                    children: [
                      Text("🇬🇧", style: TextStyle(fontSize: 22)),
                      SizedBox(width: 8),
                      // Text("English"),
                      Text(
                        "English",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'ar',
                  child: Row(
                    children: [
                      Text("🇸🇦", style: TextStyle(fontSize: 16)),
                      SizedBox(width: 8),
                      Text(
                        "العربية",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'fr',
                  child: Row(
                    children: [
                      Text("🇫🇷", style: TextStyle(fontSize: 16)),
                      SizedBox(width: 8),
                      Text(
                        "Français",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(width: 12),

            const Icon(Icons.menu, size: 26),
          ],
        ),
      ),

      body: body,

      bottomNavigationBar: _buildCustomBottomNav(context),
      floatingActionButton: _buildCenterFAB(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildCustomBottomNav(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Home
          Expanded(
            child: _buildNavItem(
              icon: Icons.home_outlined,
              activeIcon: Icons.home,
              label: "Home",
              index: 0,
            ),
          ),

          // News
          Expanded(
            child: _buildNavItem(
              icon: Icons.campaign_outlined,
              activeIcon: Icons.campaign,
              label: "News",
              index: 1,
            ),
          ),

          // Center space for FAB
          const SizedBox(width: 60),

          // Video
          Expanded(
            child: _buildNavItem(
              icon: Icons.videocam_outlined,
              activeIcon: Icons.videocam,
              label: "Video",
              index: 3,
            ),
          ),

          // Notification
          Expanded(
            child: _buildNavItem(
              icon: Icons.notifications_outlined,
              activeIcon: Icons.notifications,
              label: "Notification",
              index: 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final isActive = tabIndex == index;

    return InkWell(
      onTap: () => onTabChange(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isActive ? activeIcon : icon,
            color: isActive ? Colors.deepOrange : Colors.black87,
            size: 28,
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.deepOrange : Colors.black87,
              fontSize: 13,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 3),
          // Active indicator line
          Container(
            height: 2.5,
            width: 25,
            decoration: BoxDecoration(
              color: isActive ? Colors.deepOrange :  Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

//   Widget _buildCenterFAB(BuildContext context) {
//     final isActive = tabIndex == 4;

//     return Container(
//       width: 60,
//       height: 60,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.deepOrange,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.deepOrange.withValues(alpha: 0.4),
//             blurRadius: 10,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: () => onTabChange(4),
//           customBorder: const CircleBorder(),
//           child: Icon(
//             isActive ? Icons.emoji_events : Icons.emoji_events_outlined,
//             color: Colors.white,
//             size: 30,
//           ),
//         ),
//       ),
//     );
//   }
// }


Widget _buildCenterFAB(BuildContext context) {
  final bool isActive = tabIndex == 4;

  return Container(
    
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isActive ? Colors.deepOrange : Colors.grey,
      boxShadow: [
        BoxShadow(
          color: (isActive ? Colors.deepOrange : Colors.grey)
              .withValues(alpha: 0.4),
          // blurRadius: 10,
          spreadRadius: 8,
        ),
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTabChange(4),
        customBorder: const CircleBorder(),
        child: Icon(
          isActive ? Icons.emoji_events : Icons.emoji_events_outlined,
          color: isActive ? Colors.white : Colors.black54,
          size: 28,
        ),
      ),
    ),
  );
}
}