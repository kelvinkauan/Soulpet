import 'package:kando/app/shared/templates/template_interno.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  final String title;
  const ServicesPage({Key key, this.title = "Serviços"}) : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}
TextEditingController searchController = TextEditingController();
class _ServicesPageState extends State<ServicesPage> {
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
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Color.fromRGBO(243, 243, 243, 1)),
                          child:search(),
                    ),
                        ),
                      ),
                      Flexible(
                        flex: 8,
                        child: ListView(
                            children: <Widget>[
                              service(context, 'Resort', '_action'),
                              service(context, 'Spa', '_action'),
                              service(context, 'DayCare', '_action'),
                              service(context, 'Pacotes', '_action'),
                              service(context, 'Pet Sitter', '_action'),
                              service(context, 'Banho', '_action'),
                              service(context, 'Banho e Tosa', '_action'),
                            ],
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

  Widget service(context, _name, _action){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => _action
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 9,
                  child: Text(
                    _name,
                    style: TextStyle(
                      color: Color.fromRGBO(153, 154, 156, 1),
                      fontSize: 18,
                      
                    ),
                    
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(Icons.chevron_right, color: Color.fromRGBO(255, 189, 0, 1),),
                )
              ],
            ),
            SizedBox(height: 8,),
            Divider(color: Color.fromRGBO(151, 151, 151, 1),)
          ],
        ),
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
}
