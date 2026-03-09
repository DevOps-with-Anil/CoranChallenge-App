# Coran Challenge App

A comprehensive Flutter application for Quran learning, challenges, news, and community engagement.

## Features

### Authentication Flow
- Splash Screen with app branding
- Onboarding screens (3 pages)
- Sign In / Sign Up
- Forgot Password & Reset Password
- Email Verification (OTP)
- Profile Setup

### Main Features
- **Dashboard**: Home feed with latest news, challenges, and videos
- **News**: Browse, search, and filter Quran-related news with categories
- **News Detail**: Read full articles with comments and engagement
- **Challenges**: Participate in Quran recitation challenges
- **Videos**: Watch educational Quran content
- **Notifications**: Stay updated with app activities

### UI Components
- Bottom navigation with 4 tabs (Home, News, Challenges, Videos)
- Search functionality
- Category filters
- Pull-to-refresh
- Social login options (Facebook, Google)
- Interactive cards and lists

## Project Structure

```
lib/
├── app/                    # App configuration
├── config/                 # Environment & localization
├── modules/
│   ├── splash/            # Splash screen
│   ├── onboarding/        # Onboarding flow
│   ├── auth/              # Authentication screens
│   ├── dashboard/         # Main dashboard with tabs
│   ├── news/              # News detail screen
│   └── notification/      # Notifications
├── routes/                # Navigation setup
├── services/              # App services
└── shared/                # Shared widgets & layouts
```

## Getting Started

### Prerequisites
- Flutter SDK (3.11.0 or higher)
- Dart SDK
- Android Studio / VS Code
- iOS development tools (for iOS builds)

### Installation

1. Clone the repository
```bash
git clone <repository-url>
cd coranchallenge
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## Screens Overview

### Authentication
- Splash Screen → Onboarding → Sign In/Sign Up
- Forgot Password → Reset Password
- Sign Up → Verify Email → Fill Profile → Dashboard

### Main App
- Dashboard (Home Tab)
  - Flash banner
  - Hero section
  - Latest news carousel
  - Ongoing challenges
  - Featured videos
  
- News Tab
  - Search bar
  - Trending slider
  - Category filters
  - News list with pull-to-refresh
  
- News Detail
  - Full article view
  - Like, comment, share
  - Related news
  - Comments section

- Notifications
  - Read/Unread tabs
  - Search notifications
  - Follow actions

## Color Scheme
- Primary: Deep Orange (#FF5722)
- Background: White & Light Gray
- Text: Black87, Black54

## Assets
- App logo and icon
- Dummy images for news and challenges
- Located in `assets/` directory

## Dependencies
- flutter: SDK
- cupertino_icons: ^1.0.8
- package_info_plus: ^9.0.0

## Development

### Adding New Screens
1. Create screen in appropriate module folder
2. Add route name in `lib/routes/route_names.dart`
3. Add route case in `lib/routes/app_router.dart`

### Running Tests
```bash
flutter test
```

### Building for Production
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## License
This project is licensed under the MIT License.

## Support
For issues and questions, please open an issue in the repository.
