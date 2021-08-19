import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _nombre = "";
  String _email = "";
  String _password = "";
  String _fecha = "";
  TextEditingController _inputDateController = new TextEditingController();
  List<String> _poderes = ['uno', 'dos', 'tres'];
  String _opcionSeleccionada = 'uno';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs Page"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text("Letras ${_nombre.length}"),
          hintText: "Nombre de la persona",
          labelText: "Nombre",
          helperText: "Solo es un nombre",
          suffixIcon: Icon(Icons.accessibility_new),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text("Letras ${_email.length}"),
          hintText: "Nombre de la persona",
          labelText: "Email",
          // helperText: "Solo es un nombre",
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text("Letras ${_password.length}"),
          hintText: "Contrasenia",
          labelText: "Password",
          // helperText: "Solo es un nombre",
          suffixIcon: Icon(Icons.security),
          icon: Icon(Icons.lock_outline)),
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Fecha",
          labelText: "Fecha",
          // helperText: "Solo es un nombre",
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onChanged: (valor) {
        setState(() {
          _fecha = valor;
        });
      },
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2030));

    if (picked != null) {
      setState(() {
        _fecha = picked.toIso8601String();
        _inputDateController.text = _fecha;
      });
    }
  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 40.0,
        ),
        Expanded(
          child: DropdownButton(
              value: _opcionSeleccionada,
              items: getOpcionesDropdown(),
              onChanged: (opt) {
                setState(() {
                  _opcionSeleccionada = opt;
                });
              }),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }
}
