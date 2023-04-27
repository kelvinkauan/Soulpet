import 'package:app_tutor/app/shared/models/model.dart';
import 'package:app_tutor/app/shared/models/user_model.dart';
import 'package:app_tutor/app/shared/repository/preference.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  final Preference pref;

  HomeBloc(this.pref) {
    _getData;
  }

  get _getData async {
    model.logged = await pref.isLogged;
    print('========== TOKEN: ${await pref.getToken}');
    model.object = await pref.getUser;
    modelIn.add(model.setLoadingFalse);
  }

  // NOTE remover essa função depois
  Future<Null> get signOut async {
    modelIn.add(model.setLoadingTrue);
    await pref.clearData;
    model.logged = false;
    model.object = UserModel();
    modelIn.add(model.setLoadingFalse);
  }

  final BehaviorSubject<Model<UserModel>> model$ =
      BehaviorSubject<Model<UserModel>>.seeded(
    Model(
      object: UserModel(),
      loading: true,
    ),
  );

  Observable<Model<UserModel>> get modelOut => model$.stream;
  Sink<Model<UserModel>> get modelIn => model$.sink;
  Model get model => model$.value;
  UserModel get object => model.object;

  @override
  void dispose() {
    model$.close();
    super.dispose();
  }
}
