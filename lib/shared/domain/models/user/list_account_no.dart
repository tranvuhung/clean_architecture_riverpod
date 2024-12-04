class ListAccountNo {
  ListAccountNo(
      {this.userId,
      this.accountNo,
      this.accountName,
      this.description,
      this.isDefault,
      this.isAllowBond,
      this.isAllowFund,
      this.isAlphaAccount,
      this.loginType,
      this.profesType,
      this.requestChangeInfoType,
      this.requireChangePass});

  factory ListAccountNo.fromJson(Map<String, dynamic> json) => ListAccountNo(
        userId: json['userId'] as String?,
        accountNo: json['accountNo'] as String?,
        accountName: json['accountName'] as String?,
        description: json['description'] as String?,
        isDefault: json['isDefault'] as bool?,
        isAllowFund: json['isAllowFund'] as bool?,
        isAlphaAccount: json['isAlphaAccount'] as bool?,
        isAllowBond: json['isAllowBond'] as bool?,
        loginType: json['loginType'] as num?,
        profesType: json['profesType'] as num?,
        requestChangeInfoType: json['requestChangeInfoType'] as num?,
        requireChangePass: json['requireChangePass'] != null
            ? json['requireChangePass'] as bool?
            : false,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'accountNo': accountNo,
        'accountName': accountName,
        'description': description,
        'isDefault': isDefault,
      };
  String? userId;
  String? accountNo;
  String? accountName;
  String? description;
  bool? isDefault;
  bool? isAllowFund;
  bool? isAlphaAccount;
  bool? isAllowBond;
  num? loginType;
  num? profesType;
  num? requestChangeInfoType;
  //1: yeu cau thay doi - ko bat buoc
  //2: bat buoc thay doi
  bool? requireChangePass;

  @override
  String toString() {
    return 'ListAccountNo(userId: $userId, accountNo: $accountNo, accountName: $accountName,description: $description)';
  }
}
