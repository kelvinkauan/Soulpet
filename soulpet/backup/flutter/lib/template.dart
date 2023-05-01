import 'package:flutter/material.dart';

class Template extends StatefulWidget {
   final String title;
   final bool menubar;
   final Function builder;
   final String background;

   Template(
     {Key key,
     this.title,
     this.menubar,
     this.builder,
     this.background = 'assets/images/bg.jpg',
     ListView body})
     : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}
Widget imagem(context, background){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(background),
        alignment: Alignment(0, -1),
        fit: BoxFit.cover
      )
    ),
  );
}

Widget bgPrincipal(context, background){
  return Stack(
    children: <Widget>[
      imagem(context, background),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            stops: [0.1, 0.9],
            colors: [
              Color.fromRGBO(0, 0, 0, 0.0),

              Color.fromRGBO(0, 0, 0, 0.0)
            ]
          )
        ),
      )
    ],
  );
}

class _TemplateState extends State<Template>{
  @override
  Widget build(BuildContext context) {
    if (widget.menubar) {
      return Stack(
        children: <Widget>[
          bgPrincipal(context, widget.background),
          Scaffold(
            appBar: AppBar(
              title: Text(widget.title ?? ""),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
            ),
            backgroundColor: Colors.transparent,
            body: widget.builder(),
          )
        ],
      );
    }else{
      return Stack(
        children: <Widget>[
          bgPrincipal(context, widget.background),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: widget.builder(),
          )
        ],
      );
    }
  }
}