import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ponto/Pages/BancoHoras.dart';
import 'package:ponto/Pages/Home.dart';
import 'package:ponto/Pages/Login.dart';
import 'package:ponto/Pages/WelcomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp
  ]).then((_) =>
      runApp(MaterialApp(
          home: WelcomePage(),
          routes: {
            '/loading': (context) => WelcomePage(),
            '/login': (context) => Login(),
            '/home' : (context) => Home(),
            '/banco' : (context) => BancoHoras()
          })
      )
  );
}
