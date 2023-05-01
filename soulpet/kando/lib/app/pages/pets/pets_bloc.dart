import 'package:kando/app/shared/models/model.dart';
import 'package:kando/app/shared/models/pet_model.dart';
import 'package:kando/app/shared/repository/dio_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class PetsBloc extends BlocBase {
  final DioRepository dio;

  PetsBloc(this.dio);

  final BehaviorSubject<Model<List<PetModel>>> model$ =
      BehaviorSubject<Model<List<PetModel>>>.seeded(
    Model<List<PetModel>>(
      object: List<PetModel>(),
      loading: true,
    ),
  );

  Observable<Model<List<PetModel>>> get modelOut => model$.stream;
  Sink<Model<List<PetModel>>> get modelIn => model$.sink;
  Model<List<PetModel>> get model => model$.value;
  List<PetModel> get object => model.object;

  Future<String> getData() async {
    try {
      model.object = await dio.getListPets();
      modelIn.add(model.setLoadingFalse);
      return null;
    } catch (e) {
      modelIn.add(model.setLoadingFalse);
      return e;
    }
  }

  @override
  void dispose() {
    model$.close();
    super.dispose();
  }
}
