import 'package:app_tutor/app/shared/templates/template_interno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServicesExecutedPage extends StatefulWidget {
  final String title;
  const ServicesExecutedPage({Key key, this.title = "Serviços Executados"})
      : super(key: key);

  @override
  _ServicesExecutedPageState createState() => _ServicesExecutedPageState();
}
TextEditingController reclamacaoController = TextEditingController();
class _ServicesExecutedPageState extends State<ServicesExecutedPage> {
  final _formKey = GlobalKey<FormState>();

  bool success;

  int selectedRadio = 0;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: widget.title,
      //  home: true,
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
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          new BoxShadow(color: Colors.black12, blurRadius: 10.0)
                        ]),
                    child: ListView(
                      children: <Widget>[
                        serviceExecuted(context, 'Banho e Tosa', 'Serviço Agendado', 'assets/images/svg/alert.svg', Color.fromRGBO(235, 185, 0, 1), false),
                        serviceExecuted(context, 'Banho', 'Serviço não realizado', 'assets/images/svg/close.svg', Color.fromRGBO(214, 35, 35, 1), false),
                        serviceExecuted(context, 'Banho e Tosa', 'Data 20/09/2019', 'assets/images/svg/success.svg', Color.fromRGBO(137, 196, 85, 1), true),
                        serviceExecuted(context, 'Banho e Tosa', 'Data 20/08/2019', 'assets/images/svg/success.svg', Color.fromRGBO(137, 196, 85, 1), true),
                        serviceExecuted(context, 'Banho', 'Data 20/07/2019', 'assets/images/svg/success.svg', Color.fromRGBO(137, 196, 85, 1), true),
                      ],
                    )
                  ),
              ),
              
            ],
          );
        });
  }

  Widget serviceExecuted(context, _service, _type, _icon, _colorIcon, _avaliation){
    success = _avaliation;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          // builder: (context) => InvoiceModule()
        ));
      },
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(_service),
            subtitle: success ? Row(
              children: <Widget>[
                Text(_type),
                Text(' - '),
                Text('ÓTIMO', style: TextStyle(color: Color.fromRGBO(137, 196, 85, 1), fontWeight: FontWeight.w600)),
              ],
            ) : Text(_type),
            trailing: SvgPicture.asset(_icon, width: 40, color: _colorIcon,),
            onTap: (){
              alertTeste(context);
            },
          ),
          Divider(color: Color.fromRGBO(216, 216, 216, 1),)
        ],
      ),
    );
  }

  void alertAvaliation(context) {
    var alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: 400,
        width: 450,
        padding: EdgeInsets.all(20),
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Avaliação do Serviço',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(68, 68, 68, 1),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20,),
            Form(
              key: _formKey,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 1.0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(210, 210, 210, 1), width: 1.0),
                      borderRadius: BorderRadius.circular(8)),
                  hintText: 'Reclamação',
                  contentPadding: const EdgeInsets.all(14.0),
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(137, 137, 137, 1),
                    //fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                controller: reclamacaoController,
                style: TextStyle(
                  color: Color.fromRGBO(162, 170, 171, 1),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('Cancelar'),
        ),
        FlatButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('Avaliar', style: TextStyle(color: Color.fromRGBO(247, 167, 30, 1)),),
        )
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void alertTeste(context) {
    var alertDialog = CupertinoAlertDialog(
      title: Text(
              'Avaliação do Serviço',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(68, 68, 68, 1),
                  fontWeight: FontWeight.w600),
            ),
      content: Material(
        child: Column(
          children: <Widget>[
            Divider(color: Color.fromRGBO(216, 216, 216, 1),),
            radio('Ótimo', 0),
            radio('Bom', 1),
            radio('Regular', 2),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 1.0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(210, 210, 210, 1), width: 1.0),
                      borderRadius: BorderRadius.circular(8)),
                  hintText: 'Reclamação',
                  contentPadding: const EdgeInsets.all(14.0),
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(137, 137, 137, 1),
                    //fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                controller: reclamacaoController,
                maxLines: 5,
                style: TextStyle(
                  color: Color.fromRGBO(162, 170, 171, 1),
                ),
              ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('Cancelar'),
        ),
        FlatButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('Avaliar', style: TextStyle(color: Color.fromRGBO(247, 167, 30, 1)),),
        )
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

   Widget radio(_content, _valueRadio) {
    return Theme(
      data: ThemeData.light(),
      child: RadioListTile(
        value: _valueRadio,
        groupValue: selectedRadio,
        onChanged: (val) {
          setState(() {
            print('Radio $val');
            setSelectedRadio(val);
          });
        },
        activeColor: Color.fromRGBO(255, 176, 42, 1),
        title: Text(
          _content,
          style: TextStyle(
              color: Color.fromRGBO(89, 89, 89, 1),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}
