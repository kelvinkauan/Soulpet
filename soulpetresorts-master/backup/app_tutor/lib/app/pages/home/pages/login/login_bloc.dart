import 'package:app_tutor/app/shared/models/auth_model.dart';
import 'package:app_tutor/app/shared/models/model.dart';
import 'package:app_tutor/app/shared/models/user_model.dart';
import 'package:app_tutor/app/shared/repository/dio_repository.dart';
import 'package:app_tutor/app/shared/repository/preference.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase {
  final DioRepository dio;
  final Preference pref;

  LoginBloc({this.dio, this.pref});

  final BehaviorSubject<Model<UserModel>> model$ =
      BehaviorSubject<Model<UserModel>>.seeded(
    Model<UserModel>(object: UserModel()),
  );

  Observable<Model<UserModel>> get modelOut => model$.stream;
  Sink<Model<UserModel>> get modelIn => model$.sink;
  Model<UserModel> get model => model$.value;
  UserModel get object => model.object;

  Future<String> get signin async {
    modelIn.add(model.setLoadingTrue);
    try{
      AuthModel auth = await dio.signin(model.object);
      await pref.setSignin(auth);
      modelIn.add(model.setLoadingFalse);
      return '1';
    }catch(e){
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
