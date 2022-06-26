import 'package:dio/dio.dart';
import 'package:trending_movies/app/data/models/dto/error_response.dart';
import 'package:trending_movies/app/data/values/error_messages.dart';

class APIException implements Exception {
  final String message;
  final int? statusCode;

  APIException({required this.message, this.statusCode});
}

class ExceptionHandler {
  ExceptionHandler._privateConstructor();

  static APIException handleError(Exception error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.sendTimeout:
          return APIException(message: ErrorMessages.noInternet);
        case DioErrorType.connectTimeout:
          return APIException(message: ErrorMessages.connectionTimeout);
        case DioErrorType.response:
          if (error.response?.statusCode == 503) {
            return APIException(message: ErrorMessages.serverDown);
          } else {
            return APIException(
              message: ErrorResponse.fromJson(error.response?.data).message,
              statusCode: ErrorResponse.fromJson(error.response?.data).code,
            );
          }
        default:
          return APIException(message: ErrorMessages.networkGeneral);
      }
    } else {
      return APIException(message: ErrorMessages.networkGeneral);
    }
  }
}