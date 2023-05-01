import 'package:app_tutor/app/shared/templates/template_interno.dart';
import 'package:flutter/material.dart';

import '../cart/cart_module.dart';

class DetailsProductPage extends StatefulWidget {
  final String title;
  const DetailsProductPage({Key key, this.title = "Produtos"})
      : super(key: key);

  @override
  _DetailsProductPageState createState() => _DetailsProductPageState();
}

class _DetailsProductPageState extends State<DetailsProductPage> {
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
                flex: 7,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(left: 15, right: 15, top: 45),
                    // padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          new BoxShadow(color: Colors.black12, blurRadius: 10.0)
                        ]),
                    child: details(context, 'assets/images/cinto.png',
                        'Cinto de Segurança Chalesco para Cães', '34.90')),
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
                        button(
                          context,
                          'Adicionar ao Carrinho',
                          Colors.white,
                          Color.fromRGBO(239, 182, 0, 1),
                          CartModule(),
                        ),
                      ],
                    ),
                  )),
            ],
          );
        });
  }

  Widget details(context, _img, _name, _price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Flexible(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Image.asset(
              _img,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  _name,
                  style: TextStyle(
                      color: Color.fromRGBO(90, 90, 90, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'R\$ ' + _price,
                  style: TextStyle(
                      color: Color.fromRGBO(240, 185, 23, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Color.fromRGBO(151, 151, 151, 1),
        ),
        Flexible(
          flex: 1,
          child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Text(
                      'Quantidade',
                      style: TextStyle(
                          color: Color.fromRGBO(90, 90, 90, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Wrap(
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
                                top: BorderSide(width: 0.5, color: Colors.grey),
                                bottom:
                                    BorderSide(width: 0.5, color: Colors.grey),
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
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
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
