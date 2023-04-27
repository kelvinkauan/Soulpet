import 'package:flutter/material.dart';

class Template extends StatefulWidget {
  final String title;
  final String background;
  final Widget header;
  final bool headerLogo;
  final Function builder;

  Template(
      {Key key,
      this.title,
      this.background = 'assets/images/bg-orange.png',
      this.header,
      this.headerLogo = false,
      this.builder,
      ListView body})
      : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
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

Widget bgHome(context, _header) {
  return Stack(children: <Widget>[
    Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
              flex: 4,
              child: Stack(
                children: <Widget>[
                  foto(context),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
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
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/logo.png',
                            width: 150,
                            height: 150,
                          ),
                          Text(
                            'Bem Vindo!',
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          _header,
                          SizedBox(
                            height: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Flexible(flex: 6, child: Container(color: Colors.white, child: null))
        ],
      ),
    )
  ]);
}

class _TemplateState extends State<Template> {
  @override
  Widget build(BuildContext context) {
    if (widget.headerLogo) {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                    flex: 4,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/logo.png',
                                width: 150,
                                height: 150,
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    )),
                Flexible(
                    flex: 5, child: Container(color: Colors.white, child: null))
              ],
            ),
            widget.builder()
          ],
        ),
      );
    } else if (widget.header != null) {
      return Stack(
        children: <Widget>[
          bgHome(context, widget.header),
          Scaffold(
            drawer: Drawer(),
            appBar: AppBar(
              title: Text(
                widget.title ?? '',
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
    } else {
      return Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.white,
            body: widget.builder(),
          )
        ],
      );
    }
  }
}
