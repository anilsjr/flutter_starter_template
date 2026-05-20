# Networking Rules

## Implementation
- Use `Dio` directly.
- Centralized configuration is in `lib/core/network/api_client.dart`.
- Utilize interceptors for logging and error handling.

## Error Handling
- Catch `DioException` and map them to `Failure` types:
  - `NetworkFailure` (Connectivity issues)
  - `ServerFailure` (5xx, 4xx)
  - `Failure` (Generic)
- Use `AppLogger` for all networking logs.

## API Response Wrapper
- Use `ApiResponse<T>` to wrap data, message, and success status if the backend provides a standard structure.
