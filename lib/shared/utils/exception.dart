import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class ErrorEntity implements Exception {
  ErrorEntity({required this.code, required this.message});
  int code = -1;
  String message = '';

  @override
  String toString() {
    if (message == '') return 'Exception';
    return 'Exception code $code, $message';
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: 'Connection timed out');

    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: 'Send timed out');

    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: 'Receive timed out');

    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: 'Bad SSL certificates');

    case DioExceptionType.badResponse:
      switch (error.response!.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: 'Bad request');
        case 401:
          return ErrorEntity(code: 401, message: 'Permission denied');
        case 500:
          return ErrorEntity(code: 500, message: 'Server internal error');
      }
      return ErrorEntity(
        code: error.response!.statusCode!,
        message: 'Server bad response',
      );

    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: 'Server canceled it');

    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: 'Connection error');

    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: 'Unknown error');
  }
}

void onError(ErrorEntity eInfo) {
  debugPrint('error.code -> ${eInfo.code}, error.message -> ${eInfo.message}');
  switch (eInfo.code) {
    case 400:
      debugPrint('Server syntax error');
    case 401:
      debugPrint('You are denied to continue');
    case 500:
      debugPrint('Server internal error');
    default:
      debugPrint('Unknown error');
      break;
  }
}
