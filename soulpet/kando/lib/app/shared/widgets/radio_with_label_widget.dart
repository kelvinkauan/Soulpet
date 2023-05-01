import 'package:kando/app/shared/utils/color_app.dart';
import 'package:flutter/material.dart';

class RadioWithLabelWidget extends StatelessWidget {
  final Function onTap;
  final String label;
  final dynamic value;
  final dynamic groupValue;

  RadioWithLabelWidget({this.onTap, this.value, this.groupValue, this.label});

  BoxDecoration get decoration => (groupValue == value)
      ? BoxDecoration(
          color: ColorApp.orange,
          borderRadius: BorderRadius.circular(15),
        )
      : BoxDecoration(
          border: Border.all(
            color: ColorApp.C667178,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (onTap != null)? () => onTap(value) : null,
      child: Container(
        padding: EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: 2,
          right: 2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 18,
              height: 18,
              decoration: decoration,
            ),
            SizedBox(width: 5),
            Text(label),
          ],
        ),
      ),
    );
  }
}
