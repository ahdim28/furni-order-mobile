import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

import '../auth/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: LottieBuilder.asset(
                "assets/lottie/loading.json",
              ),
            ),
            const Text(
              'Furni Order',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              )
            ),
            const Text(
              'Semua furniture ada disini',
              style: TextStyle(
                color: Colors.black,
              )
            ),
          ],
        ),
      ),
      nextScreen: const LoginPage(),
      animationDuration: const Duration(seconds: 5),
      splashIconSize: 400,
      backgroundColor: Colors.white,
    );
  }
}