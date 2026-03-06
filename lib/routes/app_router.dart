// import 'package:flutter/material.dart';
// import '../modules/splash/presentation/screens/splash_screen.dart';
// import '../modules/dashboard/presentation/screens/dashboard_screen.dart';
// import 'route_names.dart';

// class AppRouter {

//   static Route generateRoute(RouteSettings settings) {

//     switch (settings.name) {

//       case RouteNames.splash:
//         return MaterialPageRoute(builder: (_) => const SplashScreen());

//       case RouteNames.dashboard:
//         return MaterialPageRoute(builder: (_) => const DashboardScreen());

//       default:
//         return MaterialPageRoute(
//           builder: (_) => const Scaffold(
//             body: Center(child: Text("Page Not Found")),
//           ),
//         );
//     }
//   }
// }

import 'package:flutter/material.dart';
import '../modules/dashboard/presentation/screens/dashboard_screen.dart';
import '../modules/splash/presentation/screens/splash_screen.dart';
import 'route_names.dart';

class AppRouter {

  static Route generateRoute(RouteSettings settings) {

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
          builder: (_) => const SplashScreen(),
        );
    }
  }
}