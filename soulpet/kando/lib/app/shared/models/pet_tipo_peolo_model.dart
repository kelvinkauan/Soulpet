class PetTipoPeloModel {
  int id;
  int type;
  String description;
  String createdAt;
  String updatedAt;

  PetTipoPeloModel({
    this.id,
    this.type,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  PetTipoPeloModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> get toJson => {
        'id': this.id,
        'type': this.type,
        'description': this.description,
        'created_at': this.createdAt,
        'updated_at': this.updatedAt,
      };

  static List<PetTipoPeloModel> fromJsonList(List list) {
    if (list == null) return [];

    return list.map((item) => PetTipoPeloModel.fromJson(item)).toList();
  }

  @override
  String toString() => '$toJson';
}
