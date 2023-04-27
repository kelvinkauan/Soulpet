import 'package:flutter/material.dart';
import 'package:soulpet/compents/helpers.dart';
import 'package:soulpet/menu.dart';
import 'package:soulpet/screens/register/registerClient.dart';

class TemplateInterno extends StatefulWidget {
   final String title;
   final bool menuLateral;
   final bool menubar;
   final bool menuSearch;
   final Function builder;
   final String background;
   final dynamic linkButton;
   final String contentButton;
   final Color colorTitle;

   TemplateInterno(
     {Key key,
     this.title,
     this.menuLateral,
     this.menubar,
     this.menuSearch = false,
     this.builder,
     this.background = 'assets/images/bg.jpg',
     this.linkButton,
     this.contentButton,
     this.colorTitle,
     ListView body})
     : super(key: key);

  @override
  _TemplateInternoState createState() => _TemplateInternoState();
}

Widget button(context, _text, _colorText, _colorBg, _action){
    return RaisedButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => _action));
      },
      padding: EdgeInsets.only(top: 0, bottom: 0, left: 25, right: 25),
      splashColor: _colorText,
      color: _colorBg,
      shape: StadiumBorder(),
      child: Text(
        _text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: _colorText,
          fontSize: 14
        ),
      ),
    );
  }

class _TemplateInternoState extends State<TemplateInterno>{
  @override
  Widget build(BuildContext context) {
    if (widget.menuLateral && widget.menuSearch) {
      return Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: MenuContent()
          ),
          Expanded(
            flex: 8,
            child: Scaffold(
              body: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              offset: new Offset(0.50, 0.50),
              blurRadius: 10.0
            )
          ],
            ),
            child: Row(
              children: <Widget>[
                SizedBox(width: 20,),
                Expanded(
                  flex: 2,
                  child: button(context, widget.contentButton, Colors.white, Color.fromRGBO(145, 209, 68, 1), widget.linkButton),
                ),
                
                Expanded(
                  flex: 4,
                  child: Text('')
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(top: 23),
                    child: Helpers.campoTextoPesquisa('Digite aqui o nome do cliente ou pet', Color.fromRGBO(254, 193, 24, 1)),
                  )
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 2,
                  child: button(context, 'Pesquisar', Colors.white, Color.fromRGBO(254, 193, 24, 1), '_action')
                ),
                SizedBox(width: 20,),
              ],
            )
                      ),
                    ),
                    Flexible(
                      flex: 9,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: widget.builder(),
                      ),
                    )
                  ],
                ),
              )
            )
          ),
        ],
      );
    }
    if (widget.menuLateral) {
      return Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: MenuContent()
          ),
          Expanded(
            flex: 8,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: true,
                title: Text(widget.title, style: TextStyle(color: widget.colorTitle, fontSize: 24, fontWeight: FontWeight.bold),),
                centerTitle: false,
                backgroundColor: Colors.white,
              ),
              body: widget.builder(),
            )
          ),
        ],
      );
    }else{
      return Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            body: widget.builder(),
          )
        ],
      );
    }
  }
}