import 'package:app_tutor/app/shared/templates/template_interno.dart';
import 'package:flutter/material.dart';

import 'payment_success_page.dart';

class PaymentPage extends StatefulWidget {
  final String title;
  const PaymentPage({Key key, this.title = "Pagamento"}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

TextEditingController couponController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController numberController = TextEditingController();
TextEditingController codController = TextEditingController();

class _PaymentPageState extends State<PaymentPage> {
  String dropdownMes = 'Mês';
  String dropdownAno = 'Mês';
  final _formKey = GlobalKey<FormState>();
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
                flex: 9,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(left: 15, right: 15, top: 45),
                    padding: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          new BoxShadow(color: Colors.black12, blurRadius: 10.0)
                        ]),
                    child: payment(context)),
              ),
              Flexible(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 23, left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        button(
                          context,
                          'Confirmar compra',
                          Colors.white,
                          Color.fromRGBO(239, 182, 0, 1),
                          PaymentSuccessPage(),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        botaoOutline(
                            context,
                            'CANCELAR',
                            Color.fromRGBO(255, 189, 0, 1),
                            Color.fromRGBO(235, 185, 0, 1),
                            'ProductsModule()'),
                      ],
                    ),
                  )),
            ],
          );
        });
  }

  Widget plan(_plan, _price, _typePrice) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(216, 216, 216, 1)))),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(left: 30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  border: Border(
                      right:
                          BorderSide(color: Color.fromRGBO(216, 216, 216, 1)))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'PLANO ESCOLHIDO',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 176, 42, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    _plan,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(61, 68, 69, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(left: 30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'R\$ ' + _price,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 176, 42, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    _typePrice,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(61, 68, 69, 1), fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget payment(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        plan('Avançado', '89,90', 'Por mês.'),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Cupom de Desconto',
                  style: TextStyle(
                      color: Color.fromRGBO(90, 90, 90, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
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
                            color: Color.fromRGBO(224, 226, 228, 1),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(8)),
                    hintText: 'Digite seu cupom',
                    contentPadding: const EdgeInsets.all(14.0),
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(137, 137, 137, 1),
                      //fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  controller: couponController,
                  style: TextStyle(
                    color: Color.fromRGBO(162, 170, 171, 1),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Cartão de crédito',
                  style: TextStyle(
                      color: Color.fromRGBO(90, 90, 90, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/images/card-mastercard.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset('assets/images/card-visa.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset('assets/images/card-hipercard.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset('assets/images/card-american.png'),
                    ],
                  ),
                ),
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
                            color: Color.fromRGBO(224, 226, 228, 1),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(8)),
                    hintText: 'Nome impresso no cartão',
                    contentPadding: const EdgeInsets.all(14.0),
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(137, 137, 137, 1),
                      //fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  controller: couponController,
                  style: TextStyle(
                    color: Color.fromRGBO(162, 170, 171, 1),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
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
                            color: Color.fromRGBO(224, 226, 228, 1),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(8)),
                    hintText: 'Número do cartão',
                    contentPadding: const EdgeInsets.all(14.0),
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(137, 137, 137, 1),
                      //fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  controller: couponController,
                  style: TextStyle(
                    color: Color.fromRGBO(162, 170, 171, 1),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 45,
                        // margin: EdgeInsets.only(top: 12),
                        padding: EdgeInsets.only(
                            top: 0, bottom: 0, left: 20, right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(224, 226, 228, 1),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: Colors.white,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: dropdownMes,
                              icon: Icon(
                                Icons.expand_more,
                                color: Color.fromRGBO(255, 189, 0, 1),
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(
                                  color: Color.fromRGBO(137, 137, 137, 1),
                                  fontSize: 14),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownMes = newValue;
                                });
                              },
                              items: <String>[
                                'Mês',
                                'Janeiro',
                                'Fevereiro',
                                'Março'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 45,
                        // margin: EdgeInsets.only(top: 12),
                        padding: EdgeInsets.only(
                            top: 0, bottom: 0, left: 20, right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(224, 226, 228, 1),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: Colors.white,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: dropdownMes,
                              icon: Icon(
                                Icons.expand_more,
                                color: Color.fromRGBO(255, 189, 0, 1),
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(
                                  color: Color.fromRGBO(137, 137, 137, 1),
                                  fontSize: 14),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownMes = newValue;
                                });
                              },
                              items: <String>[
                                'Mês',
                                'Janeiro',
                                'Fevereiro',
                                'Março'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
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
                            color: Color.fromRGBO(224, 226, 228, 1),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(8)),
                    hintText: 'Código de segurança',
                    contentPadding: const EdgeInsets.all(10.0),
                    suffixIcon: Image.asset('assets/images/icon-cvv.png'),
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(137, 137, 137, 1),
                      //fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  controller: couponController,
                  style: TextStyle(
                    color: Color.fromRGBO(162, 170, 171, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
        resume()
      ],
    );
  }

  Widget resume() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
          child: Text(
            'Resumo:',
            style: TextStyle(
                color: Color.fromRGBO(90, 90, 90, 1),
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Text(
                  'Subtotal:',
                  style: TextStyle(
                      color: Color.fromRGBO(173, 179, 181, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'R\$ 89,90',
                    style: TextStyle(
                        color: Color.fromRGBO(173, 179, 181, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Text(
                  'Desconto:',
                  style: TextStyle(
                      color: Color.fromRGBO(173, 179, 181, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'R\$ 9,90',
                    style: TextStyle(
                        color: Color.fromRGBO(173, 179, 181, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Text(
                  'Total a pagar:',
                  style: TextStyle(
                      color: Color.fromRGBO(90, 90, 90, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'R\$ 80,00',
                    style: TextStyle(
                        color: Color.fromRGBO(90, 90, 90, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        )
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

  Widget botaoOutline(context, _text, _colorText, _colorBg, _action) {
    return OutlineButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _action,
          ),
        );
      },
      padding: EdgeInsets.only(top: 13, bottom: 13),
      splashColor: _colorText,
      borderSide: BorderSide(color: _colorBg),
      shape: StadiumBorder(),
      child: Text(
        _text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: _colorText,
          fontSize: 15,
        ),
      ),
    );
  }
}
