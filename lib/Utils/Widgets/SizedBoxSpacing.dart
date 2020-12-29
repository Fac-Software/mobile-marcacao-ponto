import 'package:flutter/cupertino.dart';
import 'package:ponto/Utils/ConvertPercentage.dart';

// ignore: must_be_immutable
class SizedSpacing extends StatefulWidget {
  double percentage;

  SizedSpacing(this.percentage);

  @override
  _SizedSpacingState createState() => _SizedSpacingState(percentage);
}

class _SizedSpacingState extends State<SizedSpacing> {
  double percentage;

  _SizedSpacingState(this.percentage);

  @override
  Widget build(BuildContext context) {
    double size = ConvertPercentage.convertWidgetPercentageFromHeight(
        context, percentage, false);

    return SizedBox(
      height: size,
    );
  }
}
