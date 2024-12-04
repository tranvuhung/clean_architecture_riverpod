import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:clean_architecture_riverpod/configs/app_configs.dart';
import 'package:clean_architecture_riverpod/shared/data/remote/remote.dart';
import 'package:clean_architecture_riverpod/shared/domain/models/either.dart';
import 'package:clean_architecture_riverpod/shared/domain/models/response.dart'
    as resp;
import 'package:clean_architecture_riverpod/shared/exceptions/http_exception.dart';
import 'package:clean_architecture_riverpod/shared/globals.dart';
import 'package:clean_architecture_riverpod/shared/mixins/exception_handler_mixin.dart';

class DioNetworkSercice extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;
  DioNetworkSercice(this.dio) {
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  //MARK: BaseUrl
  @override
  String get baseUrl => AppConfigs.baseUrl;

  //MARK: Headers
  @override
  Map<String, String> get headers => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if (!kTestMode) {
      dio.options.headers = header;
    }
    return header;
  }

  @override
  Future<Either<AppException, resp.Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.get(endpoint, queryParameters: queryParameters),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, resp.Response>> post(String endpoint,
      {Map<String, dynamic>? data}) {
    final res = handleException(
      () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
