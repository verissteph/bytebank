import 'package:flutter/material.dart';

import 'screens/listagem.dart';
void main() => runApp(Bytebank());
class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ListaTransferencias(),
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary
        )

      )
    );
  }
}

