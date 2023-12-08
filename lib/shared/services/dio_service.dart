import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lime_locator/shared/shared.dart';
import 'package:logger/logger.dart';

enum RequestType { get, post, put, delete, patch }

class DioService {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://65702fb109586eff6640dc31.mockapi.io',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          Logger()
            ..i('Request: ${requestOptions.method}')
            ..i('Path: ${requestOptions.path}');

          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (err, handler) {
          return handler.next(err);
        },
      ),
    );

  Future<Response<dynamic>> request(
    String url,
    RequestType requestType, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    Map<String, dynamic>? requestBody,
  }) async {
    Response<dynamic> response;
    try {
      switch (requestType) {
        case RequestType.get:
          response = await dio.get(
            url,
            queryParameters: queryParameters,
          );
        case RequestType.post:
          response = await dio.post(
            url,
            queryParameters: queryParameters,
            data: requestBody,
            options: Options(
              responseType: ResponseType.json,
            ),
          );
        case RequestType.put:
          response = await dio.put(
            url,
            data: requestBody,
            options: Options(
              responseType: ResponseType.json,
            ),
          );
        case RequestType.delete:
          response = await dio.delete(
            url,
            queryParameters: queryParameters,
            data: requestBody,
            options: Options(
              responseType: ResponseType.json,
            ),
          );
        case RequestType.patch:
          response = await dio.patch(
            url,
            queryParameters: queryParameters,
            data: requestBody,
            options: Options(
              responseType: ResponseType.json,
            ),
          );
      }

      Logger()
        ..i('Status Code: ${response.statusCode}')
        ..i('Response: ${response.data}');
      return response;
    } on DioException catch (dioError) {
      createErrorEntity(dioError);
      rethrow;
    } on SocketException {
      rethrow;
    }
  }
}
