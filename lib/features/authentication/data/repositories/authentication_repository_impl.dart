import 'package:clean_architecture_riverpod/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:clean_architecture_riverpod/features/authentication/domain/repositories/auth_repository.dart';
import 'package:clean_architecture_riverpod/shared/domain/models/either.dart';
import 'package:clean_architecture_riverpod/shared/domain/models/models.dart';
import 'package:clean_architecture_riverpod/shared/exceptions/http_exception.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDataSource authenticationDataSource;
  AuthenticationRepositoryImpl({required this.authenticationDataSource});

  @override
  Future<Either<AppException, UserInfo>> login(
      {required String username, required String password}) {
    return authenticationDataSource.login(
      username: username,
      password: password,
    );
  }
}
