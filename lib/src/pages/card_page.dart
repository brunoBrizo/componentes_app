import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipoUno(),
          SizedBox(
            height: 20.0,
          ),
          _cardTipoDos(),
          SizedBox(
            height: 20.0,
          ),
          _cardTipoUno(),
          SizedBox(
            height: 20.0,
          ),
          _cardTipoDos()
        ],
      ),
    );
  }

  Widget _cardTipoUno() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text("Soy el titulo"),
            subtitle: Text("Este es el subtitulo del titulo solo para ver"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipoDos() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
            image: NetworkImage(
                'https://i0.wp.com/www.globallandscapesforum.org/wp-content/uploads/2017/10/What-are-landscape_.jpg?fit=3992%2C2242&ssl=1'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("No se que poner"),
          )
        ],
      ),
    );
  }
}
