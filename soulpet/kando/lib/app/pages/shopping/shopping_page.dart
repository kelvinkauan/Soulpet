import 'package:kando/app/shared/models/product_model.dart';
import 'package:kando/app/shared/templates/template_two_widget.dart';
import 'package:flutter/material.dart';

import 'tiles/product_tile.dart';
import 'widgets/search_widget.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  Size get size => MediaQuery.of(context).size;
  List<ProductModel> get list => ProductModel.getData;

  @override
  Widget build(BuildContext context) {
    return TemplateTwoWidget(
      context,
      title: 'Produtos',
      contentHeight: (size.height * .85),
      allBorderRadius: true,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: SearchWidget(),
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: ListView.separated(
                itemCount: list.length,
                separatorBuilder: (context, i) => Divider(),
                itemBuilder: (context, i) => ProductTile(list[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
