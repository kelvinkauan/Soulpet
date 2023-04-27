import 'package:kando/app/shared/utils/color_app.dart';
import 'package:flutter/material.dart';

class ButtonOutlineWidget extends StatelessWidget {
  final String text;
  final Function onPressed;

  ButtonOutlineWidget(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
            onPressed: onPressed,
            padding: EdgeInsets.only(top: 13, bottom: 13),
            splashColor: ColorApp.A4A4A4,
            borderSide: BorderSide(
              color: ColorApp.A4A4A4,
            ),
            shape: StadiumBorder(),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          );
  }
}