import 'package:flutter/material.dart';
import '../../../../shared/layouts/app_scaffold.dart';

import 'package:coranchallenge/modules/dashboard/presentation/screens/tabs/home_tab.dart' as home;
import 'package:coranchallenge/modules/dashboard/presentation/screens/tabs/news_tab.dart' as news;
import 'package:coranchallenge/modules/dashboard/presentation/screens/tabs/challenge_tab.dart' as challenge;
import 'package:coranchallenge/modules/dashboard/presentation/screens/tabs/video_tab.dart' as video;
import 'package:coranchallenge/modules/dashboard/presentation/screens/tabs/featured_challenge_tab.dart' as featured;
import 'package:coranchallenge/modules/notification/presentation/screens/notification_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int tabIndex = 0;

 final List<Widget> pages = [
  const home.HomeTab(),              // 0 - Home
  const news.NewsTab(),              // 1 - News
  const challenge.ChallengeTab(),    // 2 - Challenges (regular)
  const video.VideoTab(),            // 3 - Video
  const featured.FeaturedChallengeTab(), // 4 - Center FAB - Featured Challenges
  const NotificationScreen(),        // 5 - Notification
];
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      tabIndex: tabIndex,
      onTabChange: (i) {
        setState(() {
          tabIndex = i;
        });
      },
      body: IndexedStack(
        index: tabIndex,
        children: pages,
      ),
    );
  }
}