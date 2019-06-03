import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cards Page"),
        ),
        body: ListView(
          children: <Widget>[this._cardTipo1()],
          padding: EdgeInsets.all(10.0),//la parte del padding sirve para darle al listView cierto formato
        ));
  }

  Widget _cardTipo1() {
    return Card(
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
}
