import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_architecture_riverpod/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:clean_architecture_riverpod/features/authentication/domain/repositories/auth_repository.dart';
import 'package:clean_architecture_riverpod/shared/exceptions/http_exception.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository authenticationRepository;

  AuthNotifier({required this.authenticationRepository})
      : super(const AuthState.initial());

  Future<void> login(
      {required String username, required String password}) async {
    state = const AuthState.loading();
    final result = await authenticationRepository.login(
      username: username,
      password: password,
    );
    try {
      result.fold(
        (l) => state = AuthState.failure(l),
        (r) {
          if (r.success == false) {
            state = AuthState.failure(AppException(
              message: r.message,
              statusCode: int.tryParse(r.errorCode ?? '0') ?? 0,
              identifier: 'AuthNotifier.login',
            ));
          } else {
            state = AuthState.success();
          }
        },
      );
    } catch (e) {
      state = AuthState.failure(e as AppException);
    }
  }
}
