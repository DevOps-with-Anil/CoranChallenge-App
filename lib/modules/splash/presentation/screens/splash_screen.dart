import 'dart:async';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String version = "";

  @override
  void initState() {
    super.initState();
    _loadVersion();
    _navigate();
  }

  void _loadVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      version = packageInfo.version;
    });
  }

  void _navigate() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteNames.dashboard);
    });
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

                const SizedBox(height: 30),

                const CircularProgressIndicator(),
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