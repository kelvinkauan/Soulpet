import 'package:app_tutor/app/shared/utils/color_app.dart';
import 'package:app_tutor/app/shared/widgets/helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TemplateOneWidget extends StatelessWidget {
  final Widget iconDrawer;
  final Widget header;
  final Widget bottom;
  final Function builder;
  final BuildContext context;
  final double contentHeight;
  final bool appBar;
  final allBorderRadius;
  final GlobalKey<ScaffoldState> keyScaffold;
  final Function onMenu;

  final bool loading;

  TemplateOneWidget(
    this.context, {
    @required this.builder,
    this.iconDrawer,
    this.header,
    this.bottom,
    this.contentHeight,
    this.appBar = true,
    this.allBorderRadius = false,
    this.keyScaffold,
    this.loading = false,
    this.onMenu,
  });

  Size get size => MediaQuery.of(context).size;

  double get borderRadius => (loading) ? 70 : 50;
  double get top => (loading) ? .3 : .45;

  double get heigthTop => (size.height * top);

  double get porcenBody => ((header != null) ? .76 : .56);

  double get topBody => (heigthTop * porcenBody);
  double get topHeader => (topBody * .90);

  double get radiuBottom =>
      ((contentHeight != null || allBorderRadius == true) ? 50 : 0);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          _backgroundImg,
          _backgroundColor,
          _logo,
          (loading) ? Helpers.loadingPage(size.height) : Container(),
          (!loading) ? _body : Container(),
          (!loading) ? _appBar : Container(),
          (!loading) ? _header : Container(),
        ],
      ),
    );
  }

  Widget get _backgroundImg => Positioned(
        top: 0,
        child: Container(
          width: size.width,
          height: heigthTop,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(borderRadius),
              bottomLeft: Radius.circular(borderRadius),
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/pet-bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  Widget get _backgroundColor => Positioned(
        top: 0,
        child: Container(
          width: size.width,
          height: heigthTop,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ColorApp.orange[7],
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(borderRadius),
              bottomLeft: Radius.circular(borderRadius),
            ),
          ),
        ),
      );

  Widget get _appBar => Positioned(
        top: 0,
        child: (!appBar)
            ? Container()
            : Container(
                width: (size.width),
                padding: EdgeInsets.only(
                  top: (size.height * .04),
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: onMenu,
                      icon: iconDrawer,
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        FontAwesomeIcons.shoppingCart,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
      );

  Widget get _body => SafeArea(
        child: Scaffold(
          //drawer: DrawerWidget(),
          key: keyScaffold,
          backgroundColor: Colors.transparent,
          body: (bottom != null)
              ? SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: (size.height * .95),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _content,
                        SizedBox(height: 10),
                        Expanded(
                          flex: 0,
                          child: bottom,
                        ),
                      ],
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: _content,
                ),
        ),
      );

  Widget get _logo => Positioned(
        top: 0,
        child: Container(
          width: size.width,
          height: heigthTop,
          child: Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      );

  Widget get _header => Positioned(
        top: topHeader,
        child: Container(
          width: size.width,
          child: Center(
            child: (header != null) ? header : Container(),
          ),
        ),
      );

  Widget get _content => Container(
        height: contentHeight,
        margin: EdgeInsets.only(
          left: 15,
          right: 15,
          top: topBody,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(radiuBottom),
            bottomRight: Radius.circular(radiuBottom),
          ),
        ),
        alignment: Alignment.topCenter,
        child: builder(context),
      );
}
