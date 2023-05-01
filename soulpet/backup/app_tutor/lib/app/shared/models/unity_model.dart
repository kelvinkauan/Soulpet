import 'dart:convert';

class UnityModel {
  int id;
  bool lastUnity;
  String fantasy;
  String email;
  String cnpj;
  String color;
  String logo;
  String zipcode;
  String street;
  String number;
  String district;
  int country;
  String status;
  String createdAt;
  String updatedAt;

  UnityModel({
    this.id,
    this.lastUnity,
    this.fantasy,
    this.email,
    this.cnpj,
    this.color,
    this.logo,
    this.zipcode,
    this.street,
    this.number,
    this.district,
    this.country,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  UnityModel.fromString(String data) {
    if (data != null) {
      Map<String, dynamic> map = jsonDecode(data);
      _fromMap(map);
    }
  }

  UnityModel.fromJson(Map<String, dynamic> json) {
    _fromMap(json);
  }

  void _fromMap(Map<String, dynamic> data) {

    id = data['id'];
    lastUnity = data['last_unity'];
    fantasy = data['fantasy'];
    email = data['email'];
    cnpj = data['cnpj'];
    color = data['color'];
    logo = data['logo'];
    zipcode = data['zipcode'];
    street = data['street'];
    number = data['number'];
    district = data['district'];
    country = data['country'];
    status = data['status'];
    createdAt = data['created_at'];
    updatedAt = data['updated_at'];
  }

  Map<String, dynamic> get toJson => {
        'id': this.id,
        'last_unity': this.lastUnity,
        'fantasy': this.fantasy,
        'email': this.email,
        'cnpj': this.cnpj,
        'color': this.color,
        'logo': this.logo,
        'zipcode': this.zipcode,
        'street': this.street,
        'number': this.number,
        'district': this.district,
        'country': this.country,
        'status': this.status,
        'created_at': this.createdAt,
        'updated_at': this.updatedAt,
      };

  static List<UnityModel> fromJsonList(List list) {
    if (list == null) return [];

    return list.map((item) => UnityModel.fromJson(item)).toList();
  }

  static List<UnityModel> fromJsonMap(Map list) {
    if (list == null) return [];
    return list.entries
        .map((entry) => UnityModel.fromJson(entry.value))
        .toList();
  }

  @override
  String toString() => '$toJson';
}
