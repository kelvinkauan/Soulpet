import 'package:flutter/material.dart';

class ColorApp {
  // NOTE cor padrão do APP com opcidades diferentes
  static const MaterialColor orange = MaterialColor(
    0xFFEBB900,
    <int, Color>{
      9: Color.fromRGBO(235, 185, 0, .9),
      8: Color.fromRGBO(235, 185, 0, .8),
      7: Color.fromRGBO(235, 185, 0, .7),
      6: Color.fromRGBO(235, 185, 0, .6),
      5: Color.fromRGBO(235, 185, 0, .5),
      4: Color.fromRGBO(235, 185, 0, .4),
      3: Color.fromRGBO(235, 185, 0, .3),
      2: Color.fromRGBO(235, 185, 0, .2),
      1: Color.fromRGBO(235, 185, 0, .1),
    },
  );

  // NOTE cor padrão do APP texto com opcidades diferentes
  static const MaterialColor A4A4A4 = MaterialColor(
    0xFFA4A4A4,
    <int, Color>{
      9: Color.fromRGBO(164, 164, 164, .9),
      8: Color.fromRGBO(164, 164, 164, .8),
      7: Color.fromRGBO(164, 164, 164, .7),
      6: Color.fromRGBO(164, 164, 164, .6),
      5: Color.fromRGBO(164, 164, 164, .5),
      4: Color.fromRGBO(164, 164, 164, .4),
      3: Color.fromRGBO(164, 164, 164, .3),
      2: Color.fromRGBO(164, 164, 164, .2),
      1: Color.fromRGBO(164, 164, 164, .1),
    },
  );

  // NOTE 
  static const MaterialColor C667178 = MaterialColor(
    0xFF667178,
    <int, Color>{
      9: Color.fromRGBO(102, 113, 120, .9),
      8: Color.fromRGBO(102, 113, 120, .8),
      7: Color.fromRGBO(102, 113, 120, .7),
      6: Color.fromRGBO(102, 113, 120, .6),
      5: Color.fromRGBO(102, 113, 120, .5),
      4: Color.fromRGBO(102, 113, 120, .4),
      3: Color.fromRGBO(102, 113, 120, .3),
      2: Color.fromRGBO(102, 113, 120, .2),
      1: Color.fromRGBO(102, 113, 120, .1),
    },
  );

  // NOTE 
  static const MaterialColor C6A7074 = MaterialColor(
    0xFF6A7074,
    <int, Color>{
      9: Color.fromRGBO(106, 112, 116, .9),
      8: Color.fromRGBO(106, 112, 116, .8),
      7: Color.fromRGBO(106, 112, 116, .7),
      6: Color.fromRGBO(106, 112, 116, .6),
      5: Color.fromRGBO(106, 112, 116, .5),
      4: Color.fromRGBO(106, 112, 116, .4),
      3: Color.fromRGBO(106, 112, 116, .3),
      2: Color.fromRGBO(106, 112, 116, .2),
      1: Color.fromRGBO(106, 112, 116, .1),
    },
  );



  static Map<int, Color> getColor(int r, int g, int b) {
    return {
      9: Color.fromRGBO(r, g, b, .9),
      8: Color.fromRGBO(r, g, b, .8),
      7: Color.fromRGBO(r, g, b, .7),
      6: Color.fromRGBO(r, g, b, .6),
      5: Color.fromRGBO(r, g, b, .5),
      4: Color.fromRGBO(r, g, b, .4),
      3: Color.fromRGBO(r, g, b, .3),
      2: Color.fromRGBO(r, g, b, .2),
      1: Color.fromRGBO(r, g, b, .1),
    };
  }
}

