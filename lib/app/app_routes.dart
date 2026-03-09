import 'package:flutter/material.dart';
import '../routes/route_names.dart';

import '../modules/splash/presentation/screens/splash_screen.dart';
import '../modules/dashboard/presentation/screens/dashboard_screen.dart';

class AppRoutes {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {

      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case RouteNames.dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Page Not Found"),
            ),
          ),
        );
    }
  }

}