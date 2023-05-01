import 'package:app_tutor/app/shared/models/user_model.dart';

class AuthModel {
  String accessToken;
  String tokenType;
  int expiresIn;
  UserModel user;

  AuthModel({this.accessToken, this.tokenType, this.expiresIn, this.user});

  AuthModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = (json['user'] != null) ? UserModel.fromJson(json['user']) : UserModel();
  }

  Map<String, dynamic> get toJson => {
        'access_token': this.accessToken,
        'token_type': this.tokenType,
        'expires_in': this.expiresIn,
        'user': this.user.toJson,
      };
}
