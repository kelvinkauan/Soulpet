import 'package:kando/app/pages/home/pages/units/units_bloc.dart';
import 'package:kando/app/pages/home/pages/units/units_module.dart';
import 'package:kando/app/shared/models/model.dart';
import 'package:kando/app/shared/models/unity_model.dart';
import 'package:kando/app/shared/templates/template_one_widget.dart';
import 'package:flutter/material.dart';

import 'tiles/unity_tile.dart';

class UnitsPage extends StatefulWidget {
  @override
  _UnitsPageState createState() => _UnitsPageState();
}

class _UnitsPageState extends State<UnitsPage> {
  final GlobalKey<ScaffoldState> scaffodKey = GlobalKey<ScaffoldState>();

  Size get size => MediaQuery.of(context).size;
  UnitsBloc get bloc => UnitsModule.to.getBloc<UnitsBloc>();

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

          return TemplateOneWidget(
            context,
            keyScaffold: scaffodKey,
            iconDrawer: Container(),
            loading: snapshot.data.loading,
            header: Column(
              children: <Widget>[
                Text(
                  'Bem Vindo!',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                user,
              ],
            ),
            builder: (context) {
              return Container(
                height: (size.height * .6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 0,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Deseja entrar em qual unidade?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: lastUnity(bloc.lastUnity),
                    ),
                    Expanded(
                      flex: 1,
                      child: units(bloc.object),
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  Widget get user => Text(
        bloc.userName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      );

  Widget lastUnity(UnityModel data) {
    if (data.id == null) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Última unidade acessada',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          UnityTile(
            data: data,
            onTap: bloc.setUnity,
            scaffodKey: scaffodKey,
          ),
          Divider()
        ],
      ),
    );
  }

  Widget units(List<UnityModel> list) => Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Text(
                'Outras unidades',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.separated(
                itemCount: list.length,
                itemBuilder: (context, i) => UnityTile(
                  data: list[i],
                  onTap: bloc.setUnity,
                  scaffodKey: scaffodKey,
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
              ),
            ),
          ],
        ),
      );
}
