import 'package:flutter/material.dart';
import 'package:soulpet/screens/employees/registerEmployee.dart';
import 'package:soulpet/screens/products/registerProduct.dart';
import 'package:soulpet/templateInterno.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: '',
        menuLateral: true,
        menubar: false,
        menuSearch: true,
        linkButton: RegisterProductScreen(),
        contentButton: 'Cadastrar Produto',
        builder: () {
          return ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 46),
                  child: Wrap(
                    children: <Widget>[
                      conteudo(context),
                    ],
                  )),
            ],
          );
        });
  }

  Widget conteudo(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 35),
            decoration: BoxDecoration(
              color: Color.fromRGBO(254, 193, 24, 1),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              boxShadow: [
                new BoxShadow(
                    color: Colors.black12,
                    offset: new Offset(0.50, 0.50),
                    blurRadius: 10.0)
              ],
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text('Foto', style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
                Expanded(
                  flex: 3,
                  child: Text('Nome', style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Categoria', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Valor', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Estoque', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Opções', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
                )
              ],
            )
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 650,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              boxShadow: [
                new BoxShadow(
                    color: Colors.black12,
                    offset: new Offset(0.50, 0.50),
                    blurRadius: 10.0)
              ],
            ),
            child: ListView(
              children: <Widget>[
                linhaProduto('assets/images/cinto.png', 'Cinto de Segurança Chalesco para Cães', 'Cinta', '34,90', '10'),
                linhaProduto('assets/images/guia.png', 'Guia Retrátil até 15 kg - Azul', 'Cinta', '29,90', '8'),
                linhaProduto('assets/images/guia2.png', 'Guia Retrátil até 15 kg - Vermelho', 'Cinta', '29,90', '16'),
                linhaProduto('assets/images/guia3.png', 'Guia e Peitoral barcelona - Azul', 'Cinta', '78,90', '4'),
                linhaProduto('assets/images/petisco.png', 'Pestisco Nestlé Purina Dog Chow Carinhos Mix de Frutas para Cães', 'Cinta', '5,94', '22'),
                linhaProduto('assets/images/bifinho.png', 'Bifinho Kelco Keldog Criasdores carne e Cereais Raças Pequenas', 'Cinta', '17,90', '18'),
              ],
            )
          ),
      ],
    );
  }

  Widget linhaProduto(_foto, _nome, _categoria, _valor, _estoque){
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset(_foto, fit: BoxFit.contain, width: 50, height: 50,)
                ),
                Expanded(
                  flex: 3,
                  child: Text(_nome, style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1), fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text(_categoria, textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1), fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('R\$ ' + _valor, textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1), fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text(_estoque + ' un.', textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1), fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Wrap(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.delete_outline, color: Colors.red,),
                        onPressed: (){},
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.green,),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterEmployeeScreen()));
                        },
                      )
                    ],
                  ),
                  )
                )
              ],
            ),
        ),
            Divider(color: Color.fromRGBO(239, 239, 239, 1),)
      ],
    );
  }
}