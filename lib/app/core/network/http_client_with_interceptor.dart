import 'dart:convert';
import 'dart:async';
import 'package:vendor_registration/app/core/network/Interceptors/logging_interceptor.dart';
import 'package:http/http.dart' as http;
import '../constants/api_urls.dart';
import 'package:vendor_registration/app/core/network/Interceptors/auth_interceptor.dart';
import 'package:vendor_registration/app/core/network/Interceptors/error_interceptor.dart';
import 'package:vendor_registration/app/core/network/Interceptors/expired_token_retry_policy.dart';
import 'package:vendor_registration/app/core/network/Interceptors/params_interceptor.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class HttpClientWithInterceptor {
  final httpInterceptorClient = InterceptedClient.build(
    interceptors: [
      AuthInterceptor(),
      ParamsInterceptor(),
      ErrorInterceptor(),
      LoggingInterceptor(),
    ],
    requestTimeout: Duration(seconds: 10),
    retryPolicy: ExpiredTokenRetryPolicy(refreshToken: () async {
      // Implement your refresh token logic here
      return 'new_token';
    }),
  );

  final String baseUrl;

  HttpClientWithInterceptor({
    this.baseUrl = ApiUrls.baseURL,
  });

  // get method

  Future<http.Response> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    return await httpInterceptorClient.get(
      Uri.parse('$baseUrl$url'),
      headers: headers,
    );
  }

  // post method
  Future<http.Response> post(
    String url, {
    dynamic data,
    Map<String, String>? headers,
  }) async {
    return await httpInterceptorClient.post(
      Uri.parse('$baseUrl$url'),
      headers: headers,
      body: jsonEncode(data),
    );
  }

  // post form data method
  Future<http.Response> postFormData(
    String url, {
    dynamic data,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse('$baseUrl$url');
    var request = http.MultipartRequest('POST', uri);

    if (headers != null) {
      request.headers.addAll(headers);
    }

    data?.forEach((key, value) {
      if (value is String || value is int || value is bool) {
        request.fields[key] = value.toString(); // Convert all values to strings
      }
    });

    // If there are files in data, add them as files
    if (data != null) {
      data.forEach((key, value) async {
        if (value is http.MultipartFile) {
          request.files.add(value);
        }
      });
    }

    final streamedResponse = await httpInterceptorClient.send(request);

    // Convert streamed response to a regular Response object
    final response = await http.Response.fromStream(streamedResponse);

    return response;
  }

  // put method
  Future<http.Response> put(
    String url, {
    dynamic data,
    Map<String, String>? headers,
  }) async {
    return await httpInterceptorClient.put(
      Uri.parse('$baseUrl$url'),
      headers: headers,
      body: jsonEncode(data),
    );
  }

  // delete method
  Future<http.Response> delete(
    String url, {
    dynamic data,
    Map<String, String>? headers,
  }) async {
    return await httpInterceptorClient.delete(
      Uri.parse('$baseUrl$url'),
      headers: headers,
      body: jsonEncode(data),
    );
  }
}
