import 'package:kando/app/shared/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool loading;

  ButtonWidget(this.text, {this.onPressed, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 5),
      child: RaisedButton(
        onPressed: (loading != false) ? null : onPressed,
        padding: EdgeInsets.only(
          top: 13,
          bottom: 13,
          left: 25,
          right: 25,
        ),
        splashColor: Colors.white,
        disabledColor: ColorApp.orange,
        color: ColorApp.orange,
        shape: StadiumBorder(),
        child: (loading != false) ? _loading : _text(text),
      ),
    );
  }

  Widget get _loading => SizedBox(
        height: 20,
        child: Center(
          child: SpinKitThreeBounce(
            color: Colors.white,
          ),
        ),
      );

  Widget _text(String text) => Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      );
}
