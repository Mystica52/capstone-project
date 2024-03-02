import 'package:flutter/material.dart';
import 'package:ticketpro1/customerpages/allBuses.dart';
import 'package:ticketpro1/customerpages/login.dart';
import 'package:ticketpro1/customerpages/signup.dart';
import 'package:ticketpro1/customerpages/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Splash());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const Splash());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupPage());
      case '/signin':
        return MaterialPageRoute(builder: (_) => const LoginPage());
        // case '/setting':
        // return MaterialPageRoute(builder: (_) =>  const SettingsFourPage());
      default:
        return MaterialPageRoute(builder: (_) =>  AllBuses());
    }
  }
}