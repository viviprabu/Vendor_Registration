import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';

class HttpLogger {
  Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: true,
      printEmojis: true,
    ),
  );

  void logRequest(String method, String url,
      {dynamic body, Map<String, String>? headers}) {
    logger.i('$method request ==> $url');
    if (body != null) {
      logger.d('Request Body: ${jsonEncode(body)}');
    }
    if (headers != null) {
      logger.d('Request Headers: $headers');
    }
  }

  void logResponse(http.Response response) {
    logger.d('Response STATUS CODE: ${response.statusCode}');
    logger.d('Response REASON: ${response.reasonPhrase}');
    logger.d('Response HEADERS: ${response.headers}');
    logger.d('Response BODY: ${response.body}');
  }

  void logError(dynamic error) {
    logger.e('Error: $error');
  }
}
