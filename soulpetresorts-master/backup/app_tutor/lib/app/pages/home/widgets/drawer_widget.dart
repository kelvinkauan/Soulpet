import 'package:app_tutor/app/pages/home/home_bloc.dart';
import 'package:app_tutor/app/shared/utils/color_app.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final HomeBloc bloc;

  DrawerWidget(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: ColorApp.orange),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          maxRadius: 40,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(bloc.object.avatar),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              (bloc.object.name != null)
                                  ? bloc.object.name
                                  : '',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              (bloc.object.email != null)
                                  ? bloc.object.email
                                  : '',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              selected: (bloc.model.indexDrawer == 0) ? true : false,
              title: Text('Home'),
              onTap: (){
                Navigator.popUntil(context, ModalRoute.withName('/home'));
              },
            ),
            Divider(),
            /*
            ListTile(
              selected: (bloc.model.indexDrawer == 1) ? true : false,
              title: Text('Minha Conta'),
            ),
            Divider(),
            */
            ListTile(
              title: Text('Sair'),
              onTap: () {
                bloc.signOut;
                Navigator.popUntil(context, ModalRoute.withName('/home'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
