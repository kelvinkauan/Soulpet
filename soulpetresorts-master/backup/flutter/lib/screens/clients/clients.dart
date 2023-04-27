import 'package:flutter/material.dart';
import 'package:soulpet/screens/Clients/informationPet.dart';
import 'package:soulpet/screens/register/registerClient.dart';
import 'package:soulpet/screens/services/services.dart';
import 'package:soulpet/templateInterno.dart';

class ClientsScreen extends StatefulWidget {
  @override
  _ClientsScreenState createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: '',
        menuLateral: true,
        menubar: false,
        menuSearch: true,
        linkButton: RegisterClientScreen(),
        contentButton: 'Cadastrar Cliente',
        builder: () {
          return ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 46),
                  child: Wrap(
                    children: <Widget>[
                      conteudo(context),
                      conteudo(context),
                      conteudo(context)
                    ],
                  )),
            ],
          );
        });
  }

  Widget conteudo(context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return Row(
        children: <Widget>[
          petcard('assets/images/petAvatar.png', 'Fred', 'Jessica dos Santos'),
          petcard('assets/images/petAvatar2.png', 'Scott e Toddy',
              'Jefferson Silva'),
          petcard('assets/images/petAvatar3.png', 'Bolota', 'Rafaela Pereira'),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          petcard('assets/images/petAvatar.png', 'Fred', 'Jessica dos Santos'),
          petcard('assets/images/petAvatar2.png', 'Scott e Toddy',
              'Jefferson Silva'),
          petcard('assets/images/petAvatar3.png', 'Bolota', 'Rafaela Pereira'),
          petcard('assets/images/petAvatar4.png', 'Toddy', 'Carla Ribeiro'),
        ],
      );
    }
  }

  Widget petcard(_img, _nomePet, _nomeCliente) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ServicesScreen()));
      },
      child: Container(
        margin: EdgeInsets.only(right: 30, bottom: 40),
        alignment: Alignment.bottomRight,
        child: Stack(
          children: <Widget>[
            Container(
                width: 210,
                height: 180,
                margin: EdgeInsets.only(top: 80),
                padding: EdgeInsets.only(top: 85),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(254, 193, 24, 1),
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      _nomePet,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _nomeCliente,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                )),
            Container(
              width: 140,
              height: 140,
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(left: 35),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(_img), fit: BoxFit.cover),
                  border: Border.all(
                      color: Color.fromRGBO(248, 196, 22, 1), width: 5),
                  borderRadius: BorderRadius.circular(70)),
            ),
          ],
        ),
      ),
    );
  }
}
