# Sandwich Shop — Flutter App

A cross-platform Flutter app for browsing, customizing, and ordering sandwiches. Provides an intuitive menu, item details, cart, checkout flow, and simple order management for customers and staff.

## Features
- Browse categories and sandwich items
- View item details, ingredients, and nutrition
- Build custom sandwiches (choose bread, fillings, extras)
- Add to cart, modify quantities, and checkout
- Local persistence (cart, preferences) and optional remote API integration
- Responsive UI for mobile, tablet, and web

## Requirements
- Flutter SDK (stable) — recommended version: 3.x or newer
- Dart SDK (bundled with Flutter)
- Android Studio / Xcode / VS Code for development
- Optional: Firebase or REST API if backend integration is used

## Installation & Setup

1. Clone the repository
```bash
git clone <repository-url>
cd sandwich_shop
```

2. Install Flutter packages
```bash
flutter pub get
```

3. Platform-specific setup
- Android: ensure Android SDK and device/emulator available
- iOS: open Xcode and set signing & capabilities if deploying to device
- Web: enable web support if needed (`flutter config --enable-web`)

4. Environment / API keys (optional)
- If the app uses remote APIs or services (Firebase, Stripe, etc.), add keys/config files:
    - Firebase: place `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) in the correct platform folders
    - REST API: set base URL and keys in `lib/config.dart` or use environment variables

## Running the App

Run on connected device or emulator:
```bash
flutter run
```

Run on a specific platform:
```bash
flutter run -d chrome         # web
flutter run -d emulator-5554  # Android emulator
flutter run -d <device-id>    # specific device
```

Build release artifacts:
```bash
flutter build apk    # Android
flutter build ios    # iOS (macOS required)
flutter build web    # Web
```

## Usage

- Launch the app and browse sandwiches by category from the home screen.
- Tap an item to open the details page: choose size, bread, and extras.
- Add items to the cart. Open the cart to adjust quantities or remove items.
- Proceed to checkout and follow the payment or order confirmation flow.
- Staff or admin views (if implemented): view incoming orders and update status.

## Project Structure (typical)
- /android, /ios, /web — platform folders
- /lib
    - main.dart — app entry point
    - /models — data models (Sandwich, Ingredient, Order)
    - /screens — UI pages (home, details, cart, checkout)
    - /widgets — reusable widgets
    - /services — API, persistence, and business logic
    - /utils or /helpers — utilities, constants
- /assets — images, fonts, and other static assets
- pubspec.yaml — dependencies and asset declarations

Adjust paths if your project structure differs.

## Testing
Run unit and widget tests with:
```bash
flutter test
```
Add integration tests under `integration_test/` and run with:
```bash
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart
```

## Troubleshooting
- If packages fail to fetch: `flutter pub cache repair` then `flutter pub get`
- If Android build fails: ensure Android SDK, platform-tools, and correct Java JDK are installed
- iOS build issues often require opening the Xcode workspace and resolving signing

## Contributing
- Fork the repo, create a feature branch, and send a pull request.
- Follow the existing code style; run tests before submitting.
- Add concise commit messages and include screenshots for UI changes.

## License
Specify a license (e.g., MIT) in a LICENSE file. If none, include a short license note.

## Contact
For issues or support, open an issue in the repository with a clear description and steps to reproduce.
