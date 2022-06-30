import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:trending_movies/app/data/values/constants.dart';
import 'package:trending_movies/app/data/values/env.dart';
import 'package:trending_movies/utils/helper/exception_handler.dart';

class NetworkRequester {
  late Dio _dio;

  NetworkRequester._authenticatedRequest() {
    prepareAuthenticatedRequest();
  }

  static final NetworkRequester authenticated =
      NetworkRequester._authenticatedRequest();

  void prepareAuthenticatedRequest() {
    BaseOptions dioOptions = BaseOptions(
        connectTimeout: Timeouts.CONNECT_TIMEOUT,
        receiveTimeout: Timeouts.RECEIVE_TIMEOUT,
        baseUrl: Env.baseURL,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        headers: {
          'Accept': Headers.jsonContentType,
        },
        queryParameters: {
          'api_key': Env.apiKey
        });

    _dio = Dio(dioOptions);

    _dio.interceptors.clear();

    _dio.interceptors.addAll([
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: _printLog,
      ),
    ]);
  }

  _printLog(Object object) => log(object.toString());

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: query);
      return response.data;
    } on Exception catch (error, stack) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(
        path,
        queryParameters: query,
        data: data,
      );
      return response.data;
    } on Exception catch (error, stack) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.put(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error, stack) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> patch({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
          await _dio.patch(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error, stack) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> delete({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
          await _dio.delete(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error, stack) {
      return ExceptionHandler.handleError(error);
    }
  }
}
