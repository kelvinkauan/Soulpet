import 'package:kando/app/shared/models/enums.dart';
import 'package:kando/app/shared/utils/color_app.dart';
import 'package:kando/app/shared/widgets/button_alert_widget.dart';
import 'package:flutter/material.dart';

class AlertHelper {
  // NOTE Dialog de evento de compra
  static Future<bool> showCamera(BuildContext context, {Function onTap}) async {
    var retorno = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ButtonAlertWidget(
                  text: 'Câmera',
                  onTap: () => onTap(PhotoMode.CAMERA),
                ),
                Divider(
                  color: ColorApp.orange,
                  height: 2,
                ),
                ButtonAlertWidget(
                  text: 'Galeria',
                  onTap: () => onTap(PhotoMode.GALLERY),
                ),
              ],
            ),
          ),
        );
      },
    );
    return (retorno) ?? false;
  }
}
