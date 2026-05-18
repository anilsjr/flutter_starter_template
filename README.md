Create a production-ready Flutter starter template using MVC Architecture.

Requirements:
- Latest stable Flutter version
- MVC architecture
- Riverpod for state management
- GoRouter for routing/navigation
- Dark/Light theme support
- Multi-language localization support (i18n)
- Retrofit + Dio for API handling
- flutter_screenutil for responsive UI
- Google Mobile Ads integration
- In-App Review API integration
- Permission Handler integration
- flutter_native_splash setup
- App rename support
- flutter_svg support
- local-storage : shared_prefs/hive
- persistent_bottom_nav_bar: ^6.2.1 | style 12


Include:
- Secure local storage
- Shared preferences/hive
- Connectivity checker
- Logger/interceptors
- Error handling
- API response wrapper
- Dependency injection
- Reusable widgets
- Snackbar/dialog utilities
- Loading/error states
- Null safety
- Proper documentation/comments

Use this folder structure:

lib/
│
├── core/
│   ├── constants/
│   ├── utils/
│   ├── network/
│   ├── errors/
│   ├── widgets/
│   ├── services/
│
├── config/
│   ├── service/
│   ├── theme/
│   ├── language/
│   ├── routes/
│
├── src/
│   ├── model/
│   ├── view/
│   │   ├── screens/
│   │   ├── widgets/
│   │   └── components/
│   ├── provider/
│
├── l10n/
│
└── main.dart

Features to include:
1. Complete pubspec.yaml dependencies
2. MVC example module
3. Riverpod provider example
4. Retrofit API example
5. GoRouter navigation example
6. Theme switching example
7. Language switching example
8. Reusable widgets
9. Splash screen setup
10. AdMob setup
11. Permission handling example
12. Build flavors (dev/prod)
13. Environment configurations
14. Recommended best practices
15. CLI setup commands


Code style requirements:
- Reusable components
- Optimized for scalability and maintainability
- Well-structured naming conventions