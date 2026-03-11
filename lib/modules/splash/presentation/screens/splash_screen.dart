import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String version = "1.0.0";

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() async {
    // Wait for 3 seconds
    await Future.delayed(const Duration(seconds: 3));
    
    // Check if first time launch
    final prefs = await SharedPreferences.getInstance();
    final bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    
    if (!mounted) return;
    
    if (isFirstTime) {
      // First time - show onboarding
      Navigator.pushReplacementNamed(context, RouteNames.onboarding);
    } else {
      // Not first time - go to dashboard
      Navigator.pushReplacementNamed(context, RouteNames.dashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [

          /// Center Logo
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Image.asset(
                  "assets/images/app_logo.png",
                  width: 200,
                ),

              ],
            ),
          ),

          /// Bottom Text
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [

                const Text(
                  "Powered by MK Projects",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 53, 53, 53),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "Version $version",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 53, 53, 53),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}