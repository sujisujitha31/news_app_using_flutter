import 'dart:convert';

import 'package:dio/dio.dart';

class BaseDio {
  String baseUrl = "";
  Dio? _dio;

  Map<String, String> getHeader() {
    Map<String, String> headers = {};
    // headers = {'Authorization': 'Bearer ${g.userDetails['jwt']}'};
    return headers;
  }

  Dio? getDio() {
    Map<String, String> requestHeader = getHeader();
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          headers: requestHeader,
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );
    } else {
      _dio!.options.headers = requestHeader;
    }

    return _dio;
  }

  static final BaseDio instance = BaseDio();
}

class ApiRequest {
  final String url;
  final Map<String, dynamic> query;
  final dynamic data;

  ApiRequest({required this.url, required this.query, required this.data});

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    BaseDio.instance
        .getDio()!
        .get(url, queryParameters: query)
        .then((res) async {
          if (res.statusCode == 200 || res.statusCode == 201) {
            if (onSuccess != null) {
              onSuccess(res.data);
            }
          }
          // else if (res.statusCode == 401) {
          //   return handleUnAutherizedUser();
          // }
          else {
            if (onError != null) onError(res.statusMessage);
          }
        })
        .catchError((error) {
          if (onError != null) onError(error);
        });
  }
}
