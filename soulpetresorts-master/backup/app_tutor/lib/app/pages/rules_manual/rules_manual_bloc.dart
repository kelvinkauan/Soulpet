import 'package:app_tutor/app/app_module.dart';
import 'package:app_tutor/app/shared/models/model.dart';
import 'package:app_tutor/app/shared/models/rules_manual_model.dart';
import 'package:app_tutor/app/shared/repository/dio_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class RulesManualBloc extends BlocBase {
  final DioRepository dio = AppModule.to.getDependency<DioRepository>();

  final BehaviorSubject<Model<RulesManualModel>> model$ =
      BehaviorSubject<Model<RulesManualModel>>.seeded(
    Model<RulesManualModel>(
      object: RulesManualModel(),
      loading: true,
    ),
  );

  Observable<Model<RulesManualModel>> get modelOut => model$.stream;
  Sink<Model<RulesManualModel>> get modelIn => model$.sink;
  Model<RulesManualModel> get model => model$.value;
  RulesManualModel get object => model.object;

  Future<String> getData() async {
    try {
      model.object = await dio.getRulesManual();
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
