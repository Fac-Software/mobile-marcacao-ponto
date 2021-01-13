import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ponto/Modules/PatternColors.dart';
import 'package:ponto/Utils/ConvertPercentage.dart';

// ignore: must_be_immutable
class TitleText extends StatelessWidget {
  Orientation orientation;
  String textTitle;

  TitleText(this.orientation, this.textTitle);

  @override
  Widget build(BuildContext context) {
    //<-- Titulo da Pagina -->
    // Calculando o Tamanho da Fonte quando for Paisagem
    double fontSizeTitleCaseLandscape =
        ConvertPercentage.convertTextPercentage(context, 11.45, false, 102, 75);
    // Calculando o Tamanho da Fonte quando for Retrato
    double fontSizeTitleCasePortrait =
        ConvertPercentage.convertTextPercentage(context, 6, false, 102, 75);

    return Text(
      textTitle,
      style: GoogleFonts.ribeyeMarrow(
          color: PatternColors.primaryTextColor,
          fontSize: orientation == Orientation.portrait
              ? fontSizeTitleCasePortrait
              : fontSizeTitleCaseLandscape),
      textAlign: TextAlign.center,
    );
  }
}
