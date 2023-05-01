import 'dart:io';

import 'package:app_tutor/app/shared/dio/custom_dio.dart';
import 'package:app_tutor/app/shared/models/auth_model.dart';
import 'package:app_tutor/app/shared/models/pet_model.dart';
import 'package:app_tutor/app/shared/models/pet_porte_model.dart';
import 'package:app_tutor/app/shared/models/pet_raca_model.dart';
import 'package:app_tutor/app/shared/models/pet_tipo_model.dart';
import 'package:app_tutor/app/shared/models/pet_tipo_peolo_model.dart';
import 'package:app_tutor/app/shared/models/register_pet_model.dart';
import 'package:app_tutor/app/shared/models/rules_manual_model.dart';
import 'package:app_tutor/app/shared/models/unity_model.dart';
import 'package:app_tutor/app/shared/models/user_model.dart';
import 'package:dio/dio.dart';

class DioRepository {
  final CustomDio _dio;

  DioRepository(this._dio);

  Future signin(UserModel user) async {
    try {
      var response = await _dio.post('/auth/login', data: user.signin);
      return AuthModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<UserModel> signup(UserModel user) async {
    try {
      var response = await _dio.post(
        '/users',
        data: user.signup,
      );
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<List<UnityModel>> getListUnits() async {
    try {
      var response = await _dio.get('/units');
      return UnityModel.fromJsonList(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<RulesManualModel> getRulesManual() async {
    try {
      var response = await _dio.get('/rules-manual');
      return RulesManualModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  // NOTE busca lista de pets
  Future<List<PetModel>> getListPets() async {
    try {
      var response = await _dio.get('/pets');
      return PetModel.fromJsonList(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  // ===============================
  // ===============================
  // ===============================

  // NOTE listagem Raça
  Future<List<PetRacaModel>> getListBreeds() async {
    try {
      var response = await _dio.get('/pet-breeds');
      return PetRacaModel.fromJsonList(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  // NOTE listagem Porte
  Future<List<PetPorteModel>> getListSizes() async {
    try {
      var response = await _dio.get('/pet-sizes');
      return PetPorteModel.fromJsonList(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  // NOTE listagem Tipos
  Future<List<PetTipoModel>> getListTypes() async {
    try {
      var response = await _dio.get('/pet-types');
      return PetTipoModel.fromJsonList(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  // NOTE listagem Tipos Pelos
  Future<List<PetTipoPeloModel>> getListTypesFur() async {
    try {
      var response = await _dio.get('/pet-type-furs');
      return PetTipoPeloModel.fromJsonList(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  // ===============================
  // ===============================
  // ===============================

  // NOTE valida token
  Future<bool> verifyToken() async {
    try {
      var response = await _dio.post('/auth/check');
      return response.data['token'];
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  // NOTE Atualiza token
  Future<AuthModel> refreshToken() async {
    try {
      var response = await _dio.post('/auth/refresh');
      return AuthModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  // NOTE Cadastra pet
  Future<bool> registerPet(RegisterPetModel object) async {
    try {
      await _dio.post(
        '/pets',
        data: object.register,
      );

      return true; //UserModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<String> uploadImage(File file) async {
    FormData formData = FormData.from({
      'image': UploadFileInfo(file, null),
    });

    var response = await _dio.post("/upload-image", data: formData);

    return response.data;
  }
}
