import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Page"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            Divider(),
            _crearCheckBox(),
            Divider(),
            _crearSwitch(),
            Divider(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: "Valor: " + _valorSlider.toString(),
      value: _valorSlider,
      min: 1.0,
      max: 400.0,
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      width: _valorSlider,
      fit: BoxFit.contain,
      image: NetworkImage(
          'https://i.pinimg.com/originals/f6/1d/c1/f61dc14df8d0449d0dbf6f9ec6525df9.jpg'),
    );
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
        title: Text("Bloquear slider"),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }

  Widget _crearSwitch() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SwitchListTile(
          subtitle: Text("subtitulo"),
          secondary: Text("secondary"),
          activeColor: Colors.red,
          title: Text("Bloquear slider"),
          value: _bloquearCheck,
          onChanged: (valor) {
            setState(() {
              _bloquearCheck = valor;
            });
          }),
    );
  }
}
