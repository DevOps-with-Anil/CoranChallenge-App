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

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              "assets/images/app_logo.png",
              height: 45,
            ),

            const Spacer(),

            const Icon(Icons.notifications_none),
            const SizedBox(width: 26),
            const Icon(Icons.menu),
          ],
        ),
      ),

      body: body,

     bottomNavigationBar: BottomNavigationBar(
  currentIndex: tabIndex,
  onTap: onTabChange,
  //   showSelectedLabels: false,
  // showUnselectedLabels: false,

  type: BottomNavigationBarType.fixed,

  selectedItemColor: Colors.deepOrange,
  unselectedItemColor: const Color.fromARGB(255, 46, 46, 46),

  iconSize: 32,              // 👈 Bigger icons
  selectedFontSize: 14,
  unselectedFontSize: 12,

  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: "Home",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.article_outlined),
      activeIcon: Icon(Icons.article),
      label: "News",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.emoji_events_outlined),
      activeIcon: Icon(Icons.emoji_events),
      label: "Challenges",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.video_collection_outlined),
      activeIcon: Icon(Icons.video_collection),
      label: "Videos",
    ),
  ],
),
    );
  }
}