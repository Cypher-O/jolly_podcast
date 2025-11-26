import 'package:flutter/material.dart';

/// {@template splash_view}
/// Splash screen for the Jolly Podcast application.
///
/// Displays the Jolly logo with background image
/// matching the Figma design exactly.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-25
/// **Purpose:** Bloocode Technology Recruitment
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background image - Full screen
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_bg.png',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          // Jolly Logo positioned at ~35% from top
          Positioned(
            top: screenHeight * 0.20,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/jolly_logo.png',
                width: screenWidth * 0.6,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
