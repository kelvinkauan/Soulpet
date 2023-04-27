import 'package:app_tutor/app/pages/pets/pets_bloc.dart';
import 'package:app_tutor/app/pages/pets/pets_module.dart';
import 'package:app_tutor/app/pages/pets/tiles/pet_tile.dart';
import 'package:app_tutor/app/shared/helpers/utils_helper.dart';
import 'package:app_tutor/app/shared/models/model.dart';
import 'package:app_tutor/app/shared/templates/template_drawer.dart';
import 'package:flutter/material.dart';

import 'tiles/add_pet_tile.dart';

class PetsPage extends StatefulWidget {
  @override
  _PetsPageState createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  final PetsBloc bloc = PetsModule.to.getBloc<PetsBloc>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Size get size => MediaQuery.of(context).size;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    String retorno = await bloc.getData();
    if (retorno != null) {
       UtilsHelper.showToast(scaffoldKey, text: retorno);
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
          showHeader: false,
          loading: snapshot.data.loading,
          scaffoldKey: scaffoldKey,
          title: Text('Pets'),
          body: Container(
            child: GridView.builder(
              itemCount: (bloc.object.length + 1),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, i) => (bloc.object.length != i)
                  ? PetTile(bloc.object[i])
                  : AddPetTile(_init),
            ),
          ),
        );
      },
    );
  }
}
