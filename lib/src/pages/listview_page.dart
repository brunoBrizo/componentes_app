import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrolController = new ScrollController();
  int _ultimoNumero = 0;
  List<int> _listaNumeros = new List();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrolController.addListener(() {
      if (_scrolController.position.pixels ==
          _scrolController.position.maxScrollExtent) {
        //_agregar10();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrolController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List View"),
        ),
        body: Stack(
          children: <Widget>[_crearLista(context), _crearLoading()],
        ));
  }

  Widget _crearLista(BuildContext context) {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrolController,
        itemCount: _listaNumeros.length,
        itemBuilder: (context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
              placeholder: AssetImage('assets/original.gif'),
              image: NetworkImage(
                  'https://picsum.photos/seed/picsum/500/300?image=$imagen'));
        },
      ),
    );
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoNumero++;
      _listaNumeros.add(_ultimoNumero);
    }
    setState(() {});
  }

  Future<Null> obtenerPagina1() {
    final duration = Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoNumero++;
      _agregar10();
    });
    return Future.delayed(duration);
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHttp);
  }

  void respuestaHttp() {
    _isLoading = false;
    _scrolController.animateTo(_scrolController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 300));

    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
