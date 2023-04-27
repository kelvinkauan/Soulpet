import 'enums.dart';

class Model<T> {
  bool loading;
  bool logged;
  ViewTypes type;
  T object;

  Model({this.object, this.loading = false, this.type, this.logged = false});

  bool get getLoading => loading;

  Model get setLoadingTrue {
    this.loading = true;
    return this;
  }

  Model get setLoadingFalse {
    this.loading = false;
    return this;
  }

  @override
  String toString() =>  'LOADING => $loading || TYPE => $type || OBJECT => [$object]';
  
}
