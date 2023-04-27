import 'package:kando/app/shared/models/item_menu_model.dart';
import 'package:kando/app/shared/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemMenuWidget extends StatelessWidget {
  final ItemMenuModel data;

  ItemMenuWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          if(data.route != null) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => data.route));
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              data.url,
              height: 70,
              color: ColorApp.orange,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              data.label,
              style: TextStyle(
                color: ColorApp.A4A4A4,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
