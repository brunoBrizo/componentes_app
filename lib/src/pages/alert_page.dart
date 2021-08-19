import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      body: Center(
          child: RaisedButton(
        child: Text("Mostrar alertas"),
        color: Colors.blue,
        textColor: Colors.white,
        shape: StadiumBorder(),
        onPressed: () => _mostrarAlerta(context),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            title: Text("Titulo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Este es el contenido de la caja de alerta"),
                SizedBox(
                  height: 30.0,
                ),
                FlutterLogo(
                  size: 50.0,
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("OK"))
            ],
          );
        });
  }
}
