/// {@template app_strings}
/// Contains all user-facing strings used in the Jolly Podcast application.
///
/// Centralizing strings makes it easier to maintain consistency,
/// implement localization in the future, and manage text content.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
class AppStrings {
  AppStrings._();

  // App name
  static const String appName = 'Jollycast';

  // Login screen
  static const String login = 'Login';
  static const String phoneNumber = 'Phone Number';
  static const String phoneNumberHint = 'e.g., 08114227399';
  static const String password = 'Password';
  static const String passwordHint = 'Enter your password';
  static const String passwordRequired = 'Password is required';
  static const String passwordLengthRequirement =
      'Password must be at least 8 characters';
  static const String loginButton = 'Login';
  static const String loggingIn = 'Logging in...';
  static const String loginSuccess = 'Login successful';
  static const String loginError = 'Login failed. Please try again.';

  // Podcast list screen
  static const String podcasts = 'Podcasts';
  static const String topPodcasts = 'Top Podcasts';
  static const String noPodcastsAvailable = 'No podcasts available';
  static const String pullToRefresh = 'Pull to refresh';
  static const String logout = 'Logout';
  static const String logoutConfirmation = 'Are you sure you want to logout?';
  static const String cancel = 'Cancel';
  static const String confirm = 'Confirm';

  // Podcast player screen
  static const String episodes = 'Episodes';
  static const String playEpisode = 'Play Episode';
  static const String pauseEpisode = 'Pause Episode';
  static const String noEpisodesAvailable = 'No episodes available';
  static const String loadingEpisode = 'Loading episode...';
  static const String nowPlaying = 'Now Playing';

  // Error messages
  static const String networkError =
      'Network error. Please check your connection.';
  static const String serverError = 'Server error. Please try again later.';
  static const String unauthorizedError = 'Unauthorized. Please login again.';
  static const String notFoundError = 'Resource not found.';
  static const String timeoutError = 'Request timeout. Please try again.';
  static const String unknownError = 'An unknown error occurred.';
  static const String audioLoadError = 'Failed to load audio.';
  static const String audioPlayError = 'Failed to play audio.';

  // Validation messages
  static const String phoneNumberRequired = 'Phone number is required';
  static const String phoneNumberInvalid = 'Invalid phone number';
  static const String passwordTooShort = 'Password must be at least 8 characters';

  // Loading messages
  static const String loading = 'Loading...';
  static const String pleaseWait = 'Please wait...';

  // General
  static const String retry = 'Retry';
  static const String ok = 'OK';
  static const String back = 'Back';
}
