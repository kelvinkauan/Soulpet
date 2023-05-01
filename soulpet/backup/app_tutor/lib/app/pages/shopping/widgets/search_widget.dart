import 'package:app_tutor/app/shared/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        filled: true,
        hintText: 'Buscar',
        fillColor: Colors.grey[300],
        contentPadding: EdgeInsets.all(14),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300],
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300],
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        hintStyle: TextStyle(
          color: ColorApp.C6A7074,
          fontSize: 15,
        ),
        prefixIcon: Icon(
          FontAwesomeIcons.search,
          color: ColorApp.C6A7074,
          size: 16,
        ),
      ),
    );
  }
}
