// import 'package:flutter/material.dart';
// import 'app/app_routes.dart';
// import 'routes/route_names.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Coran Challenge',

//       initialRoute: RouteNames.splash,

//       onGenerateRoute: AppRoutes.generateRoute,

//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}