import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:ponto/Modules/Assets.dart';
import 'package:ponto/Modules/PatternColors.dart';
import 'package:ponto/Utils/ConvertPercentage.dart';
import 'package:ponto/Utils/Widgets/SizedBoxSpacing.dart';
import 'package:ponto/Utils/Widgets/TitleText.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  double percent = 0.0;

  @override
  void initState() {
    Timer timer;
    timer = Timer.periodic(Duration(milliseconds: 10), (_) {
      print('Percent Update');
      setState(() {
        percent += 1;
        if (percent >= 100) {
          timer.cancel();
          Navigator.pushNamed(context, '/login');
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /**
     * Calculando o tamanho de cada widget
     */
    //<-- Imagem -->

    // A Imagem se for Paisagem
    double imageSizeCaseLandscape =
        ConvertPercentage.convertWidgetPercentageFromHeight(context, 45, false);
    // A Imagem se for Retrato
    double imageSizeCasePortrait =
        ConvertPercentage.convertWidgetPercentageFromHeight(context, 35, false);

    //<-- Linear Progress Bar -->

    // Calculando o Tamanho quando a orientação for paisagem
    double heightLinearProgressBarIfLandscape =
        ConvertPercentage.convertWidgetPercentageFromHeight(
            context, 13.45, false);
    double widthLinearProgressBarIfLandscape =
        ConvertPercentage.convertWidgetPercentageFromWidth(context, 50);
    // Calculando o Tamanho quando a orientação for retrato
    double heightLinearProgressBarIfPortrait =
        ConvertPercentage.convertWidgetPercentageFromHeight(
            context, 7.45, false);
    double widthLinearProgressBarIfPortrait =
        ConvertPercentage.convertWidgetPercentageFromWidth(context, 75);

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText(orientation, 'Marcação de Ponto'),
                SizedSpacing(5),
                Image.asset(Assets.RELOGIO_ICON,
                    height: orientation == Orientation.portrait
                        ? imageSizeCasePortrait
                        : imageSizeCaseLandscape),
                SizedSpacing(5),
                Container(
                  height: orientation == Orientation.portrait
                      ? heightLinearProgressBarIfPortrait
                      : heightLinearProgressBarIfLandscape,
                  width: orientation == Orientation.portrait
                      ? widthLinearProgressBarIfPortrait
                      : widthLinearProgressBarIfLandscape,
                  child: LiquidLinearProgressIndicator(
                    value: percent / 100,
                    valueColor:
                        AlwaysStoppedAnimation(PatternColors.backgroundColor),
                    backgroundColor: Colors.white,
                    borderColor: Colors.tealAccent[400],
                    borderWidth: 5.0,
                    borderRadius: 12.0,
                    direction: Axis.horizontal,
                    center: Text(
                      percent.toString() + "%",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: PatternColors.primaryTextColor,
                      ),
                    ),
                  ),
                ),
                SizedSpacing(5),
                Row(
                  children: [
                    Image.asset(
                      Assets.OFICIAL_LOGO_FAC_SOFTWARE,
                      height: 15,
                      width: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'App desenvolvido pela FacSoftware',
                      style: GoogleFonts.rhodiumLibre(
                          color: PatternColors.primaryTextColor),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          );
        },
      ),
      backgroundColor: PatternColors.backgroundColor,
    );
  }
}
