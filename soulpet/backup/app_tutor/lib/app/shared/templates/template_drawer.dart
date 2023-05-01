import 'package:app_tutor/app/pages/home/home_bloc.dart';
import 'package:app_tutor/app/pages/home/home_module.dart';
import 'package:app_tutor/app/pages/home/widgets/drawer_widget.dart';
import 'package:app_tutor/app/shared/templates/widgets/header_template_widget.dart';
import 'package:app_tutor/app/shared/utils/color_app.dart';
import 'package:app_tutor/app/shared/utils/responsiveness.dart';
import 'package:app_tutor/app/shared/widgets/helpers.dart';
import 'package:flutter/material.dart';
import 'package:html_color/html_color.dart';

class TemplateDrawer extends StatelessWidget {
  final BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final double minHeightBody;
  final double topBody;
  final bool isScroll;
  final bool showHeader;
  final bool loading;
  final Widget title;
  final Widget header;
  final Widget body;
  final Widget bottom;

  TemplateDrawer(
    this.context, {
    this.scaffoldKey,
    this.showHeader = true,
    this.topBody,
    this.isScroll = false,
    this.minHeightBody = 500,
    this.loading = false,
    this.title,
    this.header,
    this.body,
    this.bottom,
  });

  Size get size => MediaQuery.of(context).size;
  Responsiveness get resp => Responsiveness(context);
  HomeBloc get bloc => HomeModule.to.getBloc<HomeBloc>();

  // NOTE configs
  double get heightHeader => (showHeader) ? 300 : 200;
  double get _topBody => (showHeader)
      ? (heightHeader - resp.height(50))
      : (heightHeader - resp.height(100));

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorApp.orange,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          drawer: (bloc.object.id != null) ? DrawerWidget(bloc) : null,
          backgroundColor: HTMLColor.fromHTML(hex: 'F1F1F1'),
          body: (isScroll)
              ? SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _body,
                      Container(
                        margin: EdgeInsets.only(
                          left: resp.width(20),
                          right: resp.width(20),
                        ),
                        width: double.infinity,
                        child: bottom,
                      ),
                    ],
                  ),
                )
              : _body,
        ),
      ),
    );
  }

  Widget get _body => Stack(
        children: <Widget>[
          HeaderTemplateWidget(
            context,
            height: heightHeader,
            header: header,
            title: title,
            showHeader: showHeader,
          ),
          (loading)
              ? Helpers.loadingPage(size.height)
              : Container(
                  margin: EdgeInsets.only(
                    top: (topBody == null) ? _topBody : topBody,
                    left: resp.width(20),
                    right: resp.width(20),
                    bottom: resp.height(10),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  constraints: BoxConstraints(
                    minHeight: resp.height(minHeightBody),
                  ),
                  child: body,
                ),
        ],
      );
}
