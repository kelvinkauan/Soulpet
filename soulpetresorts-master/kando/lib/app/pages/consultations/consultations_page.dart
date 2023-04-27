import 'package:kando/app/pages/information_consultation/information_consultation_module.dart';
import 'package:kando/app/shared/templates/template_interno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConsultationsPage extends StatefulWidget {
  final String title;
  const ConsultationsPage({Key key, this.title = "Consultas"})
      : super(key: key);

  @override
  _ConsultationsPageState createState() => _ConsultationsPageState();
}

class _ConsultationsPageState extends State<ConsultationsPage> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: widget.title,
       // home: true,
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
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          new BoxShadow(color: Colors.black12, blurRadius: 10.0)
                        ]),
                    child: ListView(
                      children: <Widget>[
                        consultation(context, 'Fred', '10/11/2019'),
                        consultation(context, 'Belinha', '22/10/2019'),
                      ],
                    )
                  ),
              ),
              
            ],
          );
        });
  }

  Widget consultation(context, _pet, _date){
    return Column(
        children: <Widget>[
          ListTile(
            title: Text(_pet),
            subtitle: Text('Dia ' + _date),
            trailing: SvgPicture.asset('assets/images/svg/Mask.svg', width: 40, color: Color.fromRGBO(247, 167, 30, 1),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => InformationConsultationModule()
              ));
            },
          ),
          Divider(color: Color.fromRGBO(216, 216, 216, 1),)
        ],
      );
  }
}
