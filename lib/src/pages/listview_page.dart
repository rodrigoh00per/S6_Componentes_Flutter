import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  //este nos va a permitir poder modificar o estar usando el scroll como nos plasca
  ScrollController _scrollController = new ScrollController();
  List<int> _listanumeros = new List();
  int _ultimoNumero = 0;
  bool _cargando = false;

  @override
  void initState() {
    super.initState();
    this._agregar10Elementos();
    this._scrollController.addListener(() {
      if (this._scrollController.position.pixels ==
          this._scrollController.position.maxScrollExtent) {
        this._fetchDataImagenes();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    this._scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: Stack(
        children: <Widget>[this._crearLista(), this._mostrarLoading()],
      ),
    );
  }

  Widget _crearLista() {
    //es importante tomar en cuenta que el index es la posicion del arreglo que va a mostrar ese valor
    return RefreshIndicator(
      onRefresh: this._resetearData,
      child: ListView.builder(
        controller: this._scrollController,
        itemCount: this._listanumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _listanumeros[index];
          return FadeInImage(
            image: NetworkImage("https://picsum.photos/id/$image/500/300"),
            placeholder: AssetImage("assets/jar-loading.gif"),
          );
        },
      ),
    );
  }

  _agregar10Elementos() {
    for (int i = 0; i < 10; i++) {
      this._ultimoNumero++;

      this._listanumeros.add(this._ultimoNumero);
    }
    setState(() {});
  }

  Future _fetchDataImagenes() async {
    setState(() {
      this._cargando = true;
    });

    //est es es para simular el delay
    new Timer(Duration(seconds: 2), this._peticionHTTP);
    return Future.delayed(Duration(seconds: 1));
  }

  void _peticionHTTP() {
    setState(() {
      this._cargando = false;
    });

    this._agregar10Elementos();
    this._scrollController.animateTo(
        this._scrollController.position.pixels +
            100, //a donde pondra su desmadre
        duration: Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn);
  }

  Widget _mostrarLoading() {
    if (this._cargando) {
      return Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  backgroundColor: Colors.white10,
                )
              ],
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Future<void> _resetearData() {
    new Timer(Duration(seconds: 2), () {
      this._listanumeros.clear();
      this._ultimoNumero++;
      this._agregar10Elementos();
    });
    return Future.delayed(Duration(seconds: 2));
  }
}
