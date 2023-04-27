import 'package:app_tutor/app/shared/widgets/button_outline_widget.dart';
import 'package:flutter/material.dart';

class BottomPopWidget extends StatelessWidget {
  final BuildContext context;
  final String title;

  BottomPopWidget(this.context, {this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          (title != null)
              ? Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(119, 134, 158, 1),
                    fontSize: 14,
                  ),
                )
              : Container(),
          (title != null) ? SizedBox(height: 5) : Container(),
          ButtonOutlineWidget(
            'Voltar',
            onPressed: () => Navigator.pop(this.context),
          ),
        ],
      ),
    );
  }
}
