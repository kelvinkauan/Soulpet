import 'package:kando/app/pages/pets/pages/register_pet/register_pet_bloc.dart';
import 'package:kando/app/pages/pets/pages/register_pet/register_pet_module.dart';
import 'package:kando/app/shared/helpers/alert_helper.dart';
import 'package:kando/app/shared/helpers/utils_helper.dart';
import 'package:kando/app/shared/models/enums.dart';
import 'package:kando/app/shared/models/model.dart';
import 'package:kando/app/shared/templates/template_drawer.dart';
import 'package:kando/app/shared/utils/constants.dart';
import 'package:kando/app/shared/utils/form_controller.dart';
import 'package:kando/app/shared/widgets/button_widget.dart';
import 'package:kando/app/shared/widgets/dropdown_widget.dart';
import 'package:kando/app/shared/widgets/helpers.dart';
import 'package:kando/app/shared/widgets/input_widget.dart';
import 'package:kando/app/shared/widgets/radio_with_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class RegisterPetPage extends StatefulWidget {
  @override
  _RegisterPetPageState createState() => _RegisterPetPageState();
}

class _RegisterPetPageState extends State<RegisterPetPage> {
  final RegisterPetBloc bloc = RegisterPetModule.to.getBloc<RegisterPetBloc>();
  final MaskedTextController dateController = MaskedTextController(mask: '00/00/0000');

  Size get size => MediaQuery.of(context).size;
  FormController form;

  @override
  void initState() {
    super.initState();
    form = FormController(context);
    _init();
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  void _init() async {
    String retorno = await bloc.getData();
    if (retorno != null) {
      UtilsHelper.showToast(form.scaffoldKey, text: retorno);
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
            topBody: 70,
            showHeader: false,
            isScroll: true,
            loading: snapshot.data.loading,
            scaffoldKey: form.scaffoldKey,
            title: Text('Cadastrar'),
            body: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
              ),
              child: Form(
                key: form.key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: InkWell(
                        onTap: () => AlertHelper.showCamera(
                          context,
                          onTap: (PhotoMode mode) {
                            Navigator.pop(context);
                            bloc.getPhotoPet(context, mode: mode);
                          },
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey,
                          backgroundImage: (bloc.pet.avatar == null)?
                          AssetImage(PET_IMAGE_DEFAULT) : FileImage(bloc.object.avatar),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Dados do Pet',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    InputWidget(
                      hint: 'Nome',
                      initialValue: bloc.pet.name,
                      isValidate: true,
                      onSaved: (value) {
                        bloc.pet.name = value;
                        bloc.modelIn.add(bloc.model);
                      },
                    ),

                    // NOTE dropdraw raça
                    DropdownWidget(
                      hint: 'Raça',
                      items: bloc.object.raca,
                      value: bloc.pet.breed,
                      onChanged: (value) {
                        bloc.pet.breed = value;
                        bloc.modelIn.add(bloc.model);
                      },
                    ),

                    // NOTE dropdraw porte
                    DropdownWidget(
                      hint: 'Porte',
                      items: bloc.object.porte,
                      value: bloc.pet.size,
                      onChanged: (value) {
                        bloc.pet.size = value;
                        bloc.modelIn.add(bloc.model);
                      },
                    ),

                    InputWidget(
                      hint: 'Data de Nascimento',
                      controller: dateController,
                      keyboardType: TextInputType.datetime,
                      isValidate: true,
                      onSaved: (value) {
                        bloc.pet.dateBirth = value;
                        bloc.modelIn.add(bloc.model);
                      },
                    ),

                    // NOTE dropdraw tipo
                    DropdownWidget(
                      hint: 'Tipo',
                      items: bloc.object.tipo,
                      value: bloc.pet.type,
                      onChanged: (value) {
                        bloc.pet.type = value;
                        bloc.modelIn.add(bloc.model);
                      },
                    ),

                    // NOTE dropdraw
                    DropdownWidget(
                      hint: 'Sexo',
                      items: bloc.object.sexo,
                      value: bloc.pet.gender,
                      onChanged: (value) {
                        bloc.pet.gender = value;
                        bloc.modelIn.add(bloc.model);
                      },
                    ),

                    // NOTE dropdraw
                    DropdownWidget(
                      hint: 'Tipo do Pelo',
                      items: bloc.object.tipoPelo,
                      value: bloc.pet.typeFur,
                      onChanged: (value) {
                        bloc.pet.typeFur = value;
                        bloc.modelIn.add(bloc.model);
                      },
                    ),

                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Castrado?',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 10),
                          RadioWithLabelWidget(
                            groupValue: (bloc.pet.castrated == 1),
                            value: true,
                            label: 'Sim',
                            onTap: (value) {
                              bloc.pet.castrated = 1;
                              bloc.modelIn.add(bloc.model);
                            },
                          ),
                          SizedBox(width: 10),
                          RadioWithLabelWidget(
                            groupValue: (bloc.pet.castrated == 1),
                            value: false,
                            label: 'Não',
                            onTap: (value) {
                              bloc.pet.castrated = 0;
                              bloc.modelIn.add(bloc.model);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            bottom: ButtonWidget(
              'CADASTRAR',
              onPressed: () async {
                if (form.validate(validator: bloc.validate)) {
                  
                  String value = await bloc.registerPet();
                  Helpers.showSnackBar(
                    scaffodKey: form.scaffoldKey,
                    value: value,
                    valueSuccess: '1',
                    onSuccess: () {
                      Navigator.pop(context, true);
                    },
                  );

                  
                }
              },
            ),
          );
        });
  }
}
