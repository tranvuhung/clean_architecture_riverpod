import 'list_account_no.dart';

class Data {
  Data({
    this.accessToken,
    this.refreshToken,
    this.listAccountNo,
    this.accessTokenExp,
    this.refreshTokenExp,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json['accessToken'] as String?,
        refreshToken: json['refreshToken'] as String?,
        accessTokenExp: json['accessTokenExp'] as num?,
        refreshTokenExp: json['refreshTokenExp'] as num?,
        listAccountNo: (json['listAccountNo'] as List<dynamic>?)
            ?.map((dynamic e) =>
                ListAccountNo.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'listAccountNo': listAccountNo?.map((dynamic e) => e.toJson()).toList(),
      };
  String? accessToken;
  String? refreshToken;
  List<ListAccountNo>? listAccountNo;
  num? accessTokenExp;
  num? refreshTokenExp;

  @override
  String toString() {
    return 'Data(accessToken: $accessToken, refreshToken: $refreshToken, listAccountNo: $listAccountNo)';
  }
}
