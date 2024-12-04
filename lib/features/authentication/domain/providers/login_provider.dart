import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_architecture_riverpod/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:clean_architecture_riverpod/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:clean_architecture_riverpod/features/authentication/domain/repositories/auth_repository.dart';
import 'package:clean_architecture_riverpod/shared/data/remote/remote.dart';
import 'package:clean_architecture_riverpod/shared/domain/providers/dio_network_service_provider.dart';

final authenticationDataSourceProvider =
    Provider.family<AuthenticationDataSource, NetworkService>(
        (_, networkService) {
  return LoginRemoteDataSource(networkService: networkService);
});

final authRepositoryProvider = Provider<AuthenticationRepository>((ref) {
  final NetworkService networkService = ref.watch(networkServiceProvider);
  final AuthenticationDataSource authenticationDataSource =
      ref.watch(authenticationDataSourceProvider(networkService));
  return AuthenticationRepositoryImpl(
      authenticationDataSource: authenticationDataSource);
});
