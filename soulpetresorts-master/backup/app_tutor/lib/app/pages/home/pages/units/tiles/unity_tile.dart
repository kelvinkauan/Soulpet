import 'package:app_tutor/app/shared/models/unity_model.dart';
import 'package:app_tutor/app/shared/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UnityTile extends StatelessWidget {
  final Function onTap;
  final UnityModel data;
  final GlobalKey<ScaffoldState> scaffodKey;

  UnityTile({this.data, this.onTap, this.scaffodKey});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListTile(
      onTap: () async {
        String retorno = await onTap(data);
        if (retorno != null) {
          scaffodKey?.currentState?.showSnackBar(SnackBar(content: Text(retorno)));
        } else {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      },
      leading: Container(
        width: (size.width * .1),
        child: logo(data.logo),
      ),
      title: Text(
        data.fantasy,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: ColorApp.C6A7074,
        ),
      ),
      subtitle: Text(data.district),
      trailing: Icon(
        FontAwesomeIcons.arrowRight,
        color: ColorApp.orange,
      ),
    );
  }

  Widget logo(String value) {
    String ext = value.substring((value.length - 3));
    return (ext == 'svg') ? SvgPicture.network(value) : Image.network(value);
  }
}
