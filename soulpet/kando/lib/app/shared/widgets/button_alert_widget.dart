import 'package:flutter/material.dart';

class ButtonAlertWidget extends StatelessWidget {
  final Function onTap;
  final String text;

  ButtonAlertWidget({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
