import 'package:kando/app/pages/home/pages/signup/models/signup_model.dart';
import 'package:kando/app/shared/models/model.dart';
import 'package:kando/app/shared/repository/dio_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class SignupBloc extends BlocBase {
  final DioRepository dio;

  SignupBloc(this.dio);

  final BehaviorSubject<Model<SignupModel>> model$ =
      BehaviorSubject<Model<SignupModel>>.seeded(
    Model<SignupModel>(object: SignupModel()),
  );

  Observable<Model<SignupModel>> get modelOut => model$.stream;
  Sink<Model<SignupModel>> get modelIn => model$.sink;
  Model<SignupModel> get model => model$.value;
  SignupModel get object => model.object;

    Future<String> cadastrar() async {
    modelIn.add(model.setLoadingTrue);
    try {

      // NOTE verifico se o termo marcado
      if(object.terms != true) {
        throw 'Aceite os termos';
      }
      
      await dio.signup(object.user);
      
      modelIn.add(model.setLoadingFalse);
      return '1';
    } catch (e) {
      modelIn.add(model.setLoadingFalse);
      return  e;
    }
  }

  @override
  void dispose() {
     model$.close();
    super.dispose();
  }
}
