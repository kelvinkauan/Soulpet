import 'package:kando/app/shared/utils/color_app.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final List items;
  final String hint;
  final dynamic value;
  final Function onChanged;

  DropdownWidget({
    this.items,
    this.hint = '',
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.only(bottom: 5, top: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color.fromRGBO(210, 210, 210, 1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton(
        isExpanded: true,
        value: value,
        hint: Text(
          hint,
          style: TextStyle(
            color: Color.fromRGBO(137, 137, 137, 1),
            fontSize: 15,
          ),
        ),
        icon: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.keyboard_arrow_down,
            size: 27,
            color: ColorApp.orange,
          ),
        ),
        underline: Container(),
        onChanged: onChanged,
        items: items
            .map<DropdownMenuItem>(
              (value) => DropdownMenuItem(
                value: value.id,
                child: Text(value.description),
              ),
            )
            .toList(),
      ),
    );
  }
}
