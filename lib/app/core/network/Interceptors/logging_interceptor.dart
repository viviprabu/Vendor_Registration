import 'dart:async';
import './../../network/http_logger.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) async {
    final logger = HttpLogger();
    logger.logRequest(request.method, request.url.toString(),
        headers: request.headers);
    //logger.logRequestBody(request.body);
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
    final logger = HttpLogger();
    logger.logResponse(response as Response);
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
