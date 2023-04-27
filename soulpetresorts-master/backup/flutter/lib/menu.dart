import 'package:flutter/material.dart';
import 'package:soulpet/screens/employees/employees.dart';
import 'package:soulpet/screens/Clients/clients.dart';
import 'package:soulpet/screens/login/login.dart';
import 'package:soulpet/screens/products/products.dart';
import 'package:soulpet/screens/register/registerPet.dart';
import 'package:soulpet/screens/unity/registerUnity.dart';
import 'package:soulpet/screens/unity/units.dart';
import 'package:soulpet/screens/users/users.dart';

class MenuContent extends StatefulWidget {
  @override
  _MenuContentState createState() => _MenuContentState();
}

class _MenuContentState extends State<MenuContent> {
  @override
  Widget build(BuildContext context) {
    var _listSelect = ['Selecione', 'Cliente', 'Funcionário'];
    return Container(
              color: Color.fromRGBO(254, 193, 24, 1),
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: Wrap(
                      children: <Widget>[
                        Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 40),
                    child: Center(
                      child: Image.asset('assets/images/logo.png'),
                    )
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(''),
                      ),
                      Expanded(
                        flex: 6,
                        child: Material(
                          child: dropdown('Selecione', Colors.transparent, _listSelect),
                        )
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(''),
                      ),
                    ],
                  )
                      ],
                    )
                  ),
                  Divider(color: Color.fromRGBO(220, 161, 0, 1),),
                  Flexible(
                    flex: 7,
                    child: ListView(
                      padding: const EdgeInsets.only(left: 50, top: 8.0, bottom: 8.0),
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => ClientsScreen()
                            )
                          );
                        },
                          child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: Colors.transparent,
                          child: Text(
                              'Clientes', 
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 26,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                        ),
                        ),
                        GestureDetector(
                          onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => EmployeesScreen()
                            )
                          );
                        },
                          child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: Colors.transparent,
                          child: Text(
                              'Funcionários', 
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 26,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                        ),
                        ),
                        GestureDetector(
                          onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => ProductsScreen()
                            )
                          );
                        },
                          child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: Colors.transparent,
                          child: Text(
                              'Produtos', 
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 26,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                        ),
                        ),
                        GestureDetector(
                          onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => RegisterPetScreen()
                            )
                          );
                        },
                          child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: Colors.transparent,
                          child: Text(
                              'Relatórios', 
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 26,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                        ),
                        ),
                        GestureDetector(
                          onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => UnitsScreen()
                            )
                          );
                        },
                          child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: Colors.transparent,
                          child: Text(
                              'Unidades', 
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 26,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                        ),
                        ),
                        GestureDetector(
                          onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => UsersScreen()
                            )
                          );
                        },
                          child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: Colors.transparent,
                          child: Text(
                              'Usuários', 
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 26,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                        ),
                        )
                        
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 40,
                      child: GestureDetector(
                          onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => LoginScreen()
                            )
                          );
                        },
                          child: Text(
                              'Sair',
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 26,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                        )
                      
                      
                    )
                  )
                ],
              ),
            );
  }

  Widget dropdown(_mylabel, _border, _list, {Color colorlabel = Colors.white}){
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 8, bottom: 22, left: 10),
          color: Color.fromRGBO(254, 193, 24, 1),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Color.fromRGBO(254, 193, 24, 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                style: TextStyle(color: Colors.white, fontSize: 20),
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                value: _mylabel,
                onChanged: (String newValue){
                  setState((){
                    _mylabel = newValue;
                  });
                },
                items: _list.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          )
        ),
        SizedBox(height: 20,)
      ],
    );
    }

    Widget dropdownEditor(_mylabel, _border, _list, {Color colorlabel = Colors.white}){
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 8, bottom: 22, left: 10),
          color: Color.fromRGBO(220, 220, 220, 1),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Color.fromRGBO(254, 193, 24, 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                style: TextStyle(color: Colors.black, fontSize: 16),
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                value: _mylabel,
                onChanged: (String newValue){
                  setState((){
                    _mylabel = newValue;
                  });
                },
                items: _list.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          )
        ),
        SizedBox(height: 20,)
      ],
    );
    }
}