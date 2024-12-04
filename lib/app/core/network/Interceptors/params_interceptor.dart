import 'dart:async';

import 'package:http_interceptor/http_interceptor.dart';

class ParamsInterceptor implements InterceptorContract {
  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) async {
    request.url.replace(queryParameters: {
      ...request.url.queryParameters,
    });

    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
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
