import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_return),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            "Mostrar Alerta",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: () {
            this._mostrarAlerta(context);
          },
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Esta es una alerta muy cool"),
                SizedBox(
                  height: 15.0,
                ),
                FlutterLogo(size: 50.0,)
              ],
            ),
            actions: this._regresarBotones(context),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
          );
        },
        barrierDismissible: true);
  }

  List<Widget> _regresarBotones(context) {
    return [
      FlatButton(
        child: Text("Cancelar"),
        onPressed: () => Navigator.of(context).pop(),
      ),
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ];
  }
}
