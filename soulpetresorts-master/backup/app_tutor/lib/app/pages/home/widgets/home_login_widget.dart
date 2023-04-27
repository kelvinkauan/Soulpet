import 'package:app_tutor/app/shared/models/item_menu_model.dart';
import 'package:flutter/material.dart';

import 'bottom_signup_widget.dart';
import 'item_menu_widget.dart';

class HomeLoginWidget extends StatelessWidget {
  // NOTE menu logado e menu deslogado
  final List<ItemMenuModel> menu = ItemMenuModel.getMenusLogout;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: (size.height * 0.6),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GridView.builder(
              itemCount: menu.length,
              shrinkWrap: false,
              itemBuilder: (BuildContext context, int i) =>
                  ItemMenuWidget(menu[i]),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: BottomSignupWidget(),
          ),
        ],
      ),
    );
  }
}
