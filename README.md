# Flutter Repo Hunter

## Project Overview

Flutter Repo Hunter is a Flutter-based application that searches GitHub for repositories using the keyword "Flutter" and displays the top 50 most popular repositories. The app provides offline support, sorting functionality, and a detailed view of each repository.

## Features

- Fetch and display the top 50 most starred repositories related to Flutter from GitHub.
- Sort repositories by last updated date-time or star count.
- Persist sorting preferences across app sessions.
- View detailed information about each repository, including the owner's name, profile photo, and last update time.
- Offline support: Previously fetched data is stored locally for browsing without an internet connection.
- Environment-based configurations using `flutter_dotenv` for seamless switching between development and production API endpoints.
- Theming support for light and dark modes.

## How to Run the App

### Prerequisites

Ensure you have the following installed:

- Flutter SDK (latest stable version)
- Dart
- Git

### Step 1: Clone the Repository

```sh
git clone <your-repository-url>
cd flutter_repo_hunter
```

### Step 2: Install Dependencies

```sh
flutter pub get
```

### Step 3: Setup Environment Variables

Create two environment files in the root directory:

#### `.env.dev` (For Development)

```ini
API_URL=https://api.github.com
```

#### `.env.prod` (For Production)

```ini
API_URL=https://api.github.com
```

### Step 4: Choose Environment Mode

Open `lib/core/config/app_config.dart` and modify:

#### For Development Mode

```dart
static String appMode = AppMode.development.toString();
```

#### For Production Mode

```dart
static String appMode = AppMode.production.toString();
```

Simply comment/uncomment to switch between environments.

### Step 5: Run the App

#### Run in Development Mode

```sh
flutter run
```

#### Run in Release Mode (For Better Performance)

```sh
flutter run --release
```

## Building APK & App Bundle

### Build APK (For Android Installation)

```sh
flutter build apk
```

### Build App Bundle (For Play Store Upload)

```sh
flutter build appbundle
```

## Dependencies Used

- `flutter_dotenv` → Environment configuration
- `get_storage` → Local storage for offline support
- `get` → State management and API calls
- `connectivity_plus` → Internet connection status
- `flutter_cache_manager` → Image caching

## Error Handling

- **No Internet Connection**: Displays an appropriate error message.
- **API Failures**: Proper error messages are shown in case of API request failures.
- **Invalid Environment Configuration**: The app throws an exception if `API_URL` is missing from the `.env` files.

## License

This project is open-source and free to use.
