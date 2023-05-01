class RulesManualModel {
  int id;
  String text;
  String createdAt;
  String updatedAt;

  RulesManualModel({this.id, this.text = '', this.createdAt, this.updatedAt});

  RulesManualModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> get toJson => {
    'id': this.id,
    'text': this.text,
    'created_at': this.createdAt,
    'updated_at': this.updatedAt,
  };

  @override
  String toString() => '$toJson';
}
