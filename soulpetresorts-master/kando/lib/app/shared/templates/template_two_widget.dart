import 'package:kando/app/shared/utils/color_app.dart';
import 'package:kando/app/shared/widgets/helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TemplateTwoWidget extends StatelessWidget {
  final Widget bottom;
  final IconData iconBack;
  final Widget body;
  final BuildContext context;
  final double contentHeight;
  final allBorderRadius;
  final GlobalKey<ScaffoldState> keyScaffold;
  final String title;

  final bool loading;

  TemplateTwoWidget(
    this.context, {
    @required this.body,
    this.bottom,
    this.iconBack = FontAwesomeIcons.home,
    this.contentHeight,
    this.allBorderRadius = false,
    this.keyScaffold,
    this.loading = false,
    this.title = '' 
  });

  Size get size => MediaQuery.of(context).size;

  double get heigthTop => (size.height * .3);
  double get borderRadius => 75;

  double get topBody => (heigthTop * .3);

  double get radiuBottom => ((contentHeight != null || allBorderRadius == true) ? 50 : 0);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          _backgroundImg,
          _backgroundColor,
          (loading) ? Helpers.loadingPage(size.height) : Container(),
          (!loading) ? _body : Container(),
          (!loading) ? _appBar : Container(),
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
        child: Container(
          width: (size.width),
          padding: EdgeInsets.only(
            top: (size.height * .04),
            left: 10,
            right: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 0,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    iconBack,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                flex: 0,
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    FontAwesomeIcons.shoppingCart,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget get _body => SafeArea(
        child: Scaffold(
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

  Widget get _content => Container(
        height: contentHeight,
        margin: EdgeInsets.only(
          left: 15,
          right: 15,
          top: topBody,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey[300],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
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
        child: body,
      );
}
