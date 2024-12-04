import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_architecture_riverpod/shared/data/remote/dio_network_sercice.dart';
import 'package:clean_architecture_riverpod/shared/data/remote/network_service.dart';

final networkServiceProvider = Provider<NetworkService>((ref) {
  final Dio dio = Dio();
  return DioNetworkSercice(dio);
});
