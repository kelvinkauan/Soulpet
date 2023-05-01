import 'package:flutter/cupertino.dart';

class Responsiveness {
  final BuildContext context;

  Responsiveness(this.context);

  double height(double value) {
    double height = MediaQuery.of(context).size.height;
    return (height * (value / height));
  }

  double width(double value) {
    double width = MediaQuery.of(context).size.width;
    return (width * (value / width));
  }
}
