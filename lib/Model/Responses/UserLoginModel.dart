class UserLoginModel {
  final String code;
  final int id;
  final String accessToken;
  final String refreshToken;

  UserLoginModel(this.code, this.id, this.accessToken, this.refreshToken);

  UserLoginModel.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        id = json['id'],
        accessToken = json['accessToken'],
        refreshToken = json['refreshToken'];

  Map<String, dynamic> toJson() => {
        'code': code,
        'id': id,
        'accessToken': accessToken,
        'refreshToken': refreshToken
      };
}
