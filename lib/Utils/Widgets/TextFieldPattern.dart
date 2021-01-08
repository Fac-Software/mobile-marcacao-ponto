import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ponto/Modules/PatternColors.dart';
import 'package:ponto/Utils/ConvertPercentage.dart';

class TextFieldPattern extends StatefulWidget {
  @override
  _TextFieldPatternState createState() => _TextFieldPatternState();
}

class _TextFieldPatternState extends State<TextFieldPattern> {
  @override
  Widget build(BuildContext context) {
    double marginInput =
        ConvertPercentage.convertWidgetPercentageFromWidth(context, 3);
    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(color: PatternColors.primaryDecorationColor, width: 3),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 7.5),
      margin: EdgeInsets.only(right: marginInput, left: marginInput),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: PatternColors.primaryDecorationColor, width: 3),
          ),
          icon: Icon(
            Icons.vpn_key,
            color: PatternColors.primaryDecorationColor,
          ),
          hintText: 'Insira aqui sua senha',
          hintStyle: TextStyle(color: PatternColors.primaryDecorationColor),
        ),
        style: TextStyle(color: PatternColors.primaryDecorationColor),
      ),
    );
  }
}
