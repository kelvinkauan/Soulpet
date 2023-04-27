import 'package:kando/app/shared/utils/color_app.dart';
import 'package:kando/app/shared/utils/responsiveness.dart';
import 'package:flutter/material.dart';

class HeaderTemplateWidget extends StatelessWidget {
  final BuildContext context;
  final double height;
  final bool showHeader;
  final Widget header;
  final Widget title;

  HeaderTemplateWidget(
    this.context, {
    this.height,
    this.header,
    this.title,
    this.showHeader,
  });

  Size get size => MediaQuery.of(context).size;
  Responsiveness get resp => Responsiveness(context);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _backgroundImg,
        _backgroundColor,
        _appBar,
        (showHeader)? _logo : Container(),
        // HEADER
        (showHeader)? _header : Container()
      ],
    );
  }

  // NOTE appBar
  Widget get _appBar => AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 25,
        ),
        elevation: 0,
        title: title,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 25,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
      );

  Widget get _backgroundImg => Container(
        width: size.width,
        height: resp.height(height),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(75),
            bottomLeft: Radius.circular(75),
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/pet-bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget get _backgroundColor => Container(
        width: size.width,
        height: resp.height(height),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorApp.orange[7],
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(75),
            bottomLeft: Radius.circular(75),
          ),
        ),
      );

  Widget get _logo => Positioned(
        top: 0,
        child: Container(
          width: size.width,
          height: (resp.height(height) - resp.height(50)),
          child: Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: resp.width(175),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      );

  Widget get _header => Positioned(
        top: resp.height(height - resp.height(110)),
        child: Container(
          width: size.width,
          child: Center(
            child: (header != null) ? header : Container(),
          ),
        ),
      );
}
