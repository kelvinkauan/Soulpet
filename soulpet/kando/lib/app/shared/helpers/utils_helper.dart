import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class UtilsHelper {
  // NOTE Dialog de evento de compra
  static void showToast(GlobalKey<ScaffoldState> scaffold,
      {String text}) async {
    scaffold?.currentState?.showSnackBar(SnackBar(content: Text(text)));
  }

  static String base64Image(File file) {
    List<int> bytes = file.readAsBytesSync();
    String base64 = base64Encode(bytes);
    return base64;
  }
  
  static String convertDate(String date) {
    if(date == null){return null; }
    List<String> lisDate = date.split('/'); 
    return '${lisDate[2]}-${lisDate[1]}-${lisDate[0]}';
  }
}
