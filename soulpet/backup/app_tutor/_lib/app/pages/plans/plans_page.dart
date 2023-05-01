import 'package:app_tutor/app/shared/templates/template_interno.dart';
import 'package:flutter/material.dart';

import '../payment/payment_module.dart';

class PlansPage extends StatefulWidget {
  final String title;
  const PlansPage({Key key, this.title = "Plans"}) : super(key: key);

  @override
  _PlansPageState createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  @override
  Widget build(BuildContext context) {
     return TemplateInterno(
        title: widget.title,
     //   home: true,
        builder: () {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Flexible(
              //   flex: 2,
              //   child: Text(''),
              // ),
              Flexible(
                flex: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.only(left: 15, right: 15, top: 40),
                  padding: EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        new BoxShadow(color: Colors.black12, blurRadius: 10.0)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      plan(context, 'Gratuíto', 'Utilize durante 30 dias cadastrando até 1 area de atuação.', '0', 'Válido por 30 dias.'),
                      plan(context, 'Básico', 'Este plano te dá a possibilidade oferecer seus serviços em até 3 áreas de atuação distintas.', '49,90', 'Por mês.'),
                      plan(context, 'Avançado', 'Com este plano além de cadastrar 5 áreas distintas de atuação, você ainda pode inserir fotos (até 20) dos serviços já prestados, promovendo ainda mais seu perfil.', '89,90', 'Por mês')
                    ],
                  )
                ),
              ),
              
            ],
          );
        });
  }

  Widget plan(context, _type, _descryption, _price, _typePrice){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => PaymentModule()
        ));
      },
      child: Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color.fromRGBO(216, 216, 216, 1))
              )
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                  _type,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(61, 68, 69, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 22
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  _descryption,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(61, 68, 69, 1),
                    fontSize: 12
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  'R\$ ' + _price,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 176, 42, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 26
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  _typePrice,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(61, 68, 69, 1),
                    fontSize: 12
                  ),
                ),
                ],
              ),
            ),
          ),
    );
  }
}
