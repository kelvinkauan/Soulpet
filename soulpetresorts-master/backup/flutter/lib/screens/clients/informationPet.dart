import 'package:flutter/material.dart';
import 'package:soulpet/screens/Clients/informationClient.dart';
import 'package:soulpet/screens/reports/reports.dart';
import 'package:soulpet/templateInterno.dart';
import 'package:flutter_svg/svg.dart';

class InformationPetScreen extends StatefulWidget {
  @override
  _InformationPetScreenState createState() => _InformationPetScreenState();
}

class _InformationPetScreenState extends State<InformationPetScreen> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: 'Informações do Pet',
        colorTitle: Color.fromRGBO(254, 193, 24, 1), 
        menuLateral: true,
        menubar: true,
        builder: () {
          return ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(40),
                  child: Wrap(
                    children: <Widget>[conteudo(context)],
                  )),
            ],
          );
        });
  }

  Widget conteudo(context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                      flex: 3,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color.fromRGBO(248, 196, 22, 1),
                                width: 5),
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/petAvatar.png'),
                                fit: BoxFit.contain)),
                      )),
                  Flexible(
                    flex: 7,
                    child: Text(''),
                  )
                ],
              )),
          SizedBox(
            width: 30,
          ),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Informações básicas',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(254, 193, 24, 1),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Wrap(
                        children: <Widget>[
                          linhaInfo('Nome:', 'Fred'),
                          linhaInfo('Tipo:', 'Cachorro'),
                          linhaInfo('Raça:', 'Beagle'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Wrap(
                        children: <Widget>[
                          linhaInfo('Sexo:', 'Masculino'),
                          linhaInfo('Porte:', 'Médio'),
                          linhaInfo('Tipo de pelo:', 'Curto'),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Alimentação',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(254, 193, 24, 1),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Wrap(
                        children: <Widget>[
                          linhaInfo('Marca da Ração:', 'Pedigree'),
                          linhaInfo('Vezes por dia:', '2'),
                          linhaInfo('Quantidade por vez:', '400g'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Wrap(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Observação:',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color.fromRGBO(141, 141, 141, 1)),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Não alimentar mais de 2x ao dia.',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(141, 141, 141, 1)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Observação médica',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(254, 193, 24, 1),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: CircleAvatar(
                            maxRadius: 22,
                            backgroundColor: Color.fromRGBO(186, 50, 44, 1),
                            child: SvgPicture.asset(
                              'assets/images/svg/first-aid-kit.svg',
                              color: Colors.white,
                              width: 23,
                              height: 23,
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Text(
                        'Medicar as 8h da manha, e a segunda dose as 16:00',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(141, 141, 141, 1)),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Tutor(a):',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(254, 193, 24, 1),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        'assets/images/avatar.png',
                        height: 70,
                        width: 70,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 20,),
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
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InformationClientScreen()));
                                },
                                child: Text(
                                  'Ver perfil',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(172, 172, 172, 1),
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Relatório de consumo:',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(254, 193, 24, 1),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Wrap(
                        children: <Widget>[
                          linhaRelatorio('Agosto:', '480,00'),
                          linhaRelatorio('Julho:', '300,00'),
                          linhaRelatorio('Junho:', '300,00'),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                            '+ Ver mais',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(194, 194, 194, 1),
                                decoration: TextDecoration.underline),
                          ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(''),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Pacote',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(254, 193, 24, 1),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset(
                        'assets/images/svg/pet-shop.svg',
                        color: Color.fromRGBO(254, 193, 24, 1),
                        width: 35,
                        height: 35,
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Wrap(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Banho 1x por semana, creche de segunda a sexta.',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(130, 130, 130, 1)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Wrap(
                                children: <Widget>[
                                  Text(
                                    'Valido até 12/10/2019',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromRGBO(130, 130, 130, 1)),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Renovar Pacote',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(254, 193, 24, 1),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget linhaInfo(_descricao, _informacao) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: <Widget>[
          Text(
            _descricao + ' ',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color.fromRGBO(141, 141, 141, 1)),
          ),
          Text(
            _informacao,
            style: TextStyle(
                fontSize: 16, color: Color.fromRGBO(141, 141, 141, 1)),
          )
        ],
      ),
    );
  }

  Widget linhaRelatorio(_mes, _valor) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Wrap(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Wrap(
                    children: <Widget>[
                      Text(
                        _mes + ' ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color.fromRGBO(141, 141, 141, 1)),
                      ),
                      Text(
                        'R\$ ' + _valor,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(141, 141, 141, 1)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ReportsScreen()
                      ));
                    },
                    child: Text(
                    'Ver detalhes',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(254, 193, 24, 1),
                        decoration: TextDecoration.underline),
                  ),
                  )
                )
              ],
            ),
            Divider(
              color: Color.fromRGBO(226, 226, 226, 1),
            )
          ],
        ));
  }
}
