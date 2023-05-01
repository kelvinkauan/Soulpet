import 'package:app_tutor/app/pages/home/home_module.dart';
import 'package:flutter/material.dart';

class TemplateInterno extends StatefulWidget {
  final String title;
  final String background;
  final Widget header;
  final bool home;
  final Function builder;

  TemplateInterno(
      {Key key,
      this.title,
      this.background = 'assets/images/pet-bg.jpg',
      this.header,
      this.home,
      this.builder,
      ListView body})
      : super(key: key);

  @override
  _TemplateInternoState createState() => _TemplateInternoState();
}

Widget foto(context) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)),
        image: DecorationImage(
            image: AssetImage('assets/images/pet-bg.jpg'),
            alignment: Alignment(0, -1),
            fit: BoxFit.cover)),
  );
}

Widget bgPrincipal(context) {
  return Stack(children: <Widget>[
    Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
              flex: 3,
              child: Stack(
                children: <Widget>[
                  foto(context),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50)),
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.1, 0.9],
                        colors: [
                          // Colors are easy thanks to Flutter's Colors class.
                          Color.fromRGBO(235, 185, 0, 0.80),

                          Color.fromRGBO(235, 185, 0, 0.80),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[],
                    ),
                  ),
                ],
              )),
          Flexible(flex: 8, child: Container(color: Colors.white, child: null))
        ],
      ),
    )
  ]);
}

class _TemplateInternoState extends State<TemplateInterno> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        bgPrincipal(context),
        Scaffold(
          appBar: AppBar(
            leading: widget.home ? IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HomeModule()
                ));
              },
              icon: Icon(Icons.home, color: Colors.white,),
            ) : null,
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 18),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: false,
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          body: widget.builder(),
        )
      ],
    );
  }
}
