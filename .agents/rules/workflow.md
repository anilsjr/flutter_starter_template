# Workflow Rules

## Adding a New Feature
Follow these steps in order:

1. **Model:** Create the data model in `lib/src/model/` and run `build_runner`.
2. **API:** Add necessary methods to `ApiClient` in `lib/core/network/`.
3. **Provider:** Create a `StateNotifier` and `StateNotifierProvider` in `lib/src/provider/`.
4. **View:** 
   - Create the screen in `lib/src/view/screens/`.
   - Implement localized strings in `lib/l10n/`.
5. **Router:** Register the new screen in `lib/config/routes/app_router.dart`.
6. **Testing:** Verify the feature flow and error states.

## General Practices
- Use relative imports.
- Maintain strict null safety.
- Document complex logic.
