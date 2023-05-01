import 'package:flutter/material.dart';
import 'package:soulpet/menu.dart';

class Helpers{
  static campoText(_mylabel, _obscureText, _border, {Color colorlabel = Colors.white}){
    var decoreBtn = InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
      border: InputBorder.none,
      hintText: _mylabel,
      contentPadding: const EdgeInsets.all(20.0),
      hintStyle: TextStyle(
        color: Color.fromRGBO(140, 135, 135, 1),
        fontSize: 17
      )
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: _border, width: 2.0),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          obscureText: _obscureText,
          decoration: decoreBtn,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(140, 135, 135, 1),
          ),
          validator: (value) {
            if (value.isEmpty){
              return 'Campo obrigatorio';
            }
          },
        ),
        ),
        SizedBox(height: 20,)
      ],
    );
  }

  static campoTextoInterno(_mylabel, _border, _obscureText, {Color colorlabel = Colors.white}){
    _obscureText = false;
    var decoreBtn = InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
      border: InputBorder.none,
      hintText: _mylabel,
      contentPadding: const EdgeInsets.all(20.0),
      hintStyle: TextStyle(
        color: Color.fromRGBO(140, 135, 135, 1),
        fontSize: 17
      )
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: _border, width: 1.0),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: decoreBtn,
          obscureText: _obscureText,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color.fromRGBO(140, 135, 135, 1),
          ),
          validator: (value) {
            if (value.isEmpty){
              return 'Campo obrigatorio';
            }
          },
        ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }

  static campoIcone(_mylabel, _border, _icon, {Color colorlabel = Colors.white}){
    var decoreBtn = InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
      border: InputBorder.none,
      hintText: _mylabel,
      suffixIcon: Icon(_icon, color: Color.fromRGBO(254, 193, 24, 1),),
      contentPadding: const EdgeInsets.all(20.0),
      hintStyle: TextStyle(
        color: Color.fromRGBO(140, 135, 135, 1),
        fontSize: 17
      )
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: _border, width: 1.0),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: decoreBtn,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color.fromRGBO(140, 135, 135, 1),
          ),
          validator: (value) {
            if (value.isEmpty){
              return 'Campo obrigatorio';
            }
          },
        ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }

  static campoTextoPesquisa(_mylabel, _border, {Color colorlabel = Colors.white}){
    var decoreBtn = InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
      border: InputBorder.none,
      hintText: _mylabel,
      contentPadding: const EdgeInsets.all(10.0),
      hintStyle: TextStyle(
        color: Color.fromRGBO(140, 135, 135, 1),
        fontSize: 17
      )
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: _border, width: 1.0),
            borderRadius: BorderRadius.circular(40.0)
          ),
          child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: decoreBtn,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color.fromRGBO(140, 135, 135, 1),
          ),
          validator: (value) {
            if (value.isEmpty){
              return 'Campo obrigatorio';
            }
          },
        ),
        ),
        SizedBox(height: 20,)
      ],
    );
  }



  static CampoTextArea(_mylabel, _border, _linhas, {Color colorlabel = Colors.white}){
    var decoreBtn = InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
      border: InputBorder.none,
      hintText: _mylabel,
      contentPadding: const EdgeInsets.all(20.0),
      hintStyle: TextStyle(
        color: Color.fromRGBO(140, 135, 135, 1),
        fontSize: 17
      )
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: _border, width: 1.0),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: decoreBtn,
          maxLines: _linhas,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color.fromRGBO(140, 135, 135, 1),
          ),
          validator: (value) {
            if (value.isEmpty){
              return 'Campo obrigatorio';
            }
          },
        ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}


