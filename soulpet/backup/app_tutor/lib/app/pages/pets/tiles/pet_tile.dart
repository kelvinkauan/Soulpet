import 'package:app_tutor/app/shared/models/pet_model.dart';
import 'package:flutter/material.dart';

class PetTile extends StatelessWidget {
  final PetModel data;

  PetTile(this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /*
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => InformationPetModule()));
            */
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 25,
        ),
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            Container(
              width: 100,
              height: 60,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(255, 189, 0, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    (data.name != null) ? data.name : '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    (data.avatar != null) ? data.avatar : '',
                  ),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Color.fromRGBO(255, 189, 0, 1),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
