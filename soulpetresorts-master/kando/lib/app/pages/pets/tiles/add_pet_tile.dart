import 'package:kando/app/pages/pets/pages/register_pet/register_pet_module.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddPetTile extends StatelessWidget {
  final Function onRefresh;

  AddPetTile(this.onRefresh);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      margin: EdgeInsets.only(
        top: 25,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () async{
         var retorno = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RegisterPetModule(),
            ),
          );

          if(retorno == true){
            onRefresh();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Icon(
                FontAwesomeIcons.paw,
                size: 30,
                color: Color.fromRGBO(152, 152, 152, 1),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Adicionar pet',
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(152, 152, 152, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
