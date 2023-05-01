import 'package:app_tutor/app/pages/invoice/invoice_module.dart';
import 'package:app_tutor/app/shared/templates/template_interno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MonthlyPaymentPage extends StatefulWidget {
  final String title;
  const MonthlyPaymentPage({Key key, this.title = "Mensalidades"})
      : super(key: key);

  @override
  _MonthlyPaymentPageState createState() => _MonthlyPaymentPageState();
}

class _MonthlyPaymentPageState extends State<MonthlyPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return TemplateInterno(
        title: widget.title,
     //   home: true,
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
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        new BoxShadow(color: Colors.black12, blurRadius: 10.0)
                      ]),
                  child: ListView(
                    children: <Widget>[
                      monthlyPayment(context, 'Novembro 2019', '20/11/2019', 'assets/images/svg/loupe-add.svg', Color.fromRGBO(235, 185, 0, 1)),
                      monthlyPayment(context, 'Outubro 2019', '20/10/2019', 'assets/images/svg/alert.svg', Color.fromRGBO(214, 35, 35, 1)),
                      monthlyPayment(context, 'Setembro 2019', '20/09/2019', 'assets/images/svg/success.svg', Color.fromRGBO(137, 196, 85, 1)),
                      monthlyPayment(context, 'Agosto 2019', '20/08/2019', 'assets/images/svg/success.svg', Color.fromRGBO(137, 196, 85, 1)),
                      monthlyPayment(context, 'Julho 2019', '20/07/2019', 'assets/images/svg/success.svg', Color.fromRGBO(137, 196, 85, 1)),
                    ],
                  )
                ),
              ),
              
            ],
          );
        });
  }

  Widget monthlyPayment(context, _month, _expiry, _icon, _colorIcon){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => InvoiceModule()
        ));
      },
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(_month),
            subtitle: Text('Vencimento em ' + _expiry),
            trailing: SvgPicture.asset(_icon, width: 40, color: _colorIcon,),
          ),
          Divider(color: Color.fromRGBO(216, 216, 216, 1),)
        ],
      ),
    );
  }
}
