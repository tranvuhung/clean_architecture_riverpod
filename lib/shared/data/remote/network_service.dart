import 'package:clean_architecture_riverpod/shared/domain/models/either.dart';
import 'package:clean_architecture_riverpod/shared/domain/models/response.dart';
import 'package:clean_architecture_riverpod/shared/exceptions/http_exception.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, String> get headers;

  void updateHeader(Map<String, dynamic> data);

  //MARK: get
  Future<Either<AppException, Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters});

  //MARK: post
  Future<Either<AppException, Response>> post(String endpoint,
      {Map<String, dynamic>? data});
}
