class PetTipoModel {
  int id;
  String description;
  String createdAt;
  String updatedAt;

  PetTipoModel({this.id, this.description, this.createdAt, this.updatedAt});

  PetTipoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> get toJson => {
        'id': this.id,
        'description': this.description,
        'created_at': this.createdAt,
        'updated_at': this.updatedAt,
      };

  static List<PetTipoModel> fromJsonList(List list) {
    if (list == null) return [];

    return list.map((item) => PetTipoModel.fromJson(item)).toList();
  }

  @override
  String toString() => '$toJson';
}
