import 'package:flutter/material.dart';
import '../modules/splash/presentation/screens/splash_screen.dart';
import '../modules/onboarding/presentation/screens/onboarding_screen.dart';
import '../modules/dashboard/presentation/screens/dashboard_screen.dart';
import '../modules/auth/presentation/screens/sign_in_screen.dart';
import '../modules/auth/presentation/screens/sign_up_screen.dart';
import '../modules/auth/presentation/screens/forgot_password_screen.dart';
import '../modules/auth/presentation/screens/reset_password_screen.dart';
import '../modules/auth/presentation/screens/verify_email_screen.dart';
import '../modules/auth/presentation/screens/fill_profile_screen.dart';
import '../modules/news/presentation/screens/news_detail_screen.dart';
import '../modules/notification/presentation/screens/notification_screen.dart';
import 'route_names.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case RouteNames.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );

      case RouteNames.signIn:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );

      case RouteNames.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );

      case RouteNames.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );

      case RouteNames.resetPassword:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        );

      case RouteNames.verifyEmail:
        return MaterialPageRoute(
          builder: (_) => const VerifyEmailScreen(),
        );

      case RouteNames.fillProfile:
        return MaterialPageRoute(
          builder: (_) => const FillProfileScreen(),
        );

      case RouteNames.dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );

      case RouteNames.newsDetail:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => NewsDetailScreen(
            title: args?['title'],
            image: args?['image'],
          ),
        );

      case RouteNames.notification:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
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