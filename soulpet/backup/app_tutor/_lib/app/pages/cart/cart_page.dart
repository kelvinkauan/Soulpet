import 'package:app_tutor/app/shared/templates/template_interno.dart';
import 'package:flutter/material.dart';

import '../products/products_module.dart';
import 'cart_success_page.dart';

class CartPage extends StatefulWidget {
  final String title;
  const CartPage({Key key, this.title = "Carrinho"}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _count = 0;
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
                flex: 6,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.only(left: 15, right: 15, top: 45),
                  padding: EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        new BoxShadow(color: Colors.black12, blurRadius: 10.0)
                      ]),
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        flex: 7,
                        child: Scrollbar(
                          child: ListView(
                            children: <Widget>[
                              product(
                                  'assets/images/cinto.png',
                                  'Cinto de Segurança Chalesco para Cães',
                                  '34.90'),
                              product('assets/images/guia.png',
                                  'Guia Retrátil até 15kg - Azul', '29.90'),
                            ],
                          ),
                        ),
                      ),
                      Flexible(flex: 3, child: resume())
                    ],
                  ),
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 35, left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        botaoOutline(
                          context,
                          'CONTINUAR COMPRANDO',
                          Color.fromRGBO(255, 189, 0, 1),
                          Color.fromRGBO(255, 189, 0, 1),
                          ProductsModule(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        button(
                          context,
                          'Fechar carrinho',
                          Colors.white,
                          Color.fromRGBO(239, 182, 0, 1),
                          CartSuccessPage(),
                        ),
                      ],
                    ),
                  )),
            ],
          );
        });
  }

  Widget product(_img, _name, _price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                // builder: (context) => DetailsProductModule()
                ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Image.asset(
                  _img,
                  width: 80,
                  height: 80,
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      _name,
                      style: TextStyle(
                          color: Color.fromRGBO(90, 90, 90, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Text(
                            'R\$ ' + _price,
                            style: TextStyle(
                                color: Color.fromRGBO(240, 185, 23, 1),
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                            flex: 5,
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (_count == 0) {
                                        _count = 0;
                                      } else {
                                        _count--;
                                      }
                                    });
                                  },
                                  child: Container(
                                    color: Color.fromRGBO(239, 182, 0, 1),
                                    width: 25,
                                    height: 25,
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          width: 0.5, color: Colors.grey),
                                      bottom: BorderSide(
                                          width: 0.5, color: Colors.grey),
                                    ),
                                  ),
                                  width: 25,
                                  height: 25,
                                  child: Center(child: Text(_count.toString())),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _count++;
                                    });
                                  },
                                  child: Container(
                                    color: Color.fromRGBO(239, 182, 0, 1),
                                    width: 25,
                                    height: 25,
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.close,
                                    color: Color.fromRGBO(173, 173, 173, 1),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Divider(
            color: Color.fromRGBO(216, 216, 216, 1),
          )
        ],
      ),
    );
  }

  Widget resume() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Divider(
          color: Color.fromRGBO(216, 216, 216, 1),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 15),
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
