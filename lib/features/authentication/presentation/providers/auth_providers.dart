//Tao mot StateNotifierProvider can con StateNotifier va Kieu data

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_architecture_riverpod/features/authentication/domain/providers/login_provider.dart';
import 'package:clean_architecture_riverpod/features/authentication/presentation/providers/state/auth_notifier.dart';
import 'package:clean_architecture_riverpod/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:clean_architecture_riverpod/features/authentication/domain/repositories/auth_repository.dart';

final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    final AuthenticationRepository authenticationRepository =
        ref.watch(authRepositoryProvider);

    return AuthNotifier(authenticationRepository: authenticationRepository);
  },
);
