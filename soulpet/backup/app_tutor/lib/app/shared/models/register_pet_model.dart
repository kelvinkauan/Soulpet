import 'dart:io';

import 'package:app_tutor/app/shared/helpers/utils_helper.dart';
import 'package:app_tutor/app/shared/models/pet_gender_model.dart';
import 'package:app_tutor/app/shared/models/pet_model.dart';
import 'package:app_tutor/app/shared/models/pet_porte_model.dart';
import 'package:app_tutor/app/shared/models/pet_tipo_model.dart';
import 'package:app_tutor/app/shared/models/user_model.dart';

import 'pet_raca_model.dart';
import 'pet_tipo_peolo_model.dart';

class RegisterPetModel {
  PetModel pet;
  UserModel user;
  File avatar;
  List<PetRacaModel> raca;
  List<PetPorteModel> porte;
  List<PetTipoModel> tipo;

  List<PetGenderModel> sexo;

  List<PetTipoPeloModel> tipoPelo;
  bool castrado;

  RegisterPetModel({
    this.pet,
    this.raca,
    this.porte,
    this.tipo,
    this.sexo,
    this.tipoPelo,
    this.castrado,
  });

  RegisterPetModel.fromJson(Map<String, dynamic> json) {
    pet = PetModel.fromJson(json['pet']);
    raca = json['raca'];
    porte = json['porte'];
    tipo = json['tipo'];
    sexo = json['sexo'];
    tipoPelo = json['tipo_pelo'];
    castrado = json['castrado'];
  }

  Map<String, dynamic> get toJson => {
        'pet': pet.toJson,
        'raca': raca,
        'porte': porte,
        'tipo': tipo,
        'sexo': sexo,
        'tipo_pelo': tipoPelo,
        'castrado': castrado,
      };

  static List<PetGenderModel> get getGender =>
      PetGenderModel.fromJsonList([
        {
          'id': 'MALE',
          'description': 'Masculino',
        },
        {
          'id': 'FEMALE',
          'description': 'Feminino',
        },
      ]);


  // NOTE model cadastro de pet
  Map<String, dynamic> get register => {
    'user': user.id,
    'avatar': pet.avatar,//
    'name': pet.name,//
    'type': pet.type,//
    'breed': pet.breed,//
    'gender': pet.gender,//
    'size': pet.size,//
    'type_fur': pet.typeFur,//
    'date_birth':UtilsHelper.convertDate(pet.dateBirth),//
    'castrated': pet.castrated,//
  };

  @override
  String toString() => '$toJson';
}
