import 'package:kando/app/pages/monthly_payment/monthly_payment_module.dart';
import 'package:kando/app/shared/templates/template_interno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InvoicePage extends StatefulWidget {
  final String title;
  const InvoicePage({Key key, this.title = "Novembro 2019"}) : super(key: key);

  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  bool pago = false;
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: widget.title,
        //home: false,
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
                flex: pago ? 3 : 7,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(left: 15, right: 15, top: 40),
                    padding: EdgeInsets.symmetric(vertical: 50),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          new BoxShadow(color: Colors.black12, blurRadius: 10.0)
                        ]),
                    child: pago ? paga(context) : atrasada(context)),
              ),
              Flexible(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 35, left: 20, right: 20),
                    child: pago ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        button(context, 'VOLTAR', Colors.white,
                            Color.fromRGBO(239, 182, 0, 1), MonthlyPaymentModule()),
                      ]
                    )
                    :Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        button(context, 'COPIAR CÓDIGO', Colors.white,
                            Color.fromRGBO(239, 182, 0, 1), 'CartModule()'),
                        SizedBox(
                          height: 10,
                        ),
                        button(context, 'VER BOLETO', Colors.white,
                            Color.fromRGBO(239, 182, 0, 1), 'CartModule()'),
                      ],
                    ),
                  )),
            ],
          );
        });
  }

  Widget paga(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SvgPicture.asset('assets/images/svg/success.svg', color: Color.fromRGBO(5, 180, 70, 1), height: 110,),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'R\$ 149,90',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'PAGA',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(5, 180, 70, 1)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
          child: Text(
            'Vencimento em 20/11/2019',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Text(
            'Paga em 18/11/2019',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(95, 196, 60, 1)
            ),
          ),
      ],
    );
  }

  Widget fechada(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SvgPicture.asset('assets/images/svg/loupe-add.svg', color: Color.fromRGBO(247, 167, 30, 1), height: 110,),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'R\$ 149,90',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'FECHADA',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(247, 167, 30, 1)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 40),
          child: Text(
            'Vencimento em 20/11/2019',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Divider(color: Color.fromRGBO(216, 216, 216, 1),),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, bottom: 20),
          child: Text(
            'Código de barras para pagamento',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            '123456789012 0 555444332221 6 568754456745 4 555444332221',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(183, 183, 183, 1)
            ),
          ),
        ),
      ],
    );
  }

  Widget atrasada(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SvgPicture.asset('assets/images/svg/alert.svg', color: Color.fromRGBO(214, 35, 35, 1), height: 110,),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'R\$ 149,90',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'ATRASADA',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(214, 35, 35, 1)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 40),
          child: Text(
            'Vencimento em 20/11/2019',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Divider(color: Color.fromRGBO(216, 216, 216, 1),),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, bottom: 20),
          child: Text(
            'Código de barras para pagamento',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            '123456789012 0 555444332221 6 568754456745 4 555444332221',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(183, 183, 183, 1)
            ),
          ),
        ),
      ],
    );
  }

  Widget button(context, _text, _colorText, _colorBg, _action) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => _action));
      },
      padding: EdgeInsets.only(top: 13, bottom: 13, left: 25, right: 25),
      splashColor: _colorText,
      color: _colorBg,
      shape: StadiumBorder(),
      child: Text(
        _text,
        textAlign: TextAlign.center,
        style: TextStyle(color: _colorText, fontSize: 16),
      ),
    );
  }
}
