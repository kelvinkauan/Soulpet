import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String hint;
  final String initialValue;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isValidate;
  final Function onSaved;
  final Function onValidate;

  InputWidget({
    this.hint,
    this.initialValue,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.isValidate = false,
    this.onSaved,
    this.onValidate,
  });

  String _validator(value) {
    if (value.isEmpty) {
      return 'Campo obrigatorio';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 5),
      child: TextFormField(
        keyboardType: keyboardType,
        initialValue: initialValue,
        controller: controller,
        obscureText: obscureText,
        onSaved: onSaved,
        validator:  (onValidate != null)?  onValidate : (isValidate) ? _validator : null,
        style: TextStyle(
          color: Color.fromRGBO(162, 170, 171, 1),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(210, 210, 210, 1),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: hint,
          contentPadding: const EdgeInsets.all(14.0),
          hintStyle: TextStyle(
            color: Color.fromRGBO(137, 137, 137, 1),
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
