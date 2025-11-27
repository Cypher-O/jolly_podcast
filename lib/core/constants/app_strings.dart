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
  static const String phoneNumberHint = 'Enter your phone number';
  static const String password = 'Password';
  static const String passwordHint = 'Enter your password';
  static const String passwordRequired = 'Password is required';
  static const String passwordLengthRequirement =
      'Password must be at least 8 characters';
  static const String loginButton = 'Continue';
  static const String loggingIn = 'Logging in...';
  static const String loginSuccess = 'Login successful';
  static const String loginError = 'Login failed. Please try again.';
  static const String podcastsFor = 'PODCASTS FOR';
  static const String africaByAfricans = 'AFRICA, BY AFRICANS';
  static const String becomeCreator = 'BECOME A PODCAST CREATOR';
  static const String termsAndConditions =
      'By proceeding, you agree and accept our ';
  static const String tAndCAbbreviation = 'T&C';

  // Podcast list screen
  static const String podcasts = 'Podcasts';
  static const String topPodcasts = 'Top Podcasts';
  static const String topJolly = 'Top Jolly';
  static const String topJollyPodcasts = 'Top 50 Jolly podcasts';
  static const String noPodcastsAvailable = 'No podcasts available';
  static const String pullToRefresh = 'Pull to refresh';
  static const String logout = 'Logout';
  static const String logoutConfirmation = 'Are you sure you want to logout?';
  static const String cancel = 'Cancel';
  static const String confirm = 'Confirm';
  static const String showMore = 'Show more';
  static const String showLess = 'Show less';
  static const String sortBy = 'Sort by: Ascending';

  // Podcast player screen
  static const String episodes = 'Episodes';
  static const String playEpisode = 'Play Episode';
  static const String pauseEpisode = 'Pause Episode';
  static const String noEpisodesAvailable = 'No episodes available';
  static const String loadingEpisode = 'Loading episode...';
  static const String nowPlaying = 'Now Playing';
  static const String goBack = 'Go back';
  static const String podcast = 'Podcast';
  static const String follow = 'Follow';
  static const String aboutPodcast = 'About Podcast';
  static const String noStatsAvailable = 'No stats available';
  static const String sortByNewest = 'Sort by: Newest';
  static const String filterAllEpisodes = 'Filter: All episodes';

  // Now Playing screen
  static const String addToQueue = 'Add to queue';
  static const String save = 'Save';
  static const String shareEpisode = 'Share episode';
  static const String addToPlaylist = 'Add to playlist';
  static const String goToEpisodePage = 'Go to episode page';

  // Episode menu
  static const String play = 'Play';
  static const String removeFromFavorite = 'Remove from favorite';
  static const String removeFromPlaylist = 'Remove from playlist';

  // Date labels
  static const String today = 'Today';
  static const String yesterday = 'Yesterday';

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
  static const String anErrorOccurred = 'An error occurred';

  // Validation messages
  static const String phoneNumberRequired = 'Phone number is required';
  static const String phoneNumberInvalid = 'Invalid phone number';
  static const String passwordTooShort =
      'Password must be at least 8 characters';

  // Loading messages
  static const String loading = 'Loading...';
  static const String pleaseWait = 'Please wait...';

  // General
  static const String retry = 'Retry';
  static const String ok = 'OK';
  static const String back = 'Back';
}
