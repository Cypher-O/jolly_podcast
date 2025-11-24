# Jolly Podcast Flutter App - Development Prompt

## Instructions for Claude Console

Copy and paste this entire prompt into Claude Console to generate the complete Flutter application.

---

I need you to build a professional Flutter podcast application called "Jolly Podcast" for a job assessment. This is critical and must be executed flawlessly.

## PROJECT REQUIREMENTS

### 1. ARCHITECTURE & PATTERNS

- MVVM architecture (Model-View-ViewModel)
- Riverpod for state management
- SOLID principles throughout
- Dependency Injection pattern
- DTO (Data Transfer Objects) for API responses
- Repository pattern for data layer

### 2. PROJECT STRUCTURE

```bash
lib/
├── core/
│   ├── constants/
│   │   ├── api_constants.dart
│   │   ├── app_colors.dart
│   │   └── app_strings.dart
│   ├── network/
│   │   ├── dio_client.dart
│   │   ├── api_interceptor.dart
│   │   └── network_exceptions.dart
│   ├── security/
│   │   └── secure_storage_service.dart
│   └── utils/
│       └── validators.dart
├── data/
│   ├── models/
│   │   ├── login_request_dto.dart
│   │   ├── login_response_dto.dart
│   │   ├── podcast_dto.dart
│   │   ├── episode_dto.dart
│   │   └── user_dto.dart
│   ├── repositories/
│   │   ├── auth_repository_impl.dart
│   │   └── podcast_repository_impl.dart
│   └── datasources/
│       ├── auth_remote_datasource.dart
│       └── podcast_remote_datasource.dart
├── domain/
│   ├── entities/
│   │   ├── user.dart
│   │   ├── podcast.dart
│   │   └── episode.dart
│   └── repositories/
│       ├── auth_repository.dart
│       └── podcast_repository.dart
└── presentation/
    ├── views/
    │   ├── login/login_view.dart
    │   ├── podcast_list/podcast_list_view.dart
    │   └── podcast_player/podcast_player_view.dart
    ├── viewmodels/
    │   ├── login_viewmodel.dart
    │   ├── podcast_list_viewmodel.dart
    │   └── podcast_player_viewmodel.dart
    └── widgets/
        ├── custom_button.dart
        ├── custom_text_field.dart
        ├── podcast_card.dart
        ├── episode_card.dart
        └── loading_indicator.dart
```

### 3. DEPENDENCIES (pubspec.yaml)

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.4.9
  riverpod_annotation: ^2.3.3
  dio: ^5.4.0
  flutter_secure_storage: ^9.0.0
  audioplayers: ^5.2.1
  cached_network_image: ^3.3.1
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.7
  freezed: ^2.4.6
  json_serializable: ^6.7.1
  riverpod_generator: ^2.3.9
  flutter_lints: ^3.0.0
```

### 4. API DETAILS

**BASE URL:** `http://13.49.46.240:9000`

**KEY ENDPOINTS TO IMPLEMENT:**

#### A. AUTHENTICATION

- **POST** `/api/auth/login`
  - Request Body: `{ "phone": "string", "password": "string" }`
  - Response: `{ "token": "string", "user": {...} }`

#### B. PODCASTS

- **GET** `/api/podcasts/top-jolly` - Get top podcasts for the list screen
- **GET** `/api/podcasts/{podcastId}` - Get specific podcast details
- **GET** `/api/podcasts/{podcastId}/episodes` - Get episodes of a podcast
- **GET** `/api/podcasts/{podcastId}/status` - Check podcast status

#### C. EPISODES

- **GET** `/api/episodes/{episodeId}` - Get episode details (for player)
- **GET** `/api/episodes/latest` - Get latest episodes
- **GET** `/api/episodes/trending` - Get trending episodes
- **POST** `/api/episodes/plays` - Mark episode as played

**Test Credentials:**

- Phone: `08114227399`
- Password: `Development@101`

### 5. SECURITY REQUIREMENTS

- Use flutter_secure_storage for token storage
- Store token with key: `'auth_token'`
- Implement Dio interceptor to auto-attach token to all authenticated requests
- Add Authorization header: `'Bearer {token}'`
- Never log sensitive data (passwords, tokens)
- Validate all inputs before API calls
- Implement token refresh logic if needed

### 6. DOCUMENTATION STYLE

Use Flutter's official documentation style with custom markers:

```dart
/// {@template feature_name}
/// Brief description of the class/method.
///
/// Detailed explanation of what this does and why.
/// Include usage examples if complex.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-24
/// **Purpose:** Bloocode Technology Recruitment
```

### 7. FEATURES TO IMPLEMENT

#### A. LOGIN SCREEN (presentation/views/login/login_view.dart)

- Phone number input field (with +234 prefix handling)
- Password input field with visibility toggle
- Login button (disabled until form is valid)
- Loading state during authentication
- Error handling with user-friendly messages
- Form validation:
  - Phone: Must be valid Nigerian number
  - Password: Required, minimum 8 characters
- Navigate to podcast list on success
- Follow Figma design exactly (colors, spacing, typography)

#### B. PODCAST LIST SCREEN (presentation/views/podcast_list/podcast_list_view.dart)

- Fetch podcasts using GET `/api/podcasts/top-jolly`
- Display podcasts in a grid or list (match Figma)
- Each podcast card shows:
  - Thumbnail (use cached_network_image)
  - Podcast title
  - Additional metadata if available
- Pull-to-refresh functionality
- Loading state (shimmer effect or skeleton)
- Empty state handling
- Error state with retry button
- Navigate to player on podcast tap
- Logout button in app bar

#### C. PODCAST PLAYER SCREEN (presentation/views/podcast_player/podcast_player_view.dart)

- Fetch podcast details and episodes
- Display podcast information
- List of episodes (if podcast has multiple)
- Audio playback controls:
  - Play/Pause button
  - Seek bar (slider)
  - Current time display
  - Total duration display
  - Skip forward/backward buttons (optional)
- Use audioplayers package
- Handle at least 2 different podcasts/episodes with real audio URLs
- Mark episode as played using POST `/api/episodes/plays`
- Loading state while fetching audio
- Error handling for:
  - Network issues
  - Invalid audio URLs
  - Playback failures
- Proper audio resource cleanup on dispose

### 8. CODE QUALITY REQUIREMENTS

- Every class must have comprehensive documentation
- Use meaningful variable names (not single letters unless in loops)
- Implement proper error handling everywhere
- Use freezed for immutable models with @freezed annotation
- Use riverpod_annotation for providers with @riverpod annotation
- Follow Flutter/Dart best practices and linting rules
- Ensure null safety throughout
- No hardcoded strings (use constants in app_strings.dart)
- No hardcoded colors (use constants in app_colors.dart)
- Proper separation of concerns (business logic in ViewModels, not in Views)

### 9. STATE MANAGEMENT PATTERN

- Use AsyncValue<T> for all async operations
- Implement proper loading/error/data states in UI:

```dart
asyncValue.when(
  data: (data) => /* Success UI */,
  loading: () => /* Loading UI */,
  error: (error, stack) => /* Error UI */,
)
```

- Use StateNotifierProvider for complex stateful logic
- Use FutureProvider for simple one-time async operations
- Use StreamProvider if implementing real-time features
- Implement proper state disposal

### 10. DIO CLIENT SETUP (core/network/dio_client.dart)

- Base URL: `http://13.49.46.240:9000`
- Timeout configurations:
  - connectTimeout: 30 seconds
  - receiveTimeout: 30 seconds
- Interceptors:
  - Token interceptor (add Bearer token to all requests)
  - Logging interceptor (for debugging, don't log sensitive data)
  - Error handling interceptor
- Retry logic for network failures
- Proper error mapping to custom exceptions

### 11. ERROR HANDLING (core/network/network_exceptions.dart)

Create custom exception classes:

- NetworkException (base class)
- UnauthorizedException (401)
- NotFoundException (404)
- ServerException (500+)
- TimeoutException
- NoInternetException

Map these to user-friendly messages in ViewModels

### 12. SECURE STORAGE (core/security/secure_storage_service.dart)

Implement methods:

- `Future<void> saveToken(String token)`
- `Future<String?> getToken()`
- `Future<void> deleteToken()`
- `Future<bool> hasToken()`

Use this service for token management across the app

### 13. NAVIGATION

- Implement proper navigation using Navigator.push/pop or go_router
- Pass podcast/episode IDs to player screen
- Handle back button properly
- Clear navigation stack on logout

### 14. IMPORTANT NOTES

- NO EMOJIS anywhere in code or comments
- Match Figma design as closely as possible (colors, fonts, spacing, layouts)
- Test with the provided credentials before submission
- Ensure app works on both Android and iOS
- Token must persist across app restarts
- Logout must clear token and navigate back to login
- Handle app lifecycle properly (pause audio when app goes to background)

### 15. README.md MUST INCLUDE

```markdown
# Jolly Podcast App

## Overview
[Brief description]

## Architecture
- MVVM pattern explanation
- Folder structure breakdown
- Why each architectural decision was made

## State Management
- Riverpod implementation details
- Provider hierarchy
- State flow diagram (optional)

## Setup Instructions
1. Clone the repository
2. Install dependencies: `flutter pub get`
3. Run build_runner: `flutter pub run build_runner build --delete-conflicting-outputs`
4. Run the app: `flutter run`

## API Endpoints Used
- Login: POST /api/auth/login
- Podcasts: GET /api/podcasts/top-jolly
- [List all endpoints used]

## Test Credentials
- Phone: 08114227399
- Password: Development@101

## Dependencies
[Explain why each major dependency was chosen]

## Assumptions Made
- [List any assumptions about API responses]
- [Assumptions about UI/UX where Figma wasn't clear]

## Future Improvements
- Offline support with local database
- Download episodes for offline playback
- Push notifications for new episodes
- User profile management
- Social features (sharing, comments)
- Advanced audio features (speed control, sleep timer)
- Unit and widget tests
- Integration tests
- CI/CD pipeline

## Known Limitations
[Any current limitations or edge cases]
```

### 16. TESTING CHECKLIST

Before submission, verify:

- [ ] Login works with provided credentials
- [ ] Login error handling works (wrong password, network error)
- [ ] Token is stored securely and persists
- [ ] Podcast list loads successfully
- [ ] Podcasts display with proper images and titles
- [ ] Pull-to-refresh works
- [ ] Tapping podcast navigates to player
- [ ] Audio plays successfully for at least 2 podcasts
- [ ] Play/Pause controls work
- [ ] Seek bar works
- [ ] Time display is accurate
- [ ] Episode is marked as played
- [ ] Logout clears token and returns to login
- [ ] App handles no internet gracefully
- [ ] No console errors or warnings
- [ ] App doesn't crash on any screen

### 17. FILE GENERATION ORDER

Generate files in this order for logical dependency management:

**1. Core layer:**

- api_constants.dart
- app_colors.dart
- app_strings.dart
- network_exceptions.dart
- secure_storage_service.dart
- validators.dart
- dio_client.dart
- api_interceptor.dart

**2. Data layer:**

- All DTOs (login_request_dto, login_response_dto, podcast_dto, episode_dto)
- Domain entities (user, podcast, episode)
- Repository interfaces
- Remote datasources
- Repository implementations

**3. Presentation layer:**

- Reusable widgets
- ViewModels (with providers)
- Views (screens)

**4. Main app:**

- main.dart with proper initialization
- App theme configuration

**5. Configuration:**

- pubspec.yaml
- README.md

---

## FINAL INSTRUCTION

Please generate the COMPLETE, production-ready Flutter application following ALL requirements above. This is for a critical job assessment and must demonstrate senior-level Flutter development skills with MVVM, SOLID principles, and clean architecture.

Generate every single file needed for the project to run successfully. Include all imports, proper error handling, comprehensive documentation, and ensure the code is ready for immediate execution after running build_runner.

Start now with the complete implementation.
