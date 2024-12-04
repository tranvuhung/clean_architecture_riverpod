import 'package:clean_architecture_riverpod/shared/data/remote/remote.dart';
import 'package:clean_architecture_riverpod/shared/domain/models/either.dart';
import 'package:clean_architecture_riverpod/shared/domain/models/models.dart';
import 'package:clean_architecture_riverpod/shared/exceptions/http_exception.dart';

abstract class AuthenticationDataSource {
  Future<Either<AppException, UserInfo>> login(
      {required String username, required String password});
}

class LoginRemoteDataSource extends AuthenticationDataSource {
  final NetworkService networkService;
  LoginRemoteDataSource({required this.networkService});

  @override
  Future<Either<AppException, UserInfo>> login(
      {required String username, required String password}) async {
    try {
      final eitherType = await networkService.post(
        'System/login',
        data: {
          'userId': username,
          'password': password,
          "DeviceInfo":
              "{\"uniqueId\":\"623B29F4-73A0-43AB-85E6-C86690BE391C\",\"bundleID\":\"com.tvsi.itrade\",\"buildNumber\":\"470\",\"deviceName\":\"\",\"ip\":\"\",\"systemName\":\"iOS\",\"systemVersion\":\"17.6.1\",\"FirebaseDeviceToken\":\"d3mL108FyUFNv9BoflpnyA:APA91bGcWGjV_9YtH8xbUnJwrbUcsiCfRBYRSka6jcP5lPPhKgD5KVOpIdbGUsUH8uk2Zkg-Fdrt91h0KghDhRRoEEdZc2zSJsUY3V3jgWC6kq6gY8VLGdM\",\"fingerprint\":\"\",\"isPhysicalDevice\":true,\"machine\":\"iPhone14,3\",\"model\":null}"
        },
      );
      return eitherType.fold(
        (l) {
          return Left(l);
        },
        (r) {
          final userInfo = UserInfo.fromJson(r.data);
          networkService.updateHeader({
            'Authorization': 'Bearer ${userInfo.data?.accessToken}',
          });
          return Right(userInfo);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
        ),
      );
    }
  }
}
