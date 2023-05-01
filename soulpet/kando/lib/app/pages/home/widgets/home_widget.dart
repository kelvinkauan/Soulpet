import 'package:kando/app/shared/models/item_menu_model.dart';
import 'package:flutter/material.dart';

import 'item_menu_widget.dart';

class HomeWidget extends StatelessWidget {
  // NOTE menu logado
  final List<ItemMenuModel> menu = ItemMenuModel.getMenus;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: menu.length,
      shrinkWrap: false,
      itemBuilder: (BuildContext context, int i) => ItemMenuWidget(menu[i]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
    );
  }
}
