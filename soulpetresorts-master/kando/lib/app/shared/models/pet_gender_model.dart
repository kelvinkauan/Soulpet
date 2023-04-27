class PetGenderModel {
  String id;
  String description;

  PetGenderModel({this.id, this.description,});

  PetGenderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> get toJson => {
        'id': this.id,
        'description': this.description,
      };

  static List<PetGenderModel> fromJsonList(List list) {
    if (list == null) return [];
    return list.map((item) => PetGenderModel.fromJson(item)).toList();
  }

  @override
  String toString() => '$toJson';
}
