import 'package:flutter/material.dart';
import 'package:soulpet/screens/employees/registerEmployee.dart';
import 'package:soulpet/templateInterno.dart';

class EmployeesScreen extends StatefulWidget {
  @override
  _EmployeesScreenState createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: '',
        menuLateral: true,
        menubar: false,
        menuSearch: true,
        linkButton: RegisterEmployeeScreen(),
        contentButton: 'Cadastrar Funcionário',
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
                  child: Text('Loja', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text('Cargo', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
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
                linhaFuncionario('assets/images/avatar.png', 'Andressa Soares', '01', 'Banhista'),
                linhaFuncionario('assets/images/avatar.png', 'Ingrid Lacerda', '01', 'Tosador'),
                linhaFuncionario('assets/images/avatar.png', 'Bruna Pereira', '02', 'Tosador'),
                linhaFuncionario('assets/images/avatar.png', 'Carla Ribeiro', '02', 'Banhista'),
                linhaFuncionario('assets/images/avatar.png', 'Paulo Fernandes', '02', 'Banhista'),
                linhaFuncionario('assets/images/avatar.png', 'Junior Marques', '02', 'Tosador'),
              ],
            )
          ),
      ],
    );
  }

  Widget linhaFuncionario(_foto, _nome, _loja, _cargo){
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
                  child: Text('Loja ' + _loja, textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1), fontSize: 16),),
                ),
                Expanded(
                  flex: 2,
                  child: Text(_cargo, textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(254, 193, 24, 1), fontSize: 16),),
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