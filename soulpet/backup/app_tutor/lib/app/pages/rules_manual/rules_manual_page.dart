import 'package:app_tutor/app/pages/rules_manual/rules_manual_bloc.dart';
import 'package:app_tutor/app/shared/models/model.dart';
import 'package:app_tutor/app/shared/templates/template_drawer.dart';
import 'package:app_tutor/app/shared/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class RulesManualPage extends StatefulWidget {
  @override
  _RulesManualPageState createState() => _RulesManualPageState();
}

class _RulesManualPageState extends State<RulesManualPage> {
  final RulesManualBloc bloc = RulesManualBloc();
  final GlobalKey<ScaffoldState> scaffodKey = GlobalKey<ScaffoldState>();

  Size get size => MediaQuery.of(context).size;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    String retorno = await bloc.getData();
    if (retorno != null) {
      scaffodKey?.currentState?.showSnackBar(SnackBar(content: Text(retorno)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Model>(
      stream: bloc.modelOut,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        return TemplateDrawer(
          context,
          loading: snapshot.data.loading,
          showHeader: false,
          scaffoldKey: scaffodKey,
          title: Text('Regras'),
          minHeightBody: size.height,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Manual/Regras',
                      style: TextStyle(
                        color: ColorApp.C6A7074,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Html(
                      data: bloc.object.text,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
