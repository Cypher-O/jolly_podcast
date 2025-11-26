import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/viewmodels/login_viewmodel.dart';
import 'package:jolly_podcast/presentation/views/podcast_list/podcast_list_view.dart';

/// {@template login_view}
/// Login screen for the Jolly Podcast application.
///
/// Single Responsibility: Manages login UI and user interactions.
/// Delegates business logic to LoginViewModel.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final viewModel = ref.read(loginViewModelProvider);
    final success = await viewModel.login();

    if (success && mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const PodcastListView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(loginViewModelProvider);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background image - Full screen
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_bg.png',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          // Dark overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: size.height - MediaQuery.of(context).padding.top,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacing24,
                  ),
                  child: Column(
                    children: [
                      const Spacer(flex: 2),
                      // Jolly Logo
                      Image.asset(
                        'assets/images/jolly_logo_login.png',
                        width: 180,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: AppDimensions.spacing16),
                      // Tagline
                      Text(
                        'PODCASTS FOR',
                        style: AppTypography.h3.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'AFRICA, BY AFRICANS',
                        style: AppTypography.h3.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(flex: 1),
                      // Phone input
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                        ),
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          style: AppTypography.bodyLarge.copyWith(
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter your phone number',
                            hintStyle: AppTypography.bodyLarge.copyWith(
                              color: Colors.grey,
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/images/nigeria_flag.png',
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    height: 24,
                                    width: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ],
                              ),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: AppDimensions.spacing16,
                              vertical: AppDimensions.spacing16,
                            ),
                          ),
                          onChanged: (value) {
                            ref.read(loginViewModelProvider).setPhone(value);
                          },
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spacing12),
                      // Password input
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          style: AppTypography.bodyLarge.copyWith(
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            hintStyle: AppTypography.bodyLarge.copyWith(
                              color: Colors.grey,
                            ),
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: AppColors.primary,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: AppDimensions.spacing16,
                              vertical: AppDimensions.spacing16,
                            ),
                          ),
                          onChanged: (value) {
                            ref.read(loginViewModelProvider).setPassword(value);
                          },
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spacing16),
                      // Continue Button
                      SizedBox(
                        width: double.infinity,
                        height: AppDimensions.buttonHeightLarge,
                        child: ElevatedButton(
                          onPressed: viewModel.isLoading ? null : _handleLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0D5241),
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: const Color(0xFF0D5241),
                            disabledForegroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                          ),
                          child: viewModel.isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                              : Text(
                                  'Continue',
                                  style: AppTypography.button.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                      if (viewModel.errorMessage != null) ...[
                        const SizedBox(height: AppDimensions.spacing12),
                        Text(
                          viewModel.errorMessage!,
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.error,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                      const SizedBox(height: AppDimensions.spacing16),
                      // T&C Text
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: AppTypography.caption.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          children: const [
                            TextSpan(text: 'By proceeding, you agree and accept our '),
                            TextSpan(
                              text: 'T&C',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spacing24),
                      // Become a Creator
                      Text(
                        'BECOME A PODCAST CREATOR',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
