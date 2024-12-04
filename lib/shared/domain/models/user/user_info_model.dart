import 'data.dart';

class UserInfo {
  UserInfo({
    this.success,
    this.errorCode,
    this.message,
    this.data,
    this.totalRow,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        success: json['success'] as bool?,
        errorCode: json['errorCode'] as String?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        totalRow: json['totalRow'] as int?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'success': success,
        'errorCode': errorCode,
        'message': message,
        'data': data?.toJson(),
        'totalRow': totalRow,
      };

  bool? success;
  String? errorCode;
  dynamic message;
  Data? data;
  int? totalRow;

  @override
  String toString() {
    return 'UserInfo(success: $success, errorCode: $errorCode, message: $message, data: $data, totalRow: $totalRow)';
  }
}
