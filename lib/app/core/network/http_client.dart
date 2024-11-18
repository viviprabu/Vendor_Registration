import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../constants/api_urls.dart';
import '../network/http_logger.dart';

class HttpClient {
  final String baseUrl;
  final Map<String, String> defaultHeaders;
  final HttpLogger logger;

  HttpClient(
      {this.baseUrl = ApiUrls.baseURL,
      this.defaultHeaders = const {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      required this.logger});

  // GET METHOD
  Future<http.Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final uri =
          Uri.parse('$baseUrl$url').replace(queryParameters: queryParameters);
      //logger.logRequest('GET', uri.toString(), headers: headers);
      final response = await http.get(uri, headers: {
        ...defaultHeaders,
        if (headers != null) ...headers
      }).timeout(const Duration(seconds: 10));
      //logger.logResponse(response);
      return handleResponse(response);
    } on TimeoutException catch (e) {
      logger.logError(e);
      throw Exception('Request timeout: $e');
    } catch (e) {
      logger.logError(e);
      rethrow;
    }
  }

  // POST METHOD
  Future<http.Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final uri =
          Uri.parse('$baseUrl$url').replace(queryParameters: queryParameters);
      //logger.logRequest('POST', uri.toString(), body: data, headers: headers);
      final response = await http
          .post(
            uri,
            headers: {...defaultHeaders, if (headers != null) ...headers},
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 30));
      //logger.logResponse(response);
      return handleResponse(response);
    } on TimeoutException catch (e) {
      logger.logError(e);
      throw Exception('Request timeout: $e');
    } catch (e) {
      logger.logError(e);
      rethrow;
    }
  }

  // POST METHOD FOR FORM DATA
  Future<http.Response> postFormData(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      //print(data);
      final uri =
          Uri.parse('$baseUrl$url').replace(queryParameters: queryParameters);
      //logger.logRequest('POST', uri.toString(), body: data, headers: headers);

      // Create the MultipartRequest
      var request = http.MultipartRequest('POST', uri);

      // Add headers if they are provided
      if (headers != null) {
        request.headers.addAll(headers);
      }

      // Add fields (key-value pairs) to the form-data
      data?.forEach((key, value) {
        if (value is String || value is int || value is bool) {
          request.fields[key] =
              value.toString(); // Convert all values to strings
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

      // Send the request and get the streamed response
      final streamedResponse =
          await request.send().timeout(const Duration(seconds: 10));

      // Convert streamed response to a regular Response object
      final response = await http.Response.fromStream(streamedResponse);

      // Log the response for debugging
      //logger.logResponse(response);

      // Handle the response as needed
      return handleResponse(
          response); // Assuming handleResponse is a custom function
    } on TimeoutException catch (e) {
      logger.logError(e);
      throw Exception('Request timeout: $e');
    } catch (e) {
      logger.logError(e);
      rethrow;
    }
  }

  // post method for uploading files
  Future<http.Response> postFile(
    String url, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final uri =
          Uri.parse('$baseUrl$url').replace(queryParameters: queryParameters);
      //logger.logRequest('POST', uri.toString(), body: data, headers: headers);

      // Create the MultipartRequest
      var request = http.MultipartRequest('POST', uri);

      // Add headers if they are provided
      if (headers != null) {
        request.headers.addAll(headers);
      }

      // Add fields (key-value pairs) to the form-data
      data.forEach((key, value) {
        if (value is String || value is int || value is bool) {
          request.fields[key] =
              value.toString(); // Convert all values to strings
        }
      });

      // If there are files in data, add them as files
      data.forEach((key, value) async {
        if (value is http.MultipartFile) {
          request.files.add(value);
        }
      });

      // Send the request and get the streamed response
      final streamedResponse =
          await request.send().timeout(const Duration(seconds: 10));

      // Convert streamed response to a regular Response object
      final response = await http.Response.fromStream(streamedResponse);

      // Log the response for debugging
      //logger.logResponse(response);

      // Handle the response as needed
      return handleResponse(
          response); // Assuming handleResponse is a custom function
    } on TimeoutException catch (e) {
      logger.logError(e);
      throw Exception('Request timeout: $e');
    } catch (e) {
      logger.logError(e);
      rethrow;
    }
  }

  //

  // PUT METHOD
  Future<http.Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final uri =
          Uri.parse('$baseUrl$url').replace(queryParameters: queryParameters);
      logger.logRequest('PUT', uri.toString(), body: data, headers: headers);
      final response = await http
          .put(
            uri,
            headers: {...defaultHeaders, if (headers != null) ...headers},
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));
      logger.logResponse(response);
      return handleResponse(response);
    } on TimeoutException catch (e) {
      logger.logError(e);
      throw Exception('Request timeout: $e');
    } catch (e) {
      logger.logError(e);
      rethrow;
    }
  }

  // DELETE METHOD
  Future<http.Response> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final uri =
          Uri.parse('$baseUrl$url').replace(queryParameters: queryParameters);
      logger.logRequest('DELETE', uri.toString(), body: data, headers: headers);
      final response = await http
          .delete(
            uri,
            headers: {...defaultHeaders, if (headers != null) ...headers},
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));
      logger.logResponse(response);
      return handleResponse(response);
    } on TimeoutException catch (e) {
      logger.logError(e);
      throw Exception('Request timeout: $e');
    } catch (e) {
      logger.logError(e);
      rethrow;
    }
  }

  // Handle Response
  http.Response handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      final errorCode = response.statusCode;
      final errorBody = response.body;

      final error = {
        'code': errorCode,
        'message': errorBody,
      };

      throw Exception(jsonEncode(error));
      //throw error;
    }
  }
}
