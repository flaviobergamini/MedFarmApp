class MessageModel{
  final String code;
  final String message;

  MessageModel(this.code, this.message);

  MessageModel.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'];

  Map<String, dynamic> toJson() => {
    'code': code,
    'message': message
  };
}