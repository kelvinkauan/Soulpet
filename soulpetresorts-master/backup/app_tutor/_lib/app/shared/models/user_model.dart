import 'dart:convert';

class UserModel {
  int id;
  String name;
  String email;
  String cpf;
  String password;
  var roles;
  String avatar;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.cpf,
    this.password,
    this.roles,
    this.avatar,
  });

  UserModel.fromString(String data) {
    if (data != null) {
      Map<String, dynamic> map = jsonDecode(data);
      _fromMap(map);
    }
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    _fromMap(json);
  }

  void _fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    email = data['email'];
    cpf = data['cpf'];
    password = data['password'];
    roles = data['roles'];
    avatar = data['avatar'];
  }

  Map<String, dynamic> get toJson => {
        'id': this.id,
        'name': this.name,
        'email': this.email,
        'cpf': this.cpf,
        'roles': this.roles,
        'avatar': this.avatar,
      };

  Map<String, dynamic> get signin => {
        'email': this.email,
        'password': this.password,
      };

  Map<String, dynamic> get signup => {
        'name': this.name,
        'email': this.email,
        'cpf': this.cpf,
        'password': this.password,
      };

  @override
  String toString() => '$toJson';
}
