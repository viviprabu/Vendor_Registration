import 'dart:async';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor implements InterceptorContract {
  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');

    //request.headers['Authorization'] = 'Bearer $token';

    request.headers.addAll({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
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
