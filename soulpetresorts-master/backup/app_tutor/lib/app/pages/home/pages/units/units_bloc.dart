import 'package:app_tutor/app/shared/models/model.dart';
import 'package:app_tutor/app/shared/models/unity_model.dart';
import 'package:app_tutor/app/shared/repository/dio_repository.dart';
import 'package:app_tutor/app/shared/repository/preference.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class UnitsBloc extends BlocBase {
  final Preference pref;
  final DioRepository dio;

  UnitsBloc({this.pref, this.dio});

  String userName = '';
  UnityModel lastUnity = UnityModel();

  final BehaviorSubject<Model<List<UnityModel>>> model$ =
      BehaviorSubject<Model<List<UnityModel>>>.seeded(
    Model<List<UnityModel>>(object: [], loading: true),
  );
  Observable<Model<List<UnityModel>>> get modelOut => model$.stream;
  Sink<Model<List<UnityModel>>> get modelIn => model$.sink;
  Model<List<UnityModel>> get model => model$.value;
  List<UnityModel> get object => model.object;

  Future<String> getData() async {
    try {
      userName = await pref.getUserName;
      lastUnity = await pref.getUnity;
      model.object = await dio.getListUnits();
      modelIn.add(model.setLoadingFalse);
      return null;
    } catch (e) {
      modelIn.add(model.setLoadingFalse);
      return e;
    }
  }

  Future<String> setUnity(UnityModel unity) async {
  //  modelIn.add(model.setLoadingTrue);
    try {
      pref.setUnity(unity);
   //   modelIn.add(model.setLoadingFalse);
      return null;
    } catch (e) {
  //    modelIn.add(model.setLoadingFalse);
      return e;
    }
  }

  @override
  void dispose() {
    model$.close();
    super.dispose();
  }
}
