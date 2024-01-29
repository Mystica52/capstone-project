import 'package:flutter/material.dart';
import 'package:ticketpro/customerpages/allBuses.dart';
import 'package:ticketpro/customerpages/login.dart';
import 'package:ticketpro/customerpages/signup.dart';
import 'package:ticketpro/customerpages/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const Splash());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupPage());
      case '/signin':
        // return MaterialPageRoute(builder: (_) => const SignInPage());
        // case '/setting':
        // return MaterialPageRoute(builder: (_) =>  const SettingsFourPage());
      default:
        return MaterialPageRoute(builder: (_) => const AllBuses());
    }
  }
}