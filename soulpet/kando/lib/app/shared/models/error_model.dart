

class ErrorModel {
  String error; 

  ErrorModel({this.error});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    error = json['message'];
  }

  Map<String, dynamic> get toJson => {
    'message': this.error
  };



  @override
  String toString() => '$toJson';
 
}
