import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';
import 'package:jolly_podcast/core/constants/app_strings.dart';
import 'package:jolly_podcast/core/constants/app_typography.dart';
import 'package:jolly_podcast/presentation/viewmodels/login_viewmodel.dart';
import 'package:jolly_podcast/presentation/views/podcast_list/podcast_list_view.dart';
import 'package:jolly_podcast/presentation/widgets/custom_button.dart';
import 'package:jolly_podcast/presentation/widgets/custom_text_field.dart';

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

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.spacing24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppDimensions.spacing60),
              const Icon(
                Icons.podcasts,
                size: AppDimensions.iconHuge,
                color: AppColors.primary,
              ),
              const SizedBox(height: AppDimensions.spacing24),
              const Text(
                AppStrings.appName,
                style: AppTypography.h1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.spacing8),
              Text(
                'Welcome back',
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.spacing48),
              CustomTextField(
                controller: _phoneController,
                label: AppStrings.phoneNumber,
                hint: AppStrings.phoneNumberHint,
                errorText: viewModel.phoneError,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                prefixIcon: Icons.phone,
                onChanged: (value) {
                  ref.read(loginViewModelProvider).setPhone(value);
                },
              ),
              const SizedBox(height: AppDimensions.spacing20),
              CustomTextField(
                controller: _passwordController,
                label: AppStrings.password,
                hint: AppStrings.passwordHint,
                errorText: viewModel.passwordError,
                isPassword: true,
                textInputAction: TextInputAction.done,
                prefixIcon: Icons.lock,
                onChanged: (value) {
                  ref.read(loginViewModelProvider).setPassword(value);
                },
                onSubmitted: (_) {
                  if (viewModel.isFormValid) {
                    _handleLogin();
                  }
                },
              ),
              if (viewModel.errorMessage != null) ...[
                const SizedBox(height: AppDimensions.spacing16),
                Container(
                  padding: const EdgeInsets.all(AppDimensions.spacing12),
                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                    border: Border.all(
                      color: AppColors.error.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: AppColors.error,
                        size: AppDimensions.iconSmall + AppDimensions.spacing4,
                      ),
                      const SizedBox(width: AppDimensions.spacing8),
                      Expanded(
                        child: Text(
                          viewModel.errorMessage!,
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: AppDimensions.spacing32),
              CustomButton(
                text: AppStrings.loginButton,
                onPressed: viewModel.isFormValid ? _handleLogin : null,
                isLoading: viewModel.isLoading,
                isEnabled: viewModel.isFormValid,
              ),
              const SizedBox(height: AppDimensions.spacing24),
              Text(
                'Test credentials:\nPhone: 08114227399\nPassword: Development@101',
                style: AppTypography.caption.copyWith(
                  color: AppColors.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
