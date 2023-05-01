import 'package:dio/dio.dart';

class GeneralApi {
  // instancia o dio
   final Dio dio;
   GeneralApi(this.dio);

  // metodo para pegar os posts da aplicação
  Future<List>getPost() async {
    try {
      Response response = await dio.get("/posts");
      List data = response.data;
      // print(data[0]["title"]);
      return data;
    } catch (e) {
      print(e);
    }
  }

   // metodo para pegar os users da aplicação
  Future<List>getUsers() async {
    try {
      Response response = await dio.get("/users");
      List data = response.data;
      // print(data[0]["title"]);
      return data;
    } catch (e) {
      print(e);
    }
  }



}
