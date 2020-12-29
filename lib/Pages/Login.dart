import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ponto/Modules/PatternColors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PatternColors.backgroundColor,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: [],
            ),
          );
        },
      ),
    );
  }
}
