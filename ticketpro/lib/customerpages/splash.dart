import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketpro/headerWidget.dart';
import 'package:ticketpro/customerpages/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double headerOpacity = 0.0;
  double firstTextOpacity = 0.0;
  double secondTextOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        headerOpacity = 1.0;
      });
    });
    Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        firstTextOpacity = 1.0;
      });
    });
    Timer(const Duration(milliseconds: 4000), () {
      setState(() {
        secondTextOpacity = 1.0;
      });
    });
    Timer(const Duration(milliseconds: 6000), () {
      Get.to(const LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: headerOpacity,
                child: const MyAppHeader(),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1000),
                    opacity: firstTextOpacity,
                    child: const Text(
                      "We offer online tickets",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1000),
                    opacity: secondTextOpacity,
                    child: const Text(
                      "across cities of Rwanda",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
