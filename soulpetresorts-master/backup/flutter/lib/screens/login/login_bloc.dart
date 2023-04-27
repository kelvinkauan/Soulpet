import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:soulpet/shared/repositories/general_api.dart';

class LoginBloc extends BlocBase 
{
  final GeneralApi api;
  
  LoginBloc(this.api);

  final BehaviorSubject _listController = BehaviorSubject.seeded(true);

  Sink get listInput => _listController.sink;
  Observable<List> get listOut => _listController.stream.asyncMap(
    (v)=>api.getPost());

  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}