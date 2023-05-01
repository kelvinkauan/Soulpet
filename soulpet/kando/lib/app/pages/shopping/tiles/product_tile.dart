import 'package:kando/app/pages/shopping/pages/product/product_module.dart';
import 'package:kando/app/shared/models/product_model.dart';
import 'package:kando/app/shared/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductTile extends StatelessWidget {
  final ProductModel data;

  ProductTile(this.data);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProductModule(data),
        ),
      ),
      leading: CircleAvatar(),
      title: Text(data.title),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Text(
          'R\$ ${data.price}',
          style: TextStyle(
            color: ColorApp.orange,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      trailing: Icon(
        FontAwesomeIcons.shoppingCart,
        size: 17,
        color: ColorApp.orange,
      ),
    );
  }
}
