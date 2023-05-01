import 'package:flutter/material.dart';
import 'package:soulpet/screens/register/registerClient.dart';
import 'package:soulpet/templateInterno.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/svg.dart';

class InformationClientScreen extends StatefulWidget {
  @override
  _InformationClientScreenState createState() => _InformationClientScreenState();
}

class _InformationClientScreenState extends State<InformationClientScreen> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
      title: 'Informações do Cliente',
      colorTitle: Color.fromRGBO(254, 193, 24, 1),
      menuLateral: true,
      menubar: true,
      builder: (){
        return ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Wrap(
                children: <Widget>[
                  conteudo(context)
                ],
              )
            ),
            
          ],
        );
      }
    );
  }

  Widget conteudo(context){
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.asset('assets/images/avatar.png', height: 80, width: 80, fit: BoxFit.contain,),
              ),
              Expanded(
                flex: 9,
                child: Wrap(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Amanda Ramos',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(141, 141, 141, 1),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                               builder: (context) => RegisterClientScreen()
                            ));
                          },
                          child: Text(
                            'Editar',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(172, 172, 172, 1),
                              decoration: TextDecoration.underline
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              offset: new Offset(0.50, 0.50),
              blurRadius: 10.0
            )
          ],
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(children: <Widget>[
                  Text(
                    'Dados do Cliente',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(254, 193, 24, 1),
                      fontWeight: FontWeight.w600
                    ),
                  )
                ],),
                ),
                Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Wrap(
                    children: <Widget>[
                      linhaInfo('Nome:', 'Jéssica dos Santos'),
                      linhaInfo('Data Nascimento:', '15/04/1990'),
                      linhaInfo('Telefone:', '(45)9 9800-5500'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Wrap(
                    children: <Widget>[
                      linhaInfo('CPF:', '962.498.590-12'),
                      linhaInfo('RG:', '26.906.974-4'),
                      linhaInfo('Email:', 'jessicasantos@gmail.com'),
                    ],
                  ),
                )
              ],
            ),
            Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 5),
                  child: Row(children: <Widget>[
                  Text(
                    'Dados de Endereço',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(254, 193, 24, 1),
                      fontWeight: FontWeight.w600
                    ),
                  )
                ],),
                ),
                Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Wrap(
                    children: <Widget>[
                      linhaInfo('Rua:', 'Rua Carlos Cavalvanti, 775'),
                      linhaInfo('Bairro:', 'São José'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Wrap(
                    children: <Widget>[
                      linhaInfo('Cidade:', 'Cascavel'),
                      linhaInfo('Estado:', 'PR'),
                    ],
                  ),
                )
              ],
            ),
              ],
            )
          ),
          Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 40, left: 30),
                  child: Row(children: <Widget>[
                  Text(
                    'Pets',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(254, 193, 24, 1),
                      fontWeight: FontWeight.w600
                    ),
                  )
                ],),
          ),
        Row(
                children: <Widget>[
                  petcard('assets/images/petAvatar.png', 'Fred'),
                  SizedBox(width: 25,),
                  addPet()
                ],
              ),
      ],
    );
  }
  Widget petcard(_img, _nome){
    return Container(
      width: 160,
      alignment: Alignment.bottomRight,
      child: Stack(
        children: <Widget>[
          Container(
            width: 150,
            height: 90,
            margin: EdgeInsets.only(top: 90),
            padding: EdgeInsets.only(top: 45),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(254, 193, 24, 1),
            ),
            child: Text(
              _nome,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ),
          Container(
            width: 130,
            height: 130,
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_img),
                fit: BoxFit.cover
              ),
              border: Border.all(color: Color.fromRGBO(248, 196, 22, 1), width: 5),
            borderRadius: BorderRadius.circular(75) 
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 150),
            child: CircleAvatar(
              maxRadius: 22,
              backgroundColor: Color.fromRGBO(186, 50, 44, 1),
              child: SvgPicture.asset('assets/images/svg/first-aid-kit.svg', color: Colors.white, width: 23, height: 23,)
            ),
          )
        ],
      ),
    );

  }

  Widget linhaInfo(_descricao, _informacao){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
      children: <Widget>[
        Text(
          _descricao + ' ',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color.fromRGBO(141, 141, 141, 1)
          ),
        ),
        Text(
          _informacao,
          style: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(141, 141, 141, 1)
          ),
        )
      ],
    ),
    );
  }

 Widget addPet(){
   return DottedBorder(
                      dashPattern: [6, 4],
                      color: Color.fromRGBO(152, 152, 152, 1),
                      strokeWidth: 1,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push( 
                            context, 
                            MaterialPageRoute(
                              builder: (context) => RegisterClientScreen()
                            )
                          );
                        },
                        child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                        width: 140,
                        height: 160,
                        child: Wrap(
                          children: <Widget>[
                            Center(
                              child: Image.asset('assets/images/pet.png', height: 80, width: 80, fit: BoxFit.contain,),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                              'Adicionar pet',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(152, 152, 152, 1),
                                fontWeight: FontWeight.w500
                              ),
                            ),
                              )
                            )
                          ],
                        )
                      ),
                      ),
                      )
                    );
 }
  
}