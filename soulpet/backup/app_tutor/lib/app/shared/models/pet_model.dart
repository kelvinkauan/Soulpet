class PetModel {
  int id;
  String avatar;
  String name;
  int type;
  int breed;
  String gender;
  int size;
  int typeFur;
  String dateBirth;
  int castrated;
  String rationBrand;
  int timesDay;
  int amountTime;
  String typesFood;
  String obsFood;
  int sachet;
  int perfume;
  int ornament;
  int alive;
  int pool;
  String obsGeneral;
  String vetName;
  String telPhone;
  String obsMedical;
  String vaccinationCarter;
  String caseEmergency;
  String caseSymptoms;
  String dateCio;
  String dateEvaluation;
  int behavior;
  String hasServices;
  String specialAttention;
  String attention;
  String obsAlert;
  String status;
  String createdAt;
  String updatedAt;

  PetModel({
    this.id,
    this.avatar,
    this.name,
    this.type,
    this.breed,
    this.gender,
    this.size,
    this.typeFur,
    this.dateBirth,
    this.castrated,
    this.rationBrand,
    this.timesDay,
    this.amountTime,
    this.typesFood,
    this.obsFood,
    this.sachet,
    this.perfume,
    this.ornament,
    this.alive,
    this.pool,
    this.obsGeneral,
    this.vetName,
    this.telPhone,
    this.obsMedical,
    this.vaccinationCarter,
    this.caseEmergency,
    this.caseSymptoms,
    this.dateCio,
    this.dateEvaluation,
    this.behavior,
    this.hasServices,
    this.specialAttention,
    this.attention,
    this.obsAlert,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  PetModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
    type = json['type'];
    breed = json['breed'];
    gender = json['gender'];
    size = json['size'];
    typeFur = json['type_fur'];
    dateBirth = json['date_birth'];
    castrated = json['castrated'];
    rationBrand = json['ration_brand'];
    timesDay = json['times_day'];
    amountTime = json['amount_time'];
    typesFood = json['types_food'];
    obsFood = json['obs_food'];
    sachet = json['sachet'];
    perfume = json['perfume'];
    ornament = json['ornament'];
    alive = json['alive'];
    pool = json['pool'];
    obsGeneral = json['obs_general'];
    vetName = json['vet_name'];
    telPhone = json['tel_phone'];
    obsMedical = json['obs_medical'];
    vaccinationCarter = json['vaccination_carter'];
    caseEmergency = json['case_emergency'];
    caseSymptoms = json['case_symptoms'];
    dateCio = json['date_cio'];
    dateEvaluation = json['date_evaluation'];
    behavior = json['behavior'];
    hasServices = json['has_services'];
    specialAttention = json['special_attention'];
    attention = json['attention'];
    obsAlert = json['obs_alert'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> get toJson => {
        'id': this.id,
        'avatar': this.avatar,
        'name': this.name,
        'type': this.type,
        'breed': this.breed,
        'gender': this.gender,
        'size': this.size,
        'type_fur': this.typeFur,
        'date_birth': this.dateBirth,
        'castrated': this.castrated,
        'ration_brand': this.rationBrand,
        'times_day': this.timesDay,
        'amount_time': this.amountTime,
        'types_food': this.typesFood,
        'obs_food': this.obsFood,
        'perfume': this.perfume,
        'ornament': this.ornament,
        'alive': this.alive,
        'pool': this.pool,
        'sachet': this.sachet,
        'obs_general': this.obsGeneral,
        'vet_name': this.vetName,
        'tel_phone': this.telPhone,
        'obs_medical': this.obsMedical,
        'vaccination_carter': this.vaccinationCarter,
        'case_emergency': this.caseEmergency,
        'case_symptoms': this.caseSymptoms,
        'date_cio': this.dateCio,
        'date_evaluation': this.dateEvaluation,
        'behavior': this.behavior,
        'has_services': this.hasServices,
        'special_attention': this.specialAttention,
        'attention': this.attention,
        'obs_alert': this.obsAlert,
        'status': this.status,
        'created_at': this.createdAt,
        'updated_at': this.updatedAt,
      };

  static List<PetModel> fromJsonList(List list) {
    if (list == null) return [];

    return list.map((item) => PetModel.fromJson(item)).toList();
  }

  static List<PetModel> fromJsonMap(Map list) {
    if (list == null) return [];
    return list.entries.map((entry) => PetModel.fromJson(entry.value)).toList();
  }


  @override
  String toString() => '$toJson';
}
