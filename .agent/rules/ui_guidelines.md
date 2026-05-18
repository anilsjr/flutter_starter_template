# UI Guidelines

## Responsiveness
- Always use `flutter_screenutil` extensions for sizing:
  - Width: `[value].w`
  - Height: `[value].h`
  - Font Size: `[value].sp`
  - Radius: `[value].r`
- Example: `Container(width: 100.w, height: 50.h, child: Text('Hello', style: TextStyle(fontSize: 16.sp)))`

## Localization
- All user-facing strings must be localized.
- Use `AppLocalizations.of(context)!.keyName`.
- Add new strings to `lib/l10n/app_en.arb` and `lib/l10n/app_es.arb`.

## Reusable Widgets
- Check `lib/core/widgets/` for existing components like `CustomButton` or `LoadingWidget` before creating new ones.
- Maintain consistent spacing using `SizedBox` with `.h` or `.w`.

## Theming
- Use `Theme.of(context).colorScheme` and `Theme.of(context).textTheme` for styling to ensure compatibility with Dark/Light modes.
