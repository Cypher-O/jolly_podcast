/// {@template app_text_examples}
/// Usage examples for the AppText widget
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment
///
/// This file demonstrates various ways to use the AppText widget.
/// Delete this file after reviewing the examples.

import 'package:flutter/material.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';

class AppTextExamples extends StatelessWidget {
  const AppTextExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppText Examples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Example 1: Basic usage with different font weights
            const AppText(
              'Extra Light (200)',
              fontSize: 20,
              fontWeight: FontWeight.w200,
            ),
            const SizedBox(height: 8),
            const AppText(
              'Light (300)',
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
            const SizedBox(height: 8),
            const AppText(
              'Regular (400)',
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 8),
            const AppText(
              'Medium (500)',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 8),
            const AppText(
              'Semi Bold (600)',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 8),
            const AppText(
              'Bold (700)',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 8),
            const AppText(
              'Extra Bold (800)',
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
            const SizedBox(height: 8),
            const AppText(
              'Black (900)',
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
            const SizedBox(height: 24),

            // Example 2: Using convenience methods
            AppText.heading('This is a heading'),
            const SizedBox(height: 8),
            AppText.subheading('This is a subheading'),
            const SizedBox(height: 8),
            AppText.body('This is body text with regular weight'),
            const SizedBox(height: 8),
            AppText.caption('This is caption text'),
            const SizedBox(height: 8),
            AppText.button('This is button text'),
            const SizedBox(height: 24),

            // Example 3: With colors
            const AppText(
              'Colored text',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
            const SizedBox(height: 24),

            // Example 4: With text alignment and overflow
            const AppText(
              'This is a very long text that will be truncated with ellipsis when it exceeds the maximum number of lines',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 24),

            // Example 5: With italic style
            const AppText(
              'Italic text',
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
            const SizedBox(height: 24),

            // Example 6: With text decoration
            const AppText(
              'Underlined text',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
            ),
            const SizedBox(height: 24),

            // Example 7: With letter spacing and line height
            const AppText(
              'Text with custom spacing',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 2.0,
              height: 1.5,
            ),
            const SizedBox(height: 24),

            // Example 8: Practical usage in your app
            const Divider(),
            const SizedBox(height: 16),
            AppText.heading('Welcome to Jollycast'),
            const SizedBox(height: 8),
            AppText.body(
              'Discover amazing podcasts and listen to your favorite episodes',
              color: Colors.grey[600],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: AppText.button('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
