import 'package:flutter/material.dart';
import '../../../../shared/layouts/app_scaffold.dart';

import 'package:coranchallenge/modules/dashboard/presentation/screens/tabs/home_tab.dart' as home;
import 'package:coranchallenge/modules/dashboard/presentation/screens/tabs/news_tab.dart' as news;
import 'package:coranchallenge/modules/dashboard/presentation/screens/tabs/challenge_tab.dart' as challenge;
import 'package:coranchallenge/modules/dashboard/presentation/screens/tabs/video_tab.dart' as video;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int tabIndex = 0;

 final List<Widget> pages = [
  const home.HomeTab(),
  const news.NewsTab(),
  const challenge.ChallengeTab(),
  const video.VideoTab(),
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