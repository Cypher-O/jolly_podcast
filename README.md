# Jolly Podcast App

A professional Flutter podcast application built for Bloocode Technology recruitment assessment. This app demonstrates clean architecture principles, MVVM pattern, and modern Flutter development practices.

## Overview

Jolly Podcast is a mobile application that allows users to browse, discover, and listen to podcasts. The app features user authentication, a curated list of top podcasts, and a fully functional audio player with playback controls.

## Features

- **User Authentication**: Secure login with phone number and password
- **Podcast Discovery**: Browse top Jolly podcasts with beautiful card layouts
- **Podcast Player**: Full-featured audio player with:
  - Play/Pause controls
  - Seek bar with time display
  - Skip forward/backward (10 seconds)
  - Episode selection
  - Visual feedback for current episode
- **Persistent Authentication**: Token-based authentication that persists across app restarts
- **Pull-to-Refresh**: Refresh podcast list with a simple pull gesture
- **Error Handling**: Comprehensive error handling with user-friendly messages and global error boundary
- **Build Flavors**: Support for dev, staging, and production environments
- **Error Monitoring**: runZonedGuarded implementation for catching all uncaught errors
- **Responsive UI**: Clean, modern interface that adapts to different screen sizes

## Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

### MVVM Pattern

The app implements the Model-View-ViewModel pattern:

- **Model**: Data layer (DTOs, entities, repositories)
- **View**: Presentation layer (screens/views)
- **ViewModel**: Business logic layer (state management)

### Folder Structure

```
lib/
├── core/                           # Core utilities and configurations
│   ├── constants/                  # App-wide constants
│   │   ├── api_constants.dart     # API endpoints and configurations
│   │   ├── app_colors.dart        # Color palette
│   │   └── app_strings.dart       # User-facing strings
│   ├── network/                    # Networking layer
│   │   ├── dio_client.dart        # Configured Dio HTTP client
│   │   ├── api_interceptor.dart   # Request/response interceptor
│   │   └── network_exceptions.dart # Custom exception classes
│   ├── security/                   # Security utilities
│   │   └── secure_storage_service.dart # Token storage service
│   ├── utils/                      # Utility functions
│   │   └── validators.dart        # Input validation logic
│   └── providers/                  # Riverpod providers
│       └── providers.dart         # Dependency injection setup
├── data/                           # Data layer
│   ├── models/                     # DTOs with JSON serialization
│   │   ├── login_request_dto.dart
│   │   ├── login_response_dto.dart
│   │   ├── podcast_dto.dart
│   │   ├── episode_dto.dart
│   │   └── user_dto.dart
│   ├── repositories/               # Repository implementations
│   │   ├── auth_repository_impl.dart
│   │   └── podcast_repository_impl.dart
│   └── datasources/               # Remote data sources
│       ├── auth_remote_datasource.dart
│       └── podcast_remote_datasource.dart
├── domain/                         # Domain/Business logic layer
│   ├── entities/                   # Business entities
│   │   ├── user.dart
│   │   ├── podcast.dart
│   │   └── episode.dart
│   └── repositories/              # Repository interfaces
│       ├── auth_repository.dart
│       └── podcast_repository.dart
└── presentation/                   # Presentation layer
    ├── views/                      # Screen/Page widgets
    │   ├── login/
    │   │   └── login_view.dart
    │   ├── podcast_list/
    │   │   └── podcast_list_view.dart
    │   └── podcast_player/
    │       └── podcast_player_view.dart
    ├── viewmodels/                 # ViewModels for state management
    │   ├── login_viewmodel.dart
    │   ├── podcast_list_viewmodel.dart
    │   └── podcast_player_viewmodel.dart
    └── widgets/                    # Reusable UI components
        ├── custom_button.dart
        ├── custom_text_field.dart
        ├── podcast_card.dart
        ├── episode_card.dart
        └── loading_indicator.dart
```

### Why This Architecture?

1. **Separation of Concerns**: Each layer has a specific responsibility
2. **Testability**: Business logic is isolated and easy to test
3. **Maintainability**: Changes in one layer don't affect others
4. **Scalability**: Easy to add new features without breaking existing code
5. **Dependency Inversion**: High-level modules don't depend on low-level modules

## State Management

### Riverpod Implementation

The app uses **Riverpod** for state management, chosen for:

- Type safety and compile-time checking
- No BuildContext required for providers
- Better testability
- Automatic disposal of unused state
- Support for async operations with AsyncValue

### Provider Hierarchy

```
ProviderScope (Root)
├── secureStorageProvider
├── secureStorageServiceProvider
├── dioClientProvider
├── authRemoteDatasourceProvider
├── podcastRemoteDatasourceProvider
├── authRepositoryProvider
├── podcastRepositoryProvider
├── loginViewModelProvider
├── podcastListViewModelProvider
└── podcastPlayerViewModelProvider
```

### State Flow

1. **View** watches ViewModel provider
2. **ViewModel** reads Repository provider
3. **Repository** uses DataSource to fetch data
4. **DataSource** makes API calls via DioClient
5. **DioClient** uses Interceptor to add auth token
6. **Interceptor** reads token from SecureStorage

## Setup Instructions

### Prerequisites

- Flutter SDK (>=3.3.3 <4.0.0)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- An emulator or physical device

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd jolly_podcast
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run code generation**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**

   **Production (default)**:
   ```bash
   flutter run
   ```

   **Development flavor**:
   ```bash
   flutter run -t lib/main_dev.dart
   ```

   **Staging flavor**:
   ```bash
   flutter run -t lib/main_staging.dart
   ```

   For more details on flavors, see [FLAVORS.md](FLAVORS.md)

## API Endpoints Used

**Base URL**: `http://13.49.46.240:9000`

### Authentication
- **POST** `/api/auth/login` - User login with phone and password

### Podcasts
- **GET** `/api/podcasts/top-jolly` - Fetch top podcasts for listing
- **GET** `/api/podcasts/{podcastId}` - Get specific podcast details
- **GET** `/api/podcasts/{podcastId}/episodes` - Get episodes of a podcast

### Episodes
- **GET** `/api/episodes/{episodeId}` - Get episode details
- **POST** `/api/episodes/plays` - Mark episode as played

## Test Credentials

Use these credentials to test the application:

- **Phone**: `08114227399`
- **Password**: `Development@101`

## Dependencies

### Production Dependencies

- **flutter_riverpod** (^2.4.9): State management solution
- **riverpod_annotation** (^2.3.3): Code generation for Riverpod
- **dio** (^5.4.0): HTTP client for API calls
- **flutter_secure_storage** (^9.0.0): Secure token storage
- **audioplayers** (^5.2.1): Audio playback functionality
- **cached_network_image** (^3.3.1): Image caching and loading
- **freezed_annotation** (^2.4.1): Immutable data classes
- **json_annotation** (^4.8.1): JSON serialization

### Dev Dependencies

- **build_runner** (^2.4.7): Code generation tool
- **freezed** (^2.4.6): Code generation for immutable classes
- **json_serializable** (^6.7.1): JSON serialization code generation
- **riverpod_generator** (^2.3.9): Riverpod code generation
- **flutter_lints** (^3.0.0): Linting rules

### Why These Dependencies?

- **Riverpod**: Modern, type-safe state management
- **Dio**: Feature-rich HTTP client with interceptors
- **flutter_secure_storage**: Platform-specific secure storage
- **audioplayers**: Reliable cross-platform audio playback
- **cached_network_image**: Performance optimization for images
- **freezed**: Reduces boilerplate for immutable classes

## Assumptions Made

### API Response Structure

- Login response contains `token` and `user` fields
- Podcast list returns an array of podcast objects
- Episode objects contain `audioUrl` field for playback
- All IDs are strings

### Audio Playback

- Audio URLs are publicly accessible
- Audio files are in supported formats (MP3, AAC, etc.)
- Network connection is available during playback

### UI/UX Decisions

- Grid layout for podcast list (2 columns)
- Phone number accepts Nigerian format (080xxxxxxxx)
- Authentication token is stored indefinitely until logout
- Pull-to-refresh reloads entire podcast list

## Future Improvements

### Features
- **Offline Support**: Local database for caching podcasts
- **Download Episodes**: Download episodes for offline playback
- **Push Notifications**: Notify users about new episodes
- **User Profile**: Allow users to manage their profile
- **Social Features**: Share podcasts, add comments, rate episodes
- **Search Functionality**: Search podcasts and episodes
- **Playlists**: Create and manage custom playlists
- **Advanced Audio Features**:
  - Playback speed control (0.5x, 1x, 1.5x, 2x)
  - Sleep timer
  - Equalizer settings

### Technical Improvements
- **Unit Tests**: Test ViewModels and business logic
- **Widget Tests**: Test UI components
- **Integration Tests**: End-to-end testing
- **CI/CD Pipeline**: Automated testing and deployment
- **Error Tracking**: Integrate Sentry or Firebase Crashlytics
- **Analytics**: Track user behavior and app usage
- **Localization**: Support multiple languages
- **Accessibility**: Improve screen reader support
- **Performance**:
  - Lazy loading for episode lists
  - Pagination for large datasets
  - Background audio service

### Code Quality
- **Repository Pattern Enhancement**: Add caching layer
- **Dependency Injection**: Move to code generation
- **API Response Handling**: Better error parsing
- **Loading States**: Skeleton loaders instead of spinners

## Known Limitations

- No offline support - requires active internet connection
- Audio stops when app is minimized (no background playback service)
- No pagination - loads all podcasts at once
- Limited error recovery - requires manual retry
- No audio streaming optimization - loads entire file before playback
- Phone number validation is specific to Nigerian format
- No support for video podcasts

## Development Notes

### Code Style

- Follows official Flutter/Dart style guide
- Uses comprehensive documentation with custom markers
- No emojis in code or comments (as requested)
- Meaningful variable names throughout
- Proper null safety implementation

### Security Considerations

- Passwords never logged or stored
- Tokens stored in platform-specific secure storage
- Bearer token automatically attached to authenticated requests
- Input validation on all user inputs
- No hardcoded credentials (except test credentials for reference)

### Performance Optimizations

- Cached network images for faster loading
- AutoDispose providers to prevent memory leaks
- Efficient state updates with ChangeNotifier
- Lazy loading of audio files

## License

This project is developed for the Bloocode Technology recruitment assessment.

## Contact

For questions or issues related to this assessment project, please contact the development team.

---

**Implementation Note**: Custom implementation for Jolly Podcast Assessment
**Date**: 2025-11-24
**Purpose**: Bloocode Technology Recruitment
