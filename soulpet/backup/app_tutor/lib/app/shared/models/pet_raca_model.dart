class PetRacaModel {
  int id;
  String description;
  String createdAt;
  String updatedAt;

  PetRacaModel({this.id, this.description, this.createdAt, this.updatedAt});

  PetRacaModel.fromJson(Map<String, dynamic> json) {
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

  static List<PetRacaModel> fromJsonList(List list) {
    if (list == null) return [];
    return list.map((item) => PetRacaModel.fromJson(item)).toList();
  }

  @override
  String toString() => '$toJson';
}
