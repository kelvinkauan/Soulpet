import 'package:app_tutor/app/shared/templates/template_interno.dart';
import 'package:flutter/material.dart';

import '../details_product/details_product_module.dart';

class ProductsPage extends StatefulWidget {
  final String title;
  const ProductsPage({Key key, this.title = "Produtos"}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}
TextEditingController searchController = TextEditingController();
class _ProductsPageState extends State<ProductsPage> {
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
                  // padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        new BoxShadow(color: Colors.black12, blurRadius: 10.0)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          child: Container(
                          padding: EdgeInsets.only(left: 10, top: 3, bottom: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Color.fromRGBO(243, 243, 243, 1)),
                          child:search(),
                    ),
                        ),
                      ),
                      Flexible(
                        flex: 8,
                        child: Scrollbar(
                          child: ListView(
                            children: <Widget>[
                              product('assets/images/cinto.png', 'Cinto de Segurança Chalesco para Cães', '34.90'),
                              product('assets/images/cinto.png', 'Cinto de Segurança Chalesco para Cães', '34.90'),
                              product('assets/images/cinto.png', 'Cinto de Segurança Chalesco para Cães', '34.90'),
                              product('assets/images/cinto.png', 'Cinto de Segurança Chalesco para Cães', '34.90'),
                              product('assets/images/cinto.png', 'Cinto de Segurança Chalesco para Cães', '34.90'),
                              product('assets/images/cinto.png', 'Cinto de Segurança Chalesco para Cães', '34.90'),
                              product('assets/images/cinto.png', 'Cinto de Segurança Chalesco para Cães', '34.90'),
                              product('assets/images/cinto.png', 'Cinto de Segurança Chalesco para Cães', '34.90'),
                              product('assets/images/cinto.png', 'Cinto de Segurança Chalesco para Cães', '34.90'),
                            ],
                          ),
                        ),
                      )
                      
                    ],
                  )
                ),
              ),
            ],
          );
        });
  }

  Widget product(_img, _name, _price){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => DetailsProductModule()
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Image.asset(_img, width: 80, height: 80,),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(_name, style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1), fontSize: 16, fontWeight: FontWeight.w600),),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 8,
                          child: Text('R\$ ' + _price, style: TextStyle(color: Color.fromRGBO(240, 185, 23, 1), fontSize: 17, fontWeight: FontWeight.w600),),
                        ),
                        Expanded(
                          flex: 2,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.shopping_cart, color: Color.fromRGBO(240, 185, 23, 1),),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Divider(color: Color.fromRGBO(151, 151, 151, 1),)
        ],
      ),
    );
  }

  Widget search(){
    return  TextFormField(
      controller: searchController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          border: InputBorder.none,
          hintText: 'Buscar',
          icon: Icon(
            Icons.search,
            color: Color.fromRGBO(90, 90, 90, 1),
          ),
          // contentPadding: const EdgeInsets.all(10.0),
          hintStyle: TextStyle(
              color: Color.fromRGBO(90, 90, 90, 1),
              fontSize: 17)),
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Color.fromRGBO(90, 90, 90, 1),
      ),

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

