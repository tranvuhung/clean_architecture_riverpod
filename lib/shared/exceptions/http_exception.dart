import 'package:equatable/equatable.dart';
import 'package:clean_architecture_riverpod/shared/domain/models/either.dart';
import 'package:clean_architecture_riverpod/shared/domain/models/response.dart';

class AppException implements Exception {
  final String message;
  final int statusCode;
  final String identifier;
  const AppException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  });

  @override
  String toString() =>
      'AppException(message: $message, statusCode: $statusCode, identifier: $identifier)';
}

class CacheFailureException extends Equatable implements AppException {
  @override
  String get identifier => 'cache failure exception';

  @override
  String get message => 'Unable to access the cache';

  @override
  int get statusCode => 100;

  @override
  List<Object?> get props => [message, statusCode, identifier];
}

extension HttpExceptionExtension on AppException {
  Left<AppException, Response> get toLeft => Left<AppException, Response>(this);
}
