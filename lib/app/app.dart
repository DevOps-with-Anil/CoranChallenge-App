// import 'package:flutter/material.dart';

// import '../app/app_routes.dart';
// import '../routes/route_names.dart';
// // import 'app_theme.dart';

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Coran Challenge",
//       debugShowCheckedModeBanner: false,

//       // Theme
//       // theme: AppTheme.lightTheme,

//       // Initial Screen
//       initialRoute: RouteNames.splash,

//       // Route Generator
//       onGenerateRoute: AppRoutes.generateRoute,

//       // Fallback page
//       onUnknownRoute: (settings) {
//         return MaterialPageRoute(
//           builder: (_) => const Scaffold(
//             body: Center(
//               child: Text("Page not found"),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }


import 'package:coranchallenge/routes/route_names.dart';
import 'package:flutter/material.dart';
import '../routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: RouteNames.splash,
    );
  }
}