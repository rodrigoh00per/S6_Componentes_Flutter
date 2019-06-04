import 'package:flutter/material.dart';
import 'package:s6_componentes_flutter/src/providers/menu_provider.dart';
import 'package:s6_componentes_flutter/src/utils/icono_string_utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componente"),
      ),
      body: this._lista(),
    );
  }

  Widget _lista() {
//este future builder nos sirve para poder la data tipo promesas
    return FutureBuilder(
      initialData: [],
      future: menuProvider.cargarData(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        //asyncsnapshot ya es la data regresada
        //el builder es donde recuperamos la data

        return ListView(children: this.listaItems(snapshot.data, context));
      },
    );
  }

  List<Widget> listaItems(List<dynamic> data, BuildContext context) {
    List<Widget> listilla = [];

    //vamos a regrear un list title
    data.forEach((item) {
      final widgetTile = ListTile(
        title:
            Text(item["texto"]), //recuperada que dentro de la list hay un map
        leading: getIcon(item["icon"]),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
        onTap: () {
          /*  final _route = MaterialPageRoute(builder: (context) => AlertPage()); */
          Navigator.pushNamed(context, item["ruta"]);
        },
      );
      Divider();
      listilla..add(widgetTile)..add(Divider());
    });
    return listilla;
  }
}
