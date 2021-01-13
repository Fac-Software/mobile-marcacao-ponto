import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant/instant.dart';
import 'package:intl/intl.dart';
import 'package:ponto/Modules/PatternColors.dart';
import 'package:ponto/Utils/ConvertPercentage.dart';
import 'package:timer_builder/timer_builder.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Timer timer;
  var value = 0;

  String getSystemTime() {
    DateTime myDT = DateTime.now(); //Current DateTime
    DateTime eastCoast = dateTimeToZone(
        zone: "ART",
        datetime: myDT); //DateTime in EST zone

    String format = new DateFormat.Hms().format(eastCoast);
    return format;
  }

  Widget appBar(BuildContext context, Orientation orientation) {
    return AppBar(
      backgroundColor: PatternColors.appBarColor,
      title: TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
        return Text(
          "${getSystemTime()}",
          style: TextStyle(
              color: PatternColors.primaryTextColor,
              fontSize: 25,
              fontWeight: FontWeight.w700),
        );
      }),
      centerTitle: true,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Container(
              padding: EdgeInsets.all(7.5),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/banco');
                },
                color: PatternColors.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      (orientation == Orientation.portrait)
                          ? ConvertPercentage.convertWidgetPercentageFromHeight(
                          context, 5, false)
                          : ConvertPercentage.convertWidgetPercentageFromHeight(
                          context, 22.5, false)),
                ),
                child: (orientation == Orientation.portrait)
                    ? IconButton(
                  color: PatternColors.secondaryColor,
                  icon: Icon(
                    Icons.table_chart,
                    color: Colors.white,
                  ),
                )
                    : Row(
                  children: [
                    Icon(
                      Icons.table_chart,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Ver Banco de Horas',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          appBar: appBar(context, orientation),
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                left: ConvertPercentage.convertWidgetPercentageFromWidth(
                    context, 5),
                right: ConvertPercentage.convertWidgetPercentageFromWidth(
                    context, 5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Roger Joel Salazar Guillermo',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ribeyeMarrow(
                      color: PatternColors.primaryTextColor,
                      fontSize: (orientation == Orientation.portrait)
                          ? ConvertPercentage.convertWidgetPercentageFromHeight(
                          context, 4, false,
                          appBar: appBar(context, orientation))
                          : ConvertPercentage.convertWidgetPercentageFromHeight(
                          context, 10, false,
                          appBar: appBar(context, orientation))),
                ),
                SizedBox(
                  height: (orientation == Orientation.portrait)
                      ? ConvertPercentage.convertWidgetPercentageFromHeight(
                      context, 10, false)
                      : ConvertPercentage.convertWidgetPercentageFromHeight(
                      context, 5, false),
                ),
                GestureDetector(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          ConvertPercentage.convertWidgetPercentageFromHeight(
                              context, 22.5, false)),
                    ),
                    animationDuration: Duration(seconds: 3),
                    splashColor: PatternColors.secondaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/DIGITAL-ICON.png',
                          width: (orientation == Orientation.portrait)
                              ? ConvertPercentage
                              .convertWidgetPercentageFromHeight(
                              context, 35, false)
                              : ConvertPercentage
                              .convertWidgetPercentageFromHeight(
                              context, 45, false),
                        )
                      ],
                    ),
                    onPressed: () {},
                    color: PatternColors.backgroundColor,
                  ),
                  onTapDown: (TapDownDetails details) {
                    print('down');
                    timer = Timer.periodic(Duration(milliseconds: 500), (t) {
                      setState(() {
                        value++;
                      });
                      print('value $value ; details ${timer.tick}');
                      if (t.tick == 2) {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Ponto registrado com sucesso'),
                            content: Text(
                                'Seu ponto foi regitrado com sucesso, consulte '
                                'seus horários de hoje na parte de baixo'),
                            actions: [
                              TextButton(
                                  child: Text('Approve'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                            ],
                          ),
                        );
                      }
                    });
                  },
                  // onTapUp: (TapUpDetails details) {
                  //   print('up');
                  //   timer.cancel();
                  // },
                  onTapCancel: () {
                    print('cancel');
                    timer.cancel();
                  },
                ),
                SizedBox(
                  height: (orientation == Orientation.portrait)
                      ? ConvertPercentage.convertWidgetPercentageFromHeight(
                      context, 5, false)
                      : ConvertPercentage.convertWidgetPercentageFromHeight(
                      context, 2.5, false),
                ),
                Text(
                  'Coloque o dedo na Imagem',
                  style: GoogleFonts.rhodiumLibre(
                      color: PatternColors.primaryTextColor,
                      fontSize: (orientation == Orientation.portrait)
                          ? ConvertPercentage.convertWidgetPercentageFromHeight(
                          context, 3, false)
                          : ConvertPercentage.convertWidgetPercentageFromHeight(
                          context, 5, false)),
                ),
                SizedBox(
                  height: (orientation == Orientation.portrait)
                      ? ConvertPercentage.convertWidgetPercentageFromHeight(
                      context, 10, false)
                      : ConvertPercentage.convertWidgetPercentageFromHeight(
                      context, 2.5, false),
                ),
                Row(
                  mainAxisAlignment: (orientation == Orientation.portrait)
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    Flexible(
                        child: Text(
                          'Ultimas marcações de Hoje: 08:00; 12:00; 13:00; 17:00',
                          style: GoogleFonts.rhodiumLibre(
                              fontSize: (orientation == Orientation.portrait)
                                  ? ConvertPercentage
                                  .convertWidgetPercentageFromHeight(
                                  context, 2, false)
                                  : ConvertPercentage
                                  .convertWidgetPercentageFromHeight(
                                  context, 3.5, false),
                              color: PatternColors.primaryTextColor),
                          textAlign: TextAlign.center,
                        ))
                  ],
                )
              ],
            ),
          ),
          backgroundColor: PatternColors.backgroundColor,
        );
      },
    );
  }
}
