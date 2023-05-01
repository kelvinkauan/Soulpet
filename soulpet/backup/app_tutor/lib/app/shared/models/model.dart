import 'enums.dart';

class Model<T> {
  bool loading;
  bool logged;
  int indexDrawer;
  ViewTypes type;
  T object;

  Model({
    this.object,
    indexDrawer = 0,
    this.loading = false,
    this.type,
    this.logged = false,
  });

  bool get getLoading => loading;

  Model get setLoadingTrue {
    this.loading = true;
    return this;
  }

  Model get setLoadingFalse {
    this.loading = false;
    return this;
  }

  Model get change => this;

  @override
  String toString() =>
      'LOADING => $loading || TYPE => $type || OBJECT => [$object]';
}
