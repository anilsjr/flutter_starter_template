# Architecture Rules

## Pattern
- The project follows a strict **MVC (Model-View-Controller)** architecture.
- **Model:** Data structures and JSON serialization (`lib/src/model/`).
- **View:** UI screens and widgets (`lib/src/view/`).
- **Controller/Provider:** Logic and state management using Riverpod (`lib/src/provider/`).

## Tech Stack
- **State Management:** Riverpod (Traditional providers only).
- **Navigation:** GoRouter.
- **Networking:** Dio (Manual implementation).
- **Local Storage:** Hive.
- **Responsiveness:** Flutter ScreenUtil.
- **Localization:** Flutter Localizations (i18n).

- **Ad Management:** Google Mobile Ads (Banner, App Open).

## Constraints
- **DO NOT** use Riverpod code generation (`@riverpod`).
- **DO NOT** use Retrofit for API handling.
- **DO NOT** use hardcoded strings in UI.
- **DO NOT** use raw double values for sizing.
- **DO NOT** initialize or load ads on the Web platform.
