import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ponto/Modules/PatternColors.dart';
import 'package:ponto/Utils/ConvertPercentage.dart';
import 'package:ponto/Utils/HexColor.dart';

class BancoHoras extends StatefulWidget {
  @override
  _BancoHorasState createState() => _BancoHorasState();
}

class _BancoHorasState extends State<BancoHoras> {

  @override
  Widget build(BuildContext context) {

    Widget appBar(Orientation orientation) {
      return AppBar(
        backgroundColor: PatternColors.appBarColor,
        title: Text(
          (orientation == Orientation.portrait) ?
          "Banco":
          "Banco de Horas",
          style: TextStyle(
              color: PatternColors.primaryTextColor,
              fontSize: 25,
              fontWeight: FontWeight.w700),
        ),
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
                    borderRadius: BorderRadius.circular((orientation ==
                        Orientation.portrait)
                        ? ConvertPercentage.convertWidgetPercentageFromHeight(
                        context, 5, false)
                        : ConvertPercentage.convertWidgetPercentageFromHeight(
                        context, 22.5, false)),
                  ),
                  child: (orientation == Orientation.portrait)
                      ? IconButton(
                    color: PatternColors.secondaryColor,
                    icon: Icon(
                      Icons.download_outlined,
                      color: Colors.white,
                    ), onPressed: () {  },
                  ) :
                  Row(
                    children: [
                      Icon(
                        Icons.download_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Relátorio',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )),
        ],
      );
    }

    Widget dropdownMonth() {
      return Container(
        child: DropdownButtonFormField(
          items: [
            DropdownMenuItem(
              child: Text("First Item"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("Second Item"),
              value: 2,
            ),
            DropdownMenuItem(
                child: Text("Third Item"),
                value: 3
            ),
            DropdownMenuItem(
                child: Text("Fourth Item"),
                value: 4
            )
          ],
          decoration: InputDecoration(
              icon: Icon(Icons.calendar_today_outlined),
              hintText: 'Selecione o mês'
          ),
          onChanged: (value) {},
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(color: HexColor.fromHex("210066"), width: 3),
        ),
        padding: EdgeInsets.only(left: 7.5, right: 7.5),
      );
    }

    Widget dropdownDay(){
      return Container(
        child: DropdownButtonFormField(
          items: [
            DropdownMenuItem(
              child: Text("First Item"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("Second Item"),
              value: 2,
            ),
            DropdownMenuItem(
                child: Text("Third Item"),
                value: 3
            ),
            DropdownMenuItem(
                child: Text("Fourth Item"),
                value: 4
            )
          ],
          decoration: InputDecoration(
              icon: Icon(Icons.today),
              hintText: 'Selecione o dia'
          ),
          onChanged: (value) {},
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(color: HexColor.fromHex("210066"), width: 3),
        ),
        padding: EdgeInsets.only(left: 7.5, right: 7.5),
      );
    }
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          appBar: appBar( orientation),
          body: Container(
            margin: EdgeInsets.only(
                right: ConvertPercentage
                    .convertWidgetPercentageFromWidth(
                    context,
                    5),
                top: ConvertPercentage
                    .convertWidgetPercentageFromHeight(
                    context,
                    3.5,
                    false,
                    appBar: appBar( orientation)),
                left: ConvertPercentage
                    .convertWidgetPercentageFromWidth(
                    context,
                    5)),
            child: Column(
              children: [
                (orientation == Orientation.portrait) ?
                Column(
                  children: [
                    dropdownDay(),
                    SizedBox(
                      height: ConvertPercentage
                          .convertWidgetPercentageFromHeight(
                          context,
                          5,
                          false,
                          appBar: appBar( orientation)),
                    ),
                    dropdownMonth(),
                  ],
                ) :
                Row(
                  children: [
                    Flexible(child: dropdownDay()),
                    SizedBox(width: ConvertPercentage
                        .convertWidgetPercentageFromWidth(context, 2.5)),
                    Flexible(child: dropdownMonth())
                  ],
                ),
                SizedBox(
                  height: ConvertPercentage
                      .convertWidgetPercentageFromHeight(
                      context,
                      5,
                      false,
                      appBar: appBar( orientation)),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Use children total size
                    children: [
                      title(appBar(orientation), orientation),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: .0),
                        height: ConvertPercentage
                            .convertWidgetPercentageFromHeight(
                            context,
                            55,
                            false,
                            appBar: appBar(orientation)),
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          itemExtent: orientation == Orientation.portrait ?
                          ConvertPercentage
                              .convertWidgetPercentageFromHeight(
                              context,
                              24,
                              false,
                              appBar: appBar(orientation)) :
                          ConvertPercentage
                              .convertWidgetPercentageFromHeight(
                              context,
                              48,
                              false,
                              appBar: appBar(orientation)),
                          children: <Widget>[
                            dataHorario(appBar(orientation), orientation),
                            dataHorario(appBar(orientation), orientation),
                            dataHorario(appBar(orientation), orientation),
                            dataHorario(appBar(orientation), orientation),
                            dataHorario(appBar(orientation), orientation),
                            dataHorario(appBar(orientation), orientation),
                          ],
                        ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: PatternColors.backgroundColor,
        );
      },
    );
  }

  Row dataHorario(AppBar appBar, Orientation orientation){
    return Row(
      children: [
        Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: HexColor.fromHex('9766FF'),
                border: Border(
                  bottom: BorderSide(
                      width: 1.5,
                      color: HexColor.fromHex('DCCCFF')),
                ),
              ),
              child: Center(
                child: Text('26/04',
                  style: GoogleFonts.ribeyeMarrow(
                      fontSize: (orientation == Orientation.portrait) ?
                      ConvertPercentage
                          .convertWidgetPercentageFromHeight(context, 4, false, appBar: appBar)
                          :
                      ConvertPercentage
                          .convertWidgetPercentageFromHeight(context, 10, false, appBar: appBar),
                      color: HexColor.fromHex('DCCCFF')
                  ),
                ),
              ),
              height: (orientation == Orientation.portrait) ?
              ConvertPercentage
                  .convertWidgetPercentageFromHeight(
                  context,
                  24,
                  false,
                  appBar: appBar) :
              ConvertPercentage
                  .convertWidgetPercentageFromHeight(
                  context,
                  48,
                  false,
                  appBar: appBar),
            )),
        Flexible(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: HexColor.fromHex('9766FF'),
                    border: Border(
                      left: BorderSide(
                        color: HexColor.fromHex('DCCCFF'),
                        width: 1.5,
                      ),
                      right: BorderSide(
                        color: HexColor.fromHex('DCCCFF'),
                        width: 1.5,
                      ),
                      bottom: BorderSide(
                          width: 1.5,
                          color: HexColor.fromHex('DCCCFF')),
                    ),
                  ),
                  child: Center(
                    child: Text('08:00',
                      style: GoogleFonts.rhodiumLibre(
                          color: HexColor.fromHex('DCCCFF'),
                          fontSize: (orientation == Orientation.portrait)
                              ?
                          ConvertPercentage
                              .convertWidgetPercentageFromHeight(context, 2.5, false, appBar: appBar) :
                          ConvertPercentage
                              .convertWidgetPercentageFromHeight(context, 5, false, appBar: appBar)
                      ),
                    ),
                  ),
                  height: (orientation == Orientation.portrait) ?
                  ConvertPercentage
                      .convertWidgetPercentageFromHeight(
                      context,
                      6,
                      false,
                      appBar: appBar) :
                  ConvertPercentage
                      .convertWidgetPercentageFromHeight(
                      context,
                      12,
                      false,
                      appBar: appBar),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: HexColor.fromHex('9766FF'),
                    border: Border(
                      left: BorderSide(
                        color: HexColor.fromHex('DCCCFF'),
                        width: 1.5,
                      ),
                      right: BorderSide(
                        color: HexColor.fromHex('DCCCFF'),
                        width: 1.5,
                      ),
                      bottom: BorderSide(
                          width: 1.5,
                          color: HexColor.fromHex('DCCCFF')),
                    ),
                  ),
                  child: Center(
                    child: Text('12:00',
                      style: GoogleFonts.rhodiumLibre(
                          color: HexColor.fromHex('DCCCFF'),
                          fontSize: (orientation == Orientation.portrait)
                              ?
                          ConvertPercentage
                              .convertWidgetPercentageFromHeight(context, 2.5, false, appBar: appBar) :
                          ConvertPercentage
                              .convertWidgetPercentageFromHeight(context, 5, false, appBar: appBar)
                      ),
                    ),
                  ),
                  height: (orientation == Orientation.portrait) ?
                  ConvertPercentage
                      .convertWidgetPercentageFromHeight(
                      context,
                      6,
                      false,
                      appBar: appBar) :
                  ConvertPercentage
                      .convertWidgetPercentageFromHeight(
                      context,
                      12,
                      false,
                      appBar: appBar),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: HexColor.fromHex('9766FF'),
                    border: Border(
                      left: BorderSide(
                        color: HexColor.fromHex('DCCCFF'),
                        width: 1.5,
                      ),
                      right: BorderSide(
                        color: HexColor.fromHex('DCCCFF'),
                        width: 1.5,
                      ),
                      bottom: BorderSide(
                          width: 1.5,
                          color: HexColor.fromHex('DCCCFF')),
                    ),
                  ),
                  child: Center(
                    child: Text('13:00',
                      style: GoogleFonts.rhodiumLibre(
                          color: HexColor.fromHex('DCCCFF'),
                          fontSize: (orientation == Orientation.portrait)
                              ?
                          ConvertPercentage
                              .convertWidgetPercentageFromHeight(context, 2.5, false, appBar: appBar) :
                          ConvertPercentage
                              .convertWidgetPercentageFromHeight(context, 5, false, appBar: appBar)
                      ),
                    ),
                  ),
                  height: (orientation == Orientation.portrait) ?
                  ConvertPercentage
                      .convertWidgetPercentageFromHeight(
                      context,
                      6,
                      false,
                      appBar: appBar) :
                  ConvertPercentage
                      .convertWidgetPercentageFromHeight(
                      context,
                      12,
                      false,
                      appBar: appBar),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: HexColor.fromHex('9766FF'),
                    border: Border(
                      left: BorderSide(
                        color: HexColor.fromHex('DCCCFF'),
                        width: 1.5,
                      ),
                      right: BorderSide(
                        color: HexColor.fromHex('DCCCFF'),
                        width: 1.5,
                      ),
                      bottom: BorderSide(
                          width: 1.5,
                          color: HexColor.fromHex('DCCCFF')),
                    ),
                  ),
                  child: Center(
                    child: Text('17:00',
                      style: GoogleFonts.rhodiumLibre(
                          color: HexColor.fromHex('DCCCFF'),
                          fontSize: (orientation == Orientation.portrait)
                              ?
                          ConvertPercentage
                              .convertWidgetPercentageFromHeight(context, 2.5, false, appBar: appBar) :
                          ConvertPercentage
                              .convertWidgetPercentageFromHeight(context, 5, false, appBar: appBar)
                      ),
                    ),
                  ),
                  height: (orientation == Orientation.portrait) ?
                  ConvertPercentage
                      .convertWidgetPercentageFromHeight(
                      context,
                      6,
                      false,
                      appBar: appBar) :
                  ConvertPercentage
                      .convertWidgetPercentageFromHeight(
                      context,
                      12,
                      false,
                      appBar: appBar),
                ),
              ],
            )),
        Flexible(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text((orientation == Orientation.portrait) ?
                    "08 hrs e \n 00 min" :
                    "08 hrs e 00 min",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ribeyeMarrow(
                        color: HexColor.fromHex('DCCCFF'),
                        fontSize: (orientation == Orientation.portrait) ?
                        ConvertPercentage.convertWidgetPercentageFromHeight(context, 3, false) :
                        ConvertPercentage.convertWidgetPercentageFromHeight(context, 5.5, false),
                      ),
                    ),
                    SizedBox(
                      height: ConvertPercentage
                          .convertWidgetPercentageFromHeight(context, 3.5, false, appBar: appBar),
                    ),
                    Flexible(
                      child: Text('Jornada Inconsistente',
                        style: TextStyle(
                            fontSize: (orientation == Orientation.portrait) ?
                            ConvertPercentage
                                .convertWidgetPercentageFromHeight(context, 2, false, appBar: appBar):
                            ConvertPercentage
                                .convertWidgetPercentageFromHeight(context, 4, false, appBar: appBar),
                            color: HexColor.fromHex('DCCCFF')
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: HexColor.fromHex('9766FF'),
                border: Border(
                  bottom: BorderSide(
                      width: 1.5,
                      color: HexColor.fromHex('DCCCFF')),
                ),
              ),
              height: (orientation == Orientation.portrait) ?
              ConvertPercentage
                  .convertWidgetPercentageFromHeight(
                  context,
                  24,
                  false,
                  appBar: appBar) :
              ConvertPercentage
                  .convertWidgetPercentageFromHeight(
                  context,
                  48,
                  false,
                  appBar: appBar),
            )),
      ],
    );
  }
  Row title (AppBar appBar, Orientation orientation){
    return Row(
      children: [
        Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: HexColor.fromHex("210066"),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0)),
              ),
              alignment: Alignment.center,
              child: Text('Data',
                style: TextStyle(
                  color: PatternColors.primaryTextColor,
                  fontSize: (orientation == Orientation.portrait) ?
                  ConvertPercentage
                      .convertWidgetPercentageFromHeight(
                      context,
                      4,
                      false) : ConvertPercentage
                      .convertWidgetPercentageFromHeight(
                      context,
                      6,
                      false),
                ),
              ),
              height: (orientation == Orientation.portrait) ?
              ConvertPercentage
                  .convertWidgetPercentageFromHeight(
                  context,
                  7.5,
                  false,
                  appBar: appBar) : ConvertPercentage
                  .convertWidgetPercentageFromHeight(
                  context,
                  10,
                  false,
                  appBar: appBar),
              width: ConvertPercentage
                  .convertWidgetPercentageFromWidth(
                  context,
                  30),
            )),
        Flexible(child: Container(
          decoration: BoxDecoration(
            color: HexColor.fromHex("210066"),
            border: Border(
              left: BorderSide(
                color: HexColor.fromHex('DCCCFF'),
                width: 1.5,
              ),
              right: BorderSide(
                color: HexColor.fromHex('DCCCFF'),
                width: 1.5,
              ),
            ),
          ),
          alignment: Alignment.center,
          child: Text('Hora',
            style: TextStyle(
              color: PatternColors.primaryTextColor,
              fontSize: (orientation == Orientation.portrait) ?
              ConvertPercentage
                  .convertWidgetPercentageFromHeight(
                  context,
                  4,
                  false) : ConvertPercentage
                  .convertWidgetPercentageFromHeight(
                  context,
                  6,
                  false),
            ),
          ),
          height: (orientation == Orientation.portrait) ?
          ConvertPercentage
              .convertWidgetPercentageFromHeight(
              context,
              7.5,
              false,
              appBar: appBar) : ConvertPercentage
              .convertWidgetPercentageFromHeight(
              context,
              10,
              false,
              appBar: appBar),
          width: ConvertPercentage
              .convertWidgetPercentageFromWidth(
              context,
              30),
        )),
        Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: HexColor.fromHex("210066"),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0)),
              ),
              alignment: Alignment.center,
              child: Text('Total',
                style: TextStyle(
                  color: PatternColors.primaryTextColor,
                  fontSize: (orientation == Orientation.portrait) ?
                  ConvertPercentage
                      .convertWidgetPercentageFromHeight(
                      context,
                      4,
                      false) : ConvertPercentage
                      .convertWidgetPercentageFromHeight(
                      context,
                      6,
                      false),
                ),
              ),
              height: (orientation == Orientation.portrait) ?
              ConvertPercentage
                  .convertWidgetPercentageFromHeight(
                  context,
                  7.5,
                  false,
                  appBar: appBar) : ConvertPercentage
                  .convertWidgetPercentageFromHeight(
                  context,
                  10,
                  false,
                  appBar: appBar),
              width: ConvertPercentage
                  .convertWidgetPercentageFromWidth(
                  context,
                  30),
            )
        ),
      ],
    );
  }
}
