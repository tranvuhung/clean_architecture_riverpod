import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:clean_architecture_riverpod/shared/data/remote/remote.dart';
import 'package:clean_architecture_riverpod/shared/domain/models/either.dart';
import 'package:clean_architecture_riverpod/shared/exceptions/http_exception.dart';
import 'package:clean_architecture_riverpod/shared/domain/models/response.dart'
    as resp;

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, resp.Response>> handleException<T extends Object>(
      Future<Response<dynamic>> Function() handler,
      {String endpoint = ''}) async {
    try {
      final response = await handler();
      return Right(
        resp.Response(
          errorCode: response.statusCode,
          data: response.data,
          message: response.statusMessage,
        ),
      );
    } catch (e) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      log(e.runtimeType.toString());

      switch (e.runtimeType) {
        case SocketException:
          e as SocketException;
          message = 'Unable to connect to the server';
          statusCode = 0;
          identifier = 'SocketException ${e.message} \n at $endpoint';
          break;
        case DioException:
          e as DioException;
          message = e.response?.data['message'] ?? 'Internal Server Error';
          statusCode = 1;
          identifier = 'DioException ${e.message} \n at $endpoint';
          break;
        default:
          message = 'Unknown error occurred';
          statusCode = 2;
          identifier = 'Unknown error ${e.toString()}\n at $endpoint';
      }

      return Left(AppException(
        message: message,
        statusCode: statusCode,
        identifier: identifier,
      ));
    }
  }
}
