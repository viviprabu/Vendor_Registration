import 'package:http_interceptor/http_interceptor.dart';
import 'dart:async';

class ExpiredTokenRetryPolicy extends RetryPolicy {
  @override
  final int maxRetryAttempts;
  final Future<String> Function() refreshToken;

  ExpiredTokenRetryPolicy({
    this.maxRetryAttempts = 3,
    required this.refreshToken,
  });

  @override
  FutureOr<bool> shouldAttemptRetryOnException(
      Exception reason, BaseRequest request) async {
    // Optionally retry on specific exceptions (e.g., network issues)
    return true; // Retry for all exceptions
  }

  @override
  FutureOr<bool> shouldAttemptRetryOnResponse(BaseResponse response) async {
    if (response.statusCode == 401) {
      // Optionally retry on specific response codes (e.g., 401)
      return true; // Retry on 401
    }
    return false; // Do not retry
  }

  Future<Duration> retryTimeout(int retryCount) async {
    return Duration(seconds: 2 * retryCount); // Exponential backoff
  }
}
