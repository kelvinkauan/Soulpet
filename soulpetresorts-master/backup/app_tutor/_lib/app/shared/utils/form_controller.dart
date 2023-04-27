import 'package:flutter/material.dart';

class FormController {
  final BuildContext context;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffodKey = GlobalKey<ScaffoldState>();

  bool validate({Function validator}) {
    FocusScope.of(context).requestFocus(new FocusNode());
    var form = key.currentState;
     // ANCHOR Envia os dados para o model, para serem validados
    form.save();
    if (validator == null) {
      if (form.validate()) {
        
        return true;
      } else {
        return false;
      }
    } else {
      // a função validator deve retornar uma string caso tenha erro e null caso esteja tudo certo!
      String retorno = validator();
      if (retorno != null) {
        scaffodKey?.currentState
            ?.showSnackBar(SnackBar(content: Text(retorno)));
        return false;
      } else {
        return true;
      }
    }
  }

  FormController(this.context);
}
