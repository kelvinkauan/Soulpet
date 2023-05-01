import 'package:app_tutor/app/shared/models/user_model.dart';

class SignupModel {
  bool terms;
  UserModel user;

  SignupModel({
    this.terms = false,
    user,
  }) {
    this.user = (user != null) ? user : UserModel();
  }

  SignupModel.fromJson(Map<String, dynamic> json) {
    this.terms = json['terms'];
    this.user = UserModel.fromJson(json['user']);
  }

  Map<String, dynamic> get toJson => {
        'terms': this.terms,
        'user': this.user.toJson,
      };

  @override
  String toString() => '$toJson';
}
