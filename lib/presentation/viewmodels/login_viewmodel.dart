import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jolly_podcast/core/network/network_exceptions.dart';
import 'package:jolly_podcast/core/providers/providers.dart';
import 'package:jolly_podcast/core/utils/validators.dart';

/// {@template login_viewmodel}
/// ViewModel for the login screen.
///
/// Manages login state, form validation, and authentication logic.
/// Uses Riverpod for state management and dependency injection.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class LoginViewModel extends ChangeNotifier {
  LoginViewModel(this._ref);

  final Ref _ref;

  // Form state
  String _phone = '';
  String _password = '';
  String? _phoneError;
  String? _passwordError;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  String get phone => _phone;
  String get password => _password;
  String? get phoneError => _phoneError;
  String? get passwordError => _passwordError;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  bool get isFormValid =>
      _phone.isNotEmpty &&
      _password.isNotEmpty &&
      _phoneError == null &&
      _passwordError == null;

  // Methods
  void setPhone(String value) {
    _phone = value;
    _phoneError = Validators.validatePhoneNumber(value);
    _errorMessage = null;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    _passwordError = Validators.validatePassword(value);
    _errorMessage = null;
    notifyListeners();
  }

  Future<bool> login() async {
    if (!isFormValid) {
      _phoneError = Validators.validatePhoneNumber(_phone);
      _passwordError = Validators.validatePassword(_password);
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final authRepository = _ref.read(authRepositoryProvider);

      // Send phone as-is (API expects: 08114227399)
      await authRepository.login(
        phone: _phone,
        password: _password,
      );

      _isLoading = false;
      notifyListeners();
      return true;
    } on NetworkException catch (e) {
      _isLoading = false;
      _errorMessage = e.message;
      notifyListeners();
      return false;
    } catch (e, stackTrace) {
      _isLoading = false;
      _errorMessage = 'An unexpected error occurred. Please try again.';
      debugPrint('[LOGIN_ERROR] $e');
      debugPrint('[LOGIN_STACKTRACE] $stackTrace');
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}

/// Provider for LoginViewModel
final loginViewModelProvider = ChangeNotifierProvider.autoDispose<LoginViewModel>(
  (ref) => LoginViewModel(ref),
);

/// Provider to check if user is authenticated
final isAuthenticatedProvider = FutureProvider<bool>((ref) async {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.isAuthenticated();
});
