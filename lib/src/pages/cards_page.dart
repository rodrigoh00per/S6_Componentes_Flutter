import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cards Page"),
        ),
        body: ListView(
          children: <Widget>[
            this._cardTipo1(),
            SizedBox(height: 32.0),
            this._cardTipo2(),
            SizedBox(height: 32.0),
            this._cardTipo1(),
            SizedBox(height: 32.0),
            this._cardTipo2(),
            SizedBox(height: 32.0),
            this._cardTipo1(),
            SizedBox(height: 32.0),
            this._cardTipo2(),
            SizedBox(height: 32.0),
          ],
          padding: EdgeInsets.all(
              10.0), //la parte del padding sirve para darle al listView cierto formato
        ));
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text("Soy el tiulo de la tarjeta numero 1 "),
            subtitle: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac sollicitudin libero. Proin vestibulum dignissim eleifend. Etiam urna dolor, pharetra sit amet suscipit id, blandit finibus felis."),
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

  Widget _cardTipo2() {
    final Container _card = Container(
      //recuerda que se le sustituyo por un card
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage(
                "https://besthqwallpapers.com/Uploads/18-1-2018/37652/moon-4k-mountains-night-sky.jpg"),
            height: 300.0,
            fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.cover,
          ),
          Container(
            child: Text("Texto de Prueba de la tarjeta 2"),
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );
    return Container(
      //este container tiene dentro el card
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 15,
              spreadRadius: 1,
              offset: (Offset(2, 10)))
        ],
      ),
      child: ClipRRect(
        //nos permite cortar cualquier cosa que se encuentre fuera de
        child: _card,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
