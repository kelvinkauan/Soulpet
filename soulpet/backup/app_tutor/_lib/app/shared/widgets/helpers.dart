import 'package:app_tutor/app/shared/models/enums.dart';
import 'package:app_tutor/app/shared/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Helpers {
  static Widget loadingPage(double height) {
    return Container(
      height: (height* .65),
      child: Center(
        child: SpinKitThreeBounce(
          color: ColorApp.orange,
        ),
      ),
    );
  }

  static Widget get notDataPage => Center(
        child: Text(
          'Sem dados para serem apresentados',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      );

  static showSnackBar({
    GlobalKey<ScaffoldState> scaffodKey,
    String value,
    String valueSuccess,
    String successText,
    Function onSuccess,
  }) {
    StatusTypes type = StatusTypes.ERROR;
    String text = value;

    if (value == valueSuccess) {
      text = successText;
      type = StatusTypes.SUCCESS;
    }

    // NOTE se tiver onSuccess executa a função e não apresenta os dados
    if (type == StatusTypes.SUCCESS && onSuccess != null) {
      onSuccess();
    } else {
      scaffodKey?.currentState?.showSnackBar(
        SnackBar(
          backgroundColor:
              (type == StatusTypes.SUCCESS) ? ColorApp.orange : null,
          content: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}
