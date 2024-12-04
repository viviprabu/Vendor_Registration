import 'dart:async';
import './../../network/http_logger.dart';
import 'package:http_interceptor/http_interceptor.dart';

class ErrorInterceptor implements InterceptorContract {
  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) async {
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
    /* switch (response.statusCode) {
      // Success Status Codes
      case 200: // OK
        return response;
      case 201: // Created
        return response;
      case 202: // Accepted
        print('Request accepted but not yet processed: ${response.statusCode}');
        return response;
      case 203: // Non-Authoritative Information
        print('Non-Authoritative Information: ${response.statusCode}');
        return response;
      case 204: // No Content
        print(
            'No Content: Request processed successfully but no content returned.');
        return response;
      case 205: // Reset Content
        print(
            'Reset Content: Request successful; client should reset the view.');
        return response;
      case 206: // Partial Content
        print('Partial Content: Partial data returned: ${response.statusCode}');
        return response;
      case 207: // Multi-Status (WebDAV)
        print('Multi-Status: ${response.statusCode}');
        return response;
      case 208: // Already Reported (WebDAV)
        print('Already Reported: ${response.statusCode}');
        return response;
      case 226: // IM Used
        print(
            'IM Used: Instance manipulations applied successfully: ${response.statusCode}');
        return response;
      case 400: // Bad Request
        throw Exception('Bad Request: ${response.statusCode}');
      case 401: // Unauthorized
        throw Exception('Unauthorized: ${response.statusCode}');
      case 403: // Forbidden
        throw Exception('Forbidden: ${response.statusCode}');
      case 404: // Not Found
        throw Exception('Not Found: ${response.statusCode}');
      case 408: // Request Timeout
        throw Exception('Request Timeout: ${response.statusCode}');
      case 500: // Internal Server Error
        throw Exception('Internal Server Error: ${response.statusCode}');
      case 502: // Bad Gateway
        throw Exception('Bad Gateway: ${response.statusCode}');
      case 503: // Service Unavailable
        throw Exception('Service Unavailable: ${response.statusCode}');
      case 504: // Gateway Timeout
        throw Exception('Gateway Timeout: ${response.statusCode}');
      default: // Other unhandled status codes
        throw Exception('Unexpected Error: ${response.statusCode}');
    } */

    // I want to throw only error status codes
    if (response.statusCode >= 400) {
      HttpLogger logger = HttpLogger();
      logger.logError('Error: ${response.statusCode}');
      throw Exception('Error: ${response.statusCode}');
    }

    return response;
  }

  @override
  FutureOr<bool> shouldInterceptRequest() async {
    return true;
  }

  @override
  FutureOr<bool> shouldInterceptResponse() async {
    return true;
  }
}
