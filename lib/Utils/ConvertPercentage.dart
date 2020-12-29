import 'package:flutter/cupertino.dart';

class ConvertPercentage {
  /// Este método permite setar altura de um componente apenas inserindo a sua
  /// devida porcentagem em relação ao tamanho total da tela.
  ///
  /// **[percentage]**: com valor de **0 a 100** você informa a porcentagem
  /// que o Widget ocupara no dispositivo
  ///
  /// **[context]**: você informa o Contexto(tela) do seu app
  ///
  /// **[appBar]**: caso tiver um appBar no layout da sua tela você insere ele aqui
  ///
  /// **[ignoreTopPadding]**: se você quiser ignorar o espaço onde fica
  /// localizada as informações de hora, notificações, 4g, wifi, etc
  ///*/

  // ignore: missing_return
  static double convertWidgetPercentageFromHeight(
      BuildContext context, double percentage, bool ignoreTopPadding,
      {PreferredSizeWidget appBar}) {

    try {
      if (percentage < 100 && percentage > 0) {
        var size = MediaQuery.of(context).size;
        double percentageToCalculate = _percentageToCalculate(percentage);
        double frameSize;

        if (appBar == null) {
          if (!ignoreTopPadding) {
            frameSize = size.height - MediaQuery.of(context).padding.top;
            return frameSize * percentageToCalculate;
          } else {
            return frameSize * percentageToCalculate;
          }
        } else {
          if (!ignoreTopPadding) {
            frameSize = (size.height - appBar.preferredSize.height) -
                MediaQuery.of(context).padding.top;
            return frameSize * percentageToCalculate;
          } else {
            frameSize = size.height - appBar.preferredSize.height;
            return frameSize * percentage;
          }
        }
      } else {
        throw Exception('Você deve inserir uma Porcentagem valida de 0 a 100');
      }
    } catch (e) {
      print(e);
    }
  }

  // ignore: missing_return
  static double convertWidgetPercentageFromWidth(
      BuildContext context, double percentage) {
    try {
      if (percentage < 100 && percentage > 0) {
        var size = MediaQuery.of(context).size;
        double percentageToCalculate = _percentageToCalculate(percentage);
        double frameSize = size.width;

        return frameSize * percentageToCalculate;
      } else {
        throw Exception('Você deve inserir uma Porcentagem valida de 0 a 100');
      }
    } catch (e) {
      print(e);
    }
  }

  // ignore: missing_return
  static double convertTextPercentage(BuildContext context, double percentage,
      bool ignoreTopPadding, double sizeOccupy, double fontSize,
      {PreferredSizeWidget appBar}) {
    double percentageBetweenSizeBusyAndFontSize =
        _percentageToCalculate(_findPercentage(sizeOccupy, fontSize));

    double heightFontSize = convertWidgetPercentageFromHeight(
        context, percentage, ignoreTopPadding,
        appBar: appBar);

    return _acharValorParcial(
        heightFontSize, percentageBetweenSizeBusyAndFontSize);
  }

  static double _percentageToCalculate(double porcentagem) {
    return porcentagem / 100;
  }

  static double _findPercentage(double valorTotal, double valorParcial) {
    return (valorParcial * 100) / valorTotal;
  }

  static double _acharValorParcial(
      double valorTotal, double porcentagemParcial) {
    return (valorTotal * porcentagemParcial);
  }
}
