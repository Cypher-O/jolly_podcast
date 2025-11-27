# Jolly Podcast App

A Flutter podcast application built for Bloocode Technology recruitment assessment.

## Features

- **User Authentication**: Login with phone number and password
- **Podcast Discovery**: Browse top Jolly podcasts with pagination
- **Audio Player**: Play/pause, seek, skip episodes, auto-play next
- **Pull-to-Refresh**: Refresh podcast list
- **Error Handling**: User-friendly error messages with automatic session management

## Setup Instructions

### Prerequisites

- Flutter SDK (>=3.3.3 <4.0.0)
- VS code / Android Studio / Xcode
- An simulator/emulator or physical device

### Installation Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/Cypher-O/jolly_podcast.git
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

   ```bash
   flutter run
   ```

### Test Credentials

- **Phone**: `08114227399`
- **Password**: `Development@101`

## State Management Approach

**Riverpod** was chosen for state management because:

- Type-safe with compile-time checking
- No BuildContext required for providers
- Better testability
- Automatic disposal of unused state
- Excellent async support with AsyncValue

### Architecture

The app follows **Clean Architecture** with **MVVM pattern**:

```bash
lib/
├── core/                    # Networking, constants, utils, security
├── data/                    # DTOs, repositories, datasources
├── domain/                  # Entities, repository interfaces
└── presentation/            # Views, ViewModels, widgets
```

**Data Flow:**
View → ViewModel → Repository → DataSource → API

## Assumptions Made

### What Was Required vs What I Built

**Required Features:**

- Login screen with API authentication
- Podcast list from API
- Podcast player with at least 2 playable podcasts

**Additional Features I Implemented:**

- **Pagination** with "Show More" button (not required)
- **Pull-to-refresh** functionality (not required)
- **Auto-play next episode** when current completes (not required)
- **Comprehensive error handling** with sealed exception classes (not required)
- **Request/response logging** via interceptor (not required)
- **Build flavors** (dev, staging, production) (not required)
- **Global error boundary** with runZonedGuarded (not required)

### API Behavior

- Login response contains nested `data` object with `token` and `user` fields
- Podcast list endpoint returns paginated response with `data.data.data` structure
- Podcast details endpoint (GET `/api/podcasts/{podcastId}`) returns 404 for some podcasts
  - Implemented fallback: extract podcast data from episodes response
- Subscriber count may not be in podcast details response
  - Implemented: preserve count from list view
- Bearer token authentication
- No token refresh mechanism needed (token valid until logout)

### UI/UX Decisions

- Grid layout (2 columns) for better visual hierarchy on podcast list
- Auto-play when selecting a new episode (better UX)
- Auto-advance to next episode when current completes (continuous listening)
- Pull-to-refresh reloads podcast list with loading indicator
- Inline error messages instead of snackbars (better visibility)
- Login screen with background image and gradient overlay (matches Figma closely)
- Current playing episode is visually highlighted in episode list
- Empty states, loading states, and error states all handled

### Architecture Decisions

- Clean Architecture with MVVM for better separation of concerns
- Riverpod over Bloc/GetX for type safety and better testing
- Sealed exception classes for exhaustive error handling
- Repository pattern with interfaces for testability
- Secure storage for token persistence
- API interceptor for centralized auth header injection
- Freezed for immutable DTOs to prevent bugs

## What I Would Improve With More Time

### Critical Improvements

1. **Background Audio Service**
   - Audio continues when app is minimized
   - Media notification controls
   - Handle audio interruptions (calls, etc.)

2. **Comprehensive Testing**
   - Unit tests for ViewModels and repositories
   - Widget tests for UI components
   - Integration tests for user flows
   - Currently no tests exist

3. **Offline Support**
   - Local database (Drift/Hive) for caching
   - Show cached content when offline
   - Sync when connection restored

### User Experience

4. **Retry Mechanism**
   - Exponential backoff for failed requests
   - Retry button on error states
   - Network reachability checks

5. **Better Loading States**
   - Skeleton loaders instead of spinners
   - Shimmer effects
   - Progressive image loading

6. **Audio Features**
   - Playback speed control
   - Sleep timer
   - Resume from last position

### Performance

7. **Infinite Scroll**
   - Auto-load on scroll (replace "Show More" button)
   - Preload next page

8. **Image Optimization**
   - Multiple resolutions for different screens
   - WebP format support

9. **Audio Streaming**
   - Progressive streaming (not loading entire file)
   - Adaptive bitrate

### Architecture

10. **Enhanced State Management**
    - AsyncNotifier instead of ChangeNotifier
    - Sealed classes for error states
    - State persistence

11. **Use Cases Layer**
    - Move business logic from ViewModels to use cases
    - Repository caching layer

12. **Security**
    - Certificate pinning
    - Biometric authentication
    - Token refresh mechanism

### DevOps

13. **Testing & CI/CD**
    - GitHub Actions pipeline
    - Automated testing
    - Code coverage reporting

14. **Monitoring**
    - Sentry/Firebase Crashlytics
    - Analytics tracking
    - Performance monitoring

## Dependencies

**Core:**

- `flutter_riverpod` - State management
- `dio` - HTTP client
- `flutter_secure_storage` - Secure token storage
- `audioplayers` - Audio playback
- `cached_network_image` - Image caching
- `freezed` - Immutable data classes

**Dev:**

- `build_runner` - Code generation
- `json_serializable` - JSON serialization
- `riverpod_generator` - Riverpod code generation
