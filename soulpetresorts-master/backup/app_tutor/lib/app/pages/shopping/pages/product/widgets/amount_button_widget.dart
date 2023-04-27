import 'package:app_tutor/app/shared/utils/color_app.dart';
import 'package:flutter/material.dart';

class AmountButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Container(
      width: (size.width * .25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: InkWell(
              child: Container(
                width: (size.width * .08),
                padding: EdgeInsets.all(2),
                color: ColorApp.orange,
                child: Text(
                  '-',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '0',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 0,
            child: InkWell(
              child: Container(
                width: (size.width * .08),
                padding: EdgeInsets.all(2),
                color: ColorApp.orange,
                child: Text(
                  '+',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
