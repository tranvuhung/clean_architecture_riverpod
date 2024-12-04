import 'package:clean_architecture_riverpod/shared/domain/models/either.dart';
import 'package:clean_architecture_riverpod/shared/exceptions/http_exception.dart';

class Response {
  final bool? success;
  final int? errorCode;
  final String? message;
  final dynamic data;

  const Response(
      {this.success, this.errorCode, this.message, this.data = const {}});

  @override
  String toString() =>
      'Response(statusCode: $errorCode, message: $message, data: $data)';
}

extension ResponseExtension on Response {
  Right<AppException, Response> get toRight => Right(this);
}
