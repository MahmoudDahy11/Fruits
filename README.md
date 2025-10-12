# Fruits E-Commerce App

[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/MahmoudDahy11/Fruits)

An e-commerce application built with Flutter, providing a complete shopping experience for fresh fruits. The app features robust user authentication, product browsing, a shopping cart, and favorites management, all built upon a clean, feature-based architecture.

## Features

-   **User Authentication:** Secure sign-up and sign-in with Email/Password, Google, and Facebook.
-   **Onboarding:** A smooth, user-friendly introduction to the app for new users.
-   **Product Discovery:** Browse a catalog of fruits, view best-sellers, and use the search functionality to find specific items.
-   **Product Details:** View detailed information for each fruit, including price, description, rating, and nutritional attributes.
-   **Shopping Cart:** Add products to the cart, adjust quantities, and view the total price before checkout.
-   **Favorites:** Mark products as favorites for easy access later.
-   **Account Management:** A dedicated screen for users to manage their account and sign out.
-   **Localization:** Supports both English and Arabic, with Arabic set as the default language.

## Architecture & Tech Stack

This project follows a clean, feature-driven architecture, separating concerns into `data`, `domain`, and `presentation` layers for each feature.

-   **Framework:** Flutter
-   **State Management:** `flutter_bloc` / `Cubit`
-   **Backend Services:** Firebase (Authentication, Cloud Firestore for cart and favorites)
-   **Networking:** `dio` for interacting with the fruit data API, along with a custom `ApiService`.
-   **Dependency Injection:** `get_it` service locator for managing dependencies.
-   **Local Storage:** `hive_flutter` for persisting user session data.
-   **UI Components:** `salomon_bottom_bar` (for bottom navigation), `smooth_page_indicator`, and `awesome_dialog`.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

-   Flutter SDK installed.
-   An editor like VS Code or Android Studio.

### Installation

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/mahmouddahy11/fruits.git
    cd fruits
    ```

2.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

3.  **Setup Firebase:**
    This project is configured to use Firebase. To run it, you'll need to set up your own Firebase project:
    -   Create a new project on the [Firebase Console](https://console.firebase.google.com/).
    -   Add an Android and an iOS app to your Firebase project.
    -   Follow the Firebase setup instructions to get your `google-services.json` for Android and `GoogleService-Info.plist` for iOS.
    -   Use the FlutterFire CLI to configure your app, which will generate the `lib/firebase_options.dart` file.
        ```sh
        flutterfire configure
        ```
    -   Enable Email/Password, Google, and Facebook sign-in methods in the Firebase Authentication console.

4.  **Run the application:**
    ```sh
    flutter run
    ```

## Project Structure

The project is organized into a feature-based structure to promote scalability and maintainability.

```
lib/
├── core/               # Shared services, constants, and widgets
│   ├── constant/
│   ├── errors/
│   ├── helper/
│   ├── routes/
│   ├── services/       # ApiService, FirebaseService, GetIt, etc.
│   └── widgets/
│
├── features/           # Main application features
│   ├── auth/           # Authentication (login, register)
│   ├── on_boarding/    # Initial onboarding screens
│   ├── shopping/       # Main shopping experience
│   └── splash/         # Splash screen
│
├── generated/          # Localization files
└── main.dart           # App entry point
```

Each feature folder (e.g., `auth`, `shopping`) is self-contained and typically includes:
-   `data/`: Repositories implementations and data models.
-   `domain/`: Abstract repositories and entities.
-   `presentation/`: UI (views), state management (cubits), and widgets.
