import 'package:clean_architecture_riverpod/shared/domain/models/either.dart';
import 'package:clean_architecture_riverpod/shared/domain/models/models.dart';
import 'package:clean_architecture_riverpod/shared/exceptions/http_exception.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, UserInfo>> login(
      {required String username, required String password});
}
