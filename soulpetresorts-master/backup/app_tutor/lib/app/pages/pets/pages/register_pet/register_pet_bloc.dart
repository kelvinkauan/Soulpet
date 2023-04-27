import 'dart:io';

import 'package:app_tutor/app/shared/models/enums.dart';
import 'package:app_tutor/app/shared/models/model.dart';
import 'package:app_tutor/app/shared/models/pet_model.dart';
import 'package:app_tutor/app/shared/models/register_pet_model.dart';
import 'package:app_tutor/app/shared/repository/dio_repository.dart';
import 'package:app_tutor/app/shared/repository/preference.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RegisterPetBloc extends BlocBase {
  final DioRepository dio;
  final Preference pref;

  RegisterPetBloc({this.dio, this.pref});

  final BehaviorSubject<Model<RegisterPetModel>> model$ =
      BehaviorSubject<Model<RegisterPetModel>>.seeded(
    Model<RegisterPetModel>(
      object: RegisterPetModel(),
      loading: true,
    ),
  );

  Observable<Model<RegisterPetModel>> get modelOut => model$.stream;
  Sink<Model<RegisterPetModel>> get modelIn => model$.sink;
  Model<RegisterPetModel> get model => model$.value;
  RegisterPetModel get object => model.object;
  PetModel get pet => model.object.pet;

  Future<String> getData() async {
    try {
      model.object.pet = PetModel();
      model.object.raca = await dio.getListBreeds();
      model.object.porte = await dio.getListSizes();
      model.object.tipo = await dio.getListTypes();
      model.object.tipoPelo = await dio.getListTypesFur();
      model.object.sexo = RegisterPetModel.getGender;

      model.object.user = await pref.getUser;

      modelIn.add(model.setLoadingFalse);
      return null;
    } catch (e) {
      modelIn.add(model.setLoadingFalse);
      return e;
    }
  }

  Future<Null> getPhotoPet(BuildContext context, {PhotoMode mode}) async {
    try {
      File imageFile;

      if (mode == PhotoMode.CAMERA) {
        imageFile = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Camera(mode: CameraMode.fullscreen),
          ),
        );
      } else {
        imageFile = await FilePicker.getFile(type: FileType.IMAGE);
      }

      pet.avatar = imageFile.path;
      object.avatar = imageFile;
      //   model.object.pet.avatar = imageFile.path;
      modelIn.add(model.change);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> registerPet() async {
    modelIn.add(model.setLoadingTrue);
    try {
      pet.avatar = await dio.uploadImage(object.avatar);
      await dio.registerPet(object);
      modelIn.add(model.setLoadingFalse);
      return '1';
    } catch (e) {
      modelIn.add(model.setLoadingFalse);
      return e;
    }
  }

  String validate() {
   if(object.avatar == null){
     return 'Selecione uma foto';
   } else if (pet.breed == null) {
      return 'Selecione uma Raça';
    } else if (pet.size == null) {
      return 'Selecione um Porte';
    } else if (pet.type == null) {
      return 'Selecione um Tipo';
    } else if (pet.gender == null) {
      return 'Selecione um Sexo';
    } else if (pet.typeFur == null) {
      return 'Selecione o tipo do pelo';
    }
    return null;
  }

  @override
  void dispose() {
    model$.close();
    super.dispose();
  }
}
