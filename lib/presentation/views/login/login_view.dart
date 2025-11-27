import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/core/constants/app_assets.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_strings.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/viewmodels/login_viewmodel.dart';
import 'package:jolly_podcast/presentation/views/podcast_list/podcast_list_view.dart';
import 'package:jolly_podcast/presentation/widgets/app_text.dart';

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
              AppAssets.loginBackground,
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
                    AppColors.textOnPrimary.withOpacity(0.4),
                    AppColors.textOnPrimary.withOpacity(0.7),
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
                      const Spacer(flex: 6),
                      // Jolly Logo
                      Image.asset(
                        AppAssets.jollyLogoLogin,
                        width: AppDimensions.loginLogoWidth,
                        height: AppDimensions.loginLogoHeight,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: AppDimensions.spacing16),
                      // Tagline
                      const AppText(
                        AppStrings.podcastsFor,
                        style: AppTypography.h3,
                        fontSize: AppTypography.fontSize28,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                        textAlign: TextAlign.center,
                      ),
                      const AppText(
                        AppStrings.africaByAfricans,
                        style: AppTypography.h3,
                        fontSize: AppTypography.fontSize28,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppDimensions.spacing32),
                      // Phone input
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.textPrimary,
                          borderRadius: BorderRadius.circular(
                              AppDimensions.radiusXXLarge),
                        ),
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          style: AppTypography.bodyLarge.copyWith(
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                            hintText: AppStrings.phoneNumberHint,
                            hintStyle: AppTypography.bodyLarge.copyWith(
                              color: Colors.grey,
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimensions.spacing12),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    AppAssets.nigeriaFlag,
                                    width: AppDimensions.iconMedium,
                                    height: AppDimensions.iconMedium,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(width: AppDimensions.spacing8),
                                  Container(
                                    height: AppDimensions.iconMedium,
                                    width: AppDimensions.separatorHeight,
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
                          color: AppColors.textPrimary,
                          borderRadius: BorderRadius.circular(
                              AppDimensions.radiusXXLarge),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          style: AppTypography.bodyLarge.copyWith(
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                            hintText: AppStrings.passwordHint,
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
                            backgroundColor: AppColors.buttonDark,
                            foregroundColor: AppColors.textPrimary,
                            disabledBackgroundColor: AppColors.buttonDark,
                            disabledForegroundColor: AppColors.textPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.radiusButtonLarge),
                            ),
                            elevation: 0,
                          ),
                          child: viewModel.isLoading
                              ? const SizedBox(
                                  height: AppDimensions.loadMoreIndicatorSize,
                                  width: AppDimensions.loadMoreIndicatorSize,
                                  child: CircularProgressIndicator(
                                    strokeWidth: AppDimensions.borderThick25,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.textPrimary,
                                    ),
                                  ),
                                )
                              : const AppText(
                                  AppStrings.loginButton,
                                  style: AppTypography.button,
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                        ),
                      ),
                      if (viewModel.errorMessage != null) ...[
                        const SizedBox(height: AppDimensions.spacing12),
                        AppText(
                          viewModel.errorMessage!,
                          style: AppTypography.bodyMedium,
                          color: AppColors.error,
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
                            TextSpan(
                              text: AppStrings.termsAndConditions,
                              style: TextStyle(
                                fontFamily: 'FuturaPT',
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w400,
                                fontSize: AppTypography.fontSize16,
                              ),
                            ),
                            TextSpan(
                              text: AppStrings.tAndCAbbreviation,
                              style: TextStyle(
                                fontFamily: 'FuturaPT',
                                decoration: TextDecoration.underline,
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w400,
                                fontSize: AppTypography.fontSize16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spacing24),
                      // Become a Creator
                      const AppText(
                        AppStrings.becomeCreator,
                        style: AppTypography.bodyMedium,
                        color: AppColors.textPrimary,
                        fontFamily: 'FuturaPT',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
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
