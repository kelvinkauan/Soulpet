import 'package:kando/app/pages/consultations/consultations_module.dart';
import 'package:kando/app/shared/templates/template_interno.dart';
import 'package:flutter/material.dart';

class DaycarePage extends StatefulWidget {
  final String title;
  const DaycarePage({Key key, this.title = "DayCare"}) : super(key: key);

  @override
  _DaycarePageState createState() => _DaycarePageState();
}

class _DaycarePageState extends State<DaycarePage> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: widget.title,
        //home: true,
        builder: () {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Text(''),
              ),
              Flexible(
                flex: 9,
                child: Container(
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  alignment: Alignment.topRight,
                  child: Stack(
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          margin: EdgeInsets.only(left: 15, right: 15, top: 40),
                          padding: EdgeInsets.only(top: 70),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                new BoxShadow(
                                    color: Colors.black12, blurRadius: 10.0)
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: Text(
                                  'Fred',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(61, 68, 69, 1),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(height: 20),
                              Flexible(flex: 1, child: line(context)),
                              SizedBox(height: 20),
                              Flexible(
                                flex: 8,
                                child: ListView(
                                  children: <Widget>[
                                    activity(context, true, '07:33',
                                        'Daycare Check-in', false),
                                    activity(context, false, '09:00', 'Natação',
                                        false),
                                    activity(context, false, '12:00', 'Almoço',
                                        false),
                                    activity(context, false, '15:35', 'Banho',
                                        false),
                                    activity(context, false, '15:40',
                                        'Hidratação', false),
                                    activity(context, false, '17:47', 'Jantar',
                                        false),
                                    activity(context, true, '18:15',
                                        'Daycare Check-out', true),
                                  ],
                                ),
                              )
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 90,
                            height: 90,
                            alignment: Alignment.bottomRight,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/petAvatar.png'),
                                    fit: BoxFit.cover),
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(45)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget line(context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(250, 188, 24, 1),
            child: Center(
              child: Text(
                'Hoje',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConsultationsModule()));
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Color.fromRGBO(216, 216, 216, 1)),
                      top:
                          BorderSide(color: Color.fromRGBO(216, 216, 216, 1)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Saúde',
                    style: TextStyle(
                        color: Color.fromRGBO(70, 77, 79, 1),
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget activity(context, _check, _hour, _title, _last) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: _check
                        ? Color.fromRGBO(182, 211, 26, 1)
                        : Color.fromRGBO(250, 188, 24, 1),
                    maxRadius: 30,
                    child: Text(
                      _hour,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                  _last
                      ? Container()
                      : Container(
                          padding: EdgeInsets.zero,
                          height: 25,
                          decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      color: Color.fromRGBO(206, 206, 206, 1),
                                      width: 1.5))),
                          child: Text(''),
                        ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _title,
                    style: TextStyle(
                        color: Color.fromRGBO(70, 77, 79, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  _last
                      ? Container()
                      : Container(
                          padding: EdgeInsets.zero,
                          height: 25,
                          child: Text(''),
                        ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
