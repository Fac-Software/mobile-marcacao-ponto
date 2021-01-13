import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ponto/Modules/PatternColors.dart';
import 'package:ponto/Utils/ConvertPercentage.dart';
import 'package:ponto/Utils/Widgets/SizedBoxSpacing.dart';
import 'package:ponto/Utils/Widgets/TitleText.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = new TextEditingController();
  bool _passwordVisible;

  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Container(
            // ignore: missing_return
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: ConvertPercentage.convertWidgetPercentageFromWidth(
                    context, 5),
                right: ConvertPercentage.convertWidgetPercentageFromWidth(
                    context, 5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText(
                  orientation,
                  'Insira seu código de acesso',
                ),
                SizedSpacing(orientation == Orientation.portrait ? 10 : 3),
                Container(
                  width: orientation == Orientation.portrait
                      ? ConvertPercentage
                      .convertWidgetPercentageFromWidth(context, 75)
                      : ConvertPercentage
                      .convertWidgetPercentageFromWidth(context, 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        obscureText: !_passwordVisible,
                        inputFormatters: [
                          new MaskTextInputFormatter(mask: '####')
                        ],
                        controller: controller,
                        style: TextStyle(
                          color: Colors.tealAccent,
                          fontSize:
                          (orientation == Orientation.portrait)
                              ? ConvertPercentage
                              .convertWidgetPercentageFromHeight(
                              context,
                              4.5,
                              false)
                              : ConvertPercentage
                              .convertWidgetPercentageFromHeight(
                              context,
                              7.5, false
                          ),
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.tealAccent,
                                width: ConvertPercentage
                                    .convertWidgetPercentageFromHeight(
                                    context,
                                    0.5,
                                    false)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.tealAccent,
                                width: ConvertPercentage
                                    .convertWidgetPercentageFromHeight(
                                    context,
                                    0.5,
                                    false)),
                          ),
                          icon: Icon(
                            Icons.vpn_key,
                            size: orientation == Orientation.portrait
                                ? ConvertPercentage
                                .convertWidgetPercentageFromHeight(
                                context,
                                4.5,
                                false)
                                : ConvertPercentage
                                .convertWidgetPercentageFromHeight(
                                context,
                                7.5,
                                false),
                            color: Colors.tealAccent,
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.tealAccent,
                                  size:
                                  (orientation == Orientation.portrait)
                                      ? ConvertPercentage
                                      .convertWidgetPercentageFromHeight(
                                      context,
                                      4.5,
                                      false)
                                      : ConvertPercentage
                                      .convertWidgetPercentageFromHeight(
                                      context,
                                      7.5,
                                      false)),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              }),
                        ),
                        readOnly: true,
                      ),
                      SizedBox(
                        height: ConvertPercentage
                            .convertWidgetPercentageFromHeight(
                            context,
                            5,
                            false),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Image.asset(
                                    'images/numbers/NUMBER-1-BUTTON-min.png'),
                                iconSize: orientation == Orientation.portrait
                                    ? ConvertPercentage
                                    .convertWidgetPercentageFromHeight(
                                    context,
                                    8.5,
                                    false)
                                    : ConvertPercentage
                                    .convertWidgetPercentageFromHeight(
                                    context,
                                    10,
                                    false),
                                splashColor: Colors.tealAccent,
                                onPressed: () {
                                  if (controller.text.length < 5) {
                                    controller.text = controller.text + '1';
                                  }
                                  nextPage();
                                },
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'images/numbers/NUMBER-2-BUTTON-min.png'),
                                iconSize:
                                (orientation == Orientation.portrait)
                                    ? ConvertPercentage
                                    .convertWidgetPercentageFromHeight(
                                    context,
                                    8.5,
                                    false)
                                    : ConvertPercentage
                                    .convertWidgetPercentageFromHeight(
                                    context,
                                    10,
                                    false),
                                splashColor: Colors.tealAccent,
                                onPressed: () {
                                  if (controller.text.length < 5) {
                                    controller.text = controller.text + '2';
                                  }
                                  nextPage();
                                },
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'images/numbers/NUMBER-3-BUTTON-min.png'),
                                iconSize:
                                (orientation == Orientation.portrait)
                                    ? ConvertPercentage
                                    .convertWidgetPercentageFromHeight(
                                    context,
                                    8.5,
                                    false)
                                    : ConvertPercentage
                                    .convertWidgetPercentageFromHeight(
                                    context,
                                    10,
                                    false),
                                splashColor: Colors.tealAccent,
                                onPressed: () {
                                  if (controller.text.length < 5) {
                                    controller.text = controller.text + '3';
                                  }
                                  nextPage();
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Image.asset(
                                    'images/numbers/NUMBER-4-BUTTON-min.png'),
                                iconSize:
                                (orientation == Orientation.portrait)
                                    ? ConvertPercentage
                                    .convertWidgetPercentageFromHeight(
                                    context,
                                    8.5,
                                    false)
                                    : ConvertPercentage
                                    .convertWidgetPercentageFromHeight(
                                    context,
                                    10,
                                    false),
                                splashColor: Colors.tealAccent,
                                onPressed: () {
                                  if (controller.text.length < 5) {
                                    controller.text = controller.text + '4';
                                  }
                                  nextPage();
                                },
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'images/numbers/NUMBER-5-BUTTON-min.png'),
                                iconSize:
                                (orientation == Orientation.portrait)
                                    ? ConvertPercentage
                                    .convertWidgetPercentageFromHeight(
                                    context,
                                    8.5,
                                    false)
                                    : ConvertPercentage
                                    .convertWidgetPercentageFromHeight(
                                    context,
                                    10,
                                    false),
                                splashColor: Colors.tealAccent,
                                onPressed: () {
                                  if (controller.text.length < 5) {
                                    controller.text = controller.text + '5';
                                  }
                                  nextPage();
                                },
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'images/numbers/NUMBER-6-BUTTON-min.png'),
                                iconSize:
                                (orientation == Orientation.portrait)
                                    ? ConvertPercentage
                                    .convertWidgetPercentageFromHeight(
                                    context,
                                    8.5,
                                    false)
                                    : ConvertPercentage
                                    .convertWidgetPercentageFromHeight(
                                    context,
                                    10,
                                    false),
                                splashColor: Colors.tealAccent,
                                onPressed: () {
                                  if (controller.text.length < 5) {
                                    controller.text = controller.text + '6';
                                  }
                                  nextPage();
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Image.asset(
                                    'images/numbers/NUMBER-7-BUTTON-min.png'),
                                iconSize: orientation == Orientation.portrait
                                    ? ConvertPercentage
                                        .convertWidgetPercentageFromHeight(
                                            context, 8.5, false)
                                    : ConvertPercentage
                                        .convertWidgetPercentageFromHeight(
                                            context, 10, false),
                                splashColor: Colors.tealAccent,
                                onPressed: () {
                                  if (controller.text.length < 5) {
                                    controller.text = controller.text + '7';
                                  }
                                  nextPage();
                                },
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'images/numbers/NUMBER-8-BUTTON-min.png'),
                                iconSize: orientation == Orientation.portrait
                                    ? ConvertPercentage
                                        .convertWidgetPercentageFromHeight(
                                            context, 8.5, false)
                                    : ConvertPercentage
                                        .convertWidgetPercentageFromHeight(
                                            context, 10, false),
                                splashColor: Colors.tealAccent,
                                onPressed: () {
                                  if (controller.text.length < 5) {
                                    controller.text = controller.text + '8';
                                  }
                                  nextPage();
                                },
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'images/numbers/NUMBER-9-BUTTON-min.png'),
                                iconSize: orientation == Orientation.portrait
                                    ? ConvertPercentage
                                        .convertWidgetPercentageFromHeight(
                                            context, 8.5, false)
                                    : ConvertPercentage
                                        .convertWidgetPercentageFromHeight(
                                            context, 10, false),
                                splashColor: Colors.tealAccent,
                                onPressed: () {
                                  if (controller.text.length < 5) {
                                    controller.text = controller.text + '9';
                                  }
                                  nextPage();
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Image.asset(
                                  'images/numbers/NUMBER-7-BUTTON-min.png',
                                  color: Colors.transparent,
                                ),
                                onPressed: null,
                                iconSize: orientation == Orientation.portrait
                                    ? ConvertPercentage
                                        .convertWidgetPercentageFromHeight(
                                            context, 8.5, false)
                                    : ConvertPercentage
                                        .convertWidgetPercentageFromHeight(
                                            context, 10, false),
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'images/numbers/NUMBER-0-BUTTON-min.png'),
                                onPressed: () {
                                  if (controller.text.length < 5) {
                                    controller.text = controller.text + '0';
                                  }
                                  nextPage();
                                },
                                splashColor: Colors.tealAccent,
                                iconSize: orientation == Orientation.portrait
                                    ? ConvertPercentage
                                        .convertWidgetPercentageFromHeight(
                                            context, 8.5, false)
                                    : ConvertPercentage
                                        .convertWidgetPercentageFromHeight(
                                            context, 10, false),
                              ),
                              IconButton(
                                icon: Image.asset(
                                  'images/numbers/BACK-min.png',
                                ),
                                onPressed: () {
                                  if (controller.text.isNotEmpty) {
                                    controller.text = controller.text.substring(
                                        0, controller.text.length - 1);
                                  }
                                },
                                splashColor: Colors.tealAccent,
                                iconSize: orientation == Orientation.portrait
                                    ? ConvertPercentage
                                        .convertWidgetPercentageFromHeight(
                                            context, 8.5, false)
                                    : ConvertPercentage
                                        .convertWidgetPercentageFromHeight(
                                            context, 10, false),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      backgroundColor: PatternColors.backgroundColor,
    );
  }

  void nextPage() {
    if (controller.text.length == 5) {
      Navigator.pushNamed(context, '/home');
    }
  }
}
