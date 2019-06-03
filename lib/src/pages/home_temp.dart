/* import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final List<String> _opciones = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Componentes Temp")),
        body: /* ListView(children: this._crearItems()), */
            ListView(
          children: this._crearItemsCortito(),
        ));
  }

  List<Widget> _crearItems() {
    List<Widget> listamostrar = List<Widget>();

    for (String opcion in this._opciones) {
      final listTile = ListTile(
        title: Text(opcion),
      );
      listamostrar..add(listTile)..add(Divider());
    }
    return listamostrar;
  }

  List<Widget> _crearItemsCortito() {
    return this._opciones.map((opcion) {
      return Column(children: <Widget>[
        ListTile(
          title: Text(opcion),
          subtitle: Text("Este es mi subtitulo"),
          leading: Icon(Icons.account_balance_wallet),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        Divider()
      ]);
    }).toList();
  }
}
 */