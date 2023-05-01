import 'package:app_tutor/app/shared/models/product_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class ProductBloc extends BlocBase {
  final ProductModel data;

  ProductBloc({this.data});

  @override
  void dispose() {
    super.dispose();
  }
}
