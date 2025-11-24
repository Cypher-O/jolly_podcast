# Quick Start Guide

Get the Jolly Podcast app running in 5 minutes!

## Prerequisites

- Flutter SDK (3.3.3 or higher)
- An emulator or physical device
- Code editor (VS Code, Android Studio, or IntelliJ)

## Installation Steps

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Generate Code

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Run the App

```bash
flutter run
```

That's it! The app should now be running on your device.

## First Time Using the App

1. **Login Screen**: Use these credentials:
   - Phone: `08114227399`
   - Password: `Development@101`

2. **Browse Podcasts**: Scroll through the list of available podcasts

3. **Play a Podcast**: Tap on any podcast card to open the player

4. **Control Playback**: Use the play/pause button and seek bar

## Switching Between Flavors

### Using Command Line

```bash
# Development
flutter run -t lib/main_dev.dart

# Staging
flutter run -t lib/main_staging.dart

# Production (default)
flutter run
```

### Using VS Code

1. Open the Run and Debug panel (Ctrl+Shift+D / Cmd+Shift+D)
2. Select flavor from dropdown: "Development", "Staging", or "Production"
3. Press F5 or click the green play button

### Using Android Studio / IntelliJ

1. Click the run configuration dropdown (top toolbar)
2. Select "Edit Configurations"
3. For each configuration:
   - Click "+" to add new Flutter configuration
   - Set "Dart entrypoint" to:
     - `lib/main_dev.dart` for Development
     - `lib/main_staging.dart` for Staging
     - `lib/main.dart` for Production
   - Name it appropriately
4. Select desired configuration and run

## Common Commands

### Development

```bash
# Hot reload (during development)
# Press 'r' in terminal or Ctrl+S / Cmd+S in IDE

# Hot restart
# Press 'R' in terminal

# Run with specific device
flutter run -d <device-id>

# List available devices
flutter devices
```

### Building

```bash
# Build APK (Android)
flutter build apk --release

# Build iOS
flutter build ios --release

# Build for specific flavor
flutter build apk --release -t lib/main_dev.dart
```

### Troubleshooting

```bash
# Clean build cache
flutter clean

# Re-get dependencies
flutter pub get

# Re-generate code
flutter pub run build_runner build --delete-conflicting-outputs

# Check for issues
flutter doctor

# Analyze code
flutter analyze
```

## Project Structure (Key Files)

```
lib/
├── main.dart                      # Start here (production)
├── main_dev.dart                  # Development entry
├── main_staging.dart              # Staging entry
├── app.dart                       # Main app widget
├── presentation/
│   ├── views/
│   │   ├── login/                 # Login screen
│   │   ├── podcast_list/          # Podcast list screen
│   │   └── podcast_player/        # Player screen
│   └── viewmodels/                # Business logic
└── core/
    ├── constants/                 # App constants
    └── config/                    # Flavor configuration
```

## Features to Try

1. ✅ **Login** with test credentials
2. ✅ **Pull to refresh** on podcast list
3. ✅ **Tap a podcast** to view details
4. ✅ **Play audio** with controls
5. ✅ **Seek** through audio
6. ✅ **Switch episodes** in player
7. ✅ **Logout** from podcast list

## Getting Help

- **README.md**: Complete project documentation
- **FLAVORS.md**: Build flavors detailed guide
- **PROJECT_SUMMARY.md**: Implementation overview

## Next Steps

After running the app:

1. Explore the codebase structure
2. Check out the different screens
3. Review the architecture documentation
4. Try different build flavors
5. Read the comprehensive README

## Performance Tips

- Use **Development flavor** during active development (has logging)
- Use **Staging flavor** for testing
- Use **Production flavor** for release builds (no logging)
- Run `flutter clean` if you encounter caching issues
- Use `flutter analyze` to check for code issues

## Debugging

### Enable Flutter Inspector

1. Run app in debug mode
2. In VS Code: Press Ctrl+Shift+P / Cmd+Shift+P
3. Type "Flutter: Open DevTools"
4. Explore widget tree, performance, network, etc.

### View Logs

```bash
# Real-time logs
flutter logs

# Filter logs
flutter logs | grep "Error"
```

### Debug Errors

The app has comprehensive error handling:
- Login errors show user-friendly messages
- Network errors display with retry buttons
- Global errors are caught and logged (see console)

## Common Issues

### Issue: Dependencies not installed
**Solution**: Run `flutter pub get`

### Issue: Generated files missing
**Solution**: Run `flutter pub run build_runner build --delete-conflicting-outputs`

### Issue: App not connecting to API
**Solution**: Check internet connection and API endpoint in `app_config.dart`

### Issue: Login fails
**Solution**: Ensure you're using correct test credentials:
- Phone: `08114227399`
- Password: `Development@101`

---

**Happy Coding!**

For detailed information, see [README.md](README.md)
