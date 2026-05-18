# State Management Rules

## Riverpod Usage
- Use traditional providers: `Provider`, `StateNotifierProvider`, `FutureProvider`, `StreamProvider`.
- Business logic must reside in `StateNotifier` classes.
- Access state in `ConsumerWidget` or `ConsumerStatefulWidget` using `ref.watch()`.
- Trigger actions using `ref.read(provider.notifier).method()`.

## Async State
- For API-backed state, use `AsyncValue<T>`.
- Handle states in the View using `.when()`:
  ```dart
  providerValue.when(
    data: (data) => ...,
    loading: () => ...,
    error: (err, stack) => ...,
  )
  ```

## Dependency Injection
- Pass services (like `ApiClient`) into the `StateNotifier` constructor.
- Use a `Provider` to expose the service instance.
