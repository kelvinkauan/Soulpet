import 'package:flutter/material.dart';
import 'package:soulpet/screens/Clients/informationPet.dart';
import 'package:soulpet/templateInterno.dart';

class ReportsScreen extends StatefulWidget {
  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: 'Relatório de compras - Agosto 2019',
        colorTitle: Color.fromRGBO(254, 193, 24, 1),
        menuLateral: true,
        menubar: true,
        builder: () {
          return ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(40),
                  child: Wrap(
                    children: <Widget>[conteudo(context), rodape(context)],
                  )),
            ],
          );
        });
  }

  Widget conteudo(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Color.fromRGBO(248, 196, 22, 1), width: 5),
                      image: DecorationImage(
                          image: AssetImage('assets/images/petAvatar.png'),
                          fit: BoxFit.contain)),
                )),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 8,
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Fred',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color.fromRGBO(254, 193, 24, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      InformationPetScreen()));
                        },
                        child: Text(
                          'Ver perfil',
                          style: TextStyle(
                              fontSize: 18,
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
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Text(
            'Serviços',
            style: TextStyle(
                fontSize: 22,
                color: Color.fromRGBO(162, 162, 162, 1),
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                  flex: 4,
                  child: Text('Titulo', style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Animal', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Valor', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
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
            height: 150,
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
                linhaServicos('Diária', 'Fred', '80,00'),
          linhaServicos('Banho', 'Fred', '30,00')
              ],
            )
          ),
          
          Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Text(
            'Produtos',
            style: TextStyle(
                fontSize: 22,
                color: Color.fromRGBO(162, 162, 162, 1),
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                  child: Text('Quantidade', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Valor', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('SubTotal', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
                )
              ],
            )
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 550,
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
                linhaProdutos('assets/images/cinto.png', 'Cinto de Segurança Chalesco para Cães', '1', '34,90', '34,90'),
                linhaProdutos('assets/images/guia.png', 'Guia Retrátil até 15 kg - Azul', '1', '34,90', '34,90'),
                linhaProdutos('assets/images/guia2.png', 'Guia Retrátil até 15 kg - Vermelho', '1', '34,90', '34,90'),
                linhaProdutos('assets/images/guia3.png', 'Guia e Peitoral barcelona - Azul', '1', '34,90', '34,90'),
                linhaProdutos('assets/images/petisco.png', 'Pestisco Nestlé Purina Dog Chow Carinhos Mix de Frutas para Cães', '1', '34,90', '34,90'),
                linhaProdutos('assets/images/bifinho.png', 'Bifinho Kelco Keldog Criasdores carne e Cereais Raças Pequenas', '1', '34,90', '34,90')
              ],
            )
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: linhaValor('200,00', '280,00', '40,00', '440,00'),
          )
      ],
    );
  }

  Widget linhaServicos(_titulo, _animal, _valor){
    return Column(
      children: <Widget>[
        Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(_titulo, style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1), fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text(_animal, textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1), fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('R\$' + _valor, textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(254, 193, 24, 1), fontSize: 16),),
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
                        onPressed: (){},
                      )
                    ],
                  ),
                  )
                )
              ],
            ),
            Divider(color: Color.fromRGBO(239, 239, 239, 1),)
      ],
    );
  }

  Widget linhaProdutos(_foto, _nome, _qtd, _valor, _subTotal){
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
                  child: Text(_qtd, textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1), fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('R\$' + _valor, textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1), fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('R\$' + _subTotal, textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1), fontSize: 16),),
                )
              ],
            ),
        ),
            Divider(color: Color.fromRGBO(239, 239, 239, 1),)
      ],
    );
  }

  Widget linhaValor(_servicos, _produtos, _desconto, _total){
    Orientation orientation = MediaQuery.of(context).orientation;
    var _vazio = 0;
    var _conteudo = 0;
    if (orientation == Orientation.portrait) {
      _vazio = 7;
      _conteudo = 3;
    } else {
      _vazio = 8;
      _conteudo = 2;
    }
    return Row(
      children: <Widget>[
        Expanded(
          flex: _vazio,
          child: Text(''),
        ),
        Expanded(
          flex: _conteudo,
          child: Wrap(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 20,),
        Row(
          children: <Widget>[
            Text(
              'Serviços: ',
              style: TextStyle(
                fontSize: 19,
                color: Color.fromRGBO(152, 152, 152, 1)
              ),
            ),
            Text(
              'R\$ ' + _servicos,
              style: TextStyle(
                fontSize: 19,
                color: Color.fromRGBO(152, 152, 152, 1)
              ),
            )
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: <Widget>[
            Text(
              'Produtos: ',
              style: TextStyle(
                fontSize: 19,
                color: Color.fromRGBO(152, 152, 152, 1)
              ),
            ),
            Text(
              'R\$ ' + _produtos,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 19,
                color: Color.fromRGBO(152, 152, 152, 1)
              ),
            )
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: <Widget>[
            Text(
              'Desconto: ',
              style: TextStyle(
                fontSize: 19,
                fontFamily: 'Helvetica Neue',
                color: Color.fromRGBO(152, 152, 152, 1)
              ),
            ),
            Text(
              'R\$ ' + _desconto,
              style: TextStyle(
                fontSize: 19,
                color: Color.fromRGBO(226, 7, 7, 1)
              ),
            )
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: <Widget>[
            Text(
              'Total: ',
              style: TextStyle(
                fontSize: 21,
                color: Color.fromRGBO(90, 90, 90, 1)
              ),
            ),
            Text(
              'R\$ ' + _servicos,
              style: TextStyle(
                fontSize: 28,
                color: Color.fromRGBO(90, 90, 90, 1),
                fontWeight: FontWeight.bold
              ),
            )
          ],
        )
      ],
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
      padding: EdgeInsets.only(top: 20, bottom: 20),
      splashColor: _colorText,
      color: _colorBg,
      shape: StadiumBorder(),
      child: Text(
        _text,
        textAlign: TextAlign.center,
        style: TextStyle(color: _colorText, fontSize: 18),
      ),
    );
  }

  Widget rodape(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Text(''),
            ),
            Expanded(
              flex: 3,
              child: button(context, 'Imprimir', Colors.white,
                  Color.fromRGBO(145, 209, 68, 1), 'RegisterClientScreen'),
            )
          ],
        )
      ],
    );
  }

}
