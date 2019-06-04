import 'dart:convert';

import "package:flutter/services.dart" show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];
  _MenuProvider() {
    this.cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    //nos sirve para ese json que estamos leyendo en un string
    final resp = await rootBundle.loadString("recursos/menu_opts.json");
    Map  lista = json.decode(resp);

    this.opciones = lista["rutas"];

    return this.opciones;
  }
}

final menuProvider = new _MenuProvider();
