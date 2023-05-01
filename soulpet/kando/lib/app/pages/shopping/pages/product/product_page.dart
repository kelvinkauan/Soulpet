import 'package:kando/app/pages/shopping/pages/product/product_bloc.dart';
import 'package:kando/app/pages/shopping/pages/product/product_module.dart';
import 'package:kando/app/shared/templates/template_two_widget.dart';
import 'package:kando/app/shared/utils/color_app.dart';
import 'package:kando/app/shared/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/amount_button_widget.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Size get size => MediaQuery.of(context).size;
  ProductBloc get bloc => ProductModule.to.getBloc<ProductBloc>();

  @override
  Widget build(BuildContext context) {
    return TemplateTwoWidget(
      context,
      title: 'Produto',
      iconBack: FontAwesomeIcons.arrowLeft,
      allBorderRadius: true,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/images/cinto.png'),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                bloc.data.title,
                style: TextStyle(
                  color: ColorApp.C667178,
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              child: Text(
                'R\$ ${bloc.data.price}',
                style: TextStyle(
                  fontSize: 22,
                  color: ColorApp.orange,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Quantidade',
                    style: TextStyle(
                      color: ColorApp.C667178,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  AmountButtonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottom: Container(
        margin: EdgeInsets.all(20),
        child: ButtonWidget('Adicionar ao carrinho'),
      ),
    );
  }
}
