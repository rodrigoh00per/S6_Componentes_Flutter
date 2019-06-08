import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String nombre = "";
  String email = "";
  String password = "";
  String _fecha = "";
  String _poderSeleccionado = "Volar";

  List<String> poderes = [
    "Volar",
    "Super Fuerza",
    "Nadar Bajo el Agua",
    "Invisibilidad"
  ];
  TextEditingController _textEditingDatePicker = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs de Texto"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInputs(),
          Divider(),
          _inputEmail(),
          Divider(),
          _inputPassword(),
          Divider(),
          _mostrarFecha(context),
          Divider(),
          _mostrarDropdown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInputs() {
    return TextField(
        textCapitalization: TextCapitalization.sentences,
        onChanged: (nombre) {
          setState(() {
            this.nombre = nombre;
          });
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            counter: Text("Letras: ${this.nombre.length}"),
            //este es como el placeholder
            hintText: "Nombre de la persona",
            labelText: "Nombre",
            helperText: "Solamente el nombre ",
            icon: Icon(Icons.person),
            suffixIcon: Icon(Icons.accessibility)));
  }

  Widget _inputEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (email) {
          setState(() {
            this.email = email;
          });
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

            //este es como el placeholder
            hintText: "Email",
            labelText: "Email",
            icon: Icon(Icons.email),
            suffixIcon: Icon(Icons.alternate_email)));
  }

  Widget _inputPassword() {
    return TextField(
        obscureText: true,
        keyboardType: TextInputType.text,
        onChanged: (email) {
          setState(() {
            this.password = password;
          });
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

            //este es como el placeholder
            hintText: "Password",
            labelText: "Password",
            icon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.lock_outline)));
  }

  Widget _mostrarFecha(BuildContext context) {
    return TextField(
      controller: _textEditingDatePicker,
      enableInteractiveSelection: false,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

          //este es como el placeholder
          hintText: "Fecha",
          labelText: "Fecha",
          icon: Icon(Icons.date_range),
          suffixIcon: Icon(Icons.timelapse)),
      onTap: () {
        FocusScope.of(context).requestFocus(
            new FocusNode()); //este nos sirve para que no aparezca el foco de que estoy en ese campo

        this._mostrarDatePicker(context);
      },
    );
  }

  _mostrarDatePicker(BuildContext context) async {
    DateTime picked = await showDatePicker(
        locale: Locale("es"),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2017),
        lastDate: DateTime(2022));
    if (picked != null) {
      setState(() {
        this._fecha = picked.toString();
        this._textEditingDatePicker.text = this._fecha;
      });
    }
  }

  Widget _mostrarDropdown() {
    return Row(
      children: <Widget>[
        Container(padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.select_all),
        ),
        SizedBox(
          height: 30.0,
        ),
        Expanded(
          child: DropdownButton(
            value: this._poderSeleccionado,
            items: _regresarItems(),
            onChanged: (valor) {
              setState(() {
                this._poderSeleccionado = valor;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Tu nombre es ${this.nombre}"),
      subtitle: Text("Tu email es ${this.email}"),
    );
  }

  List<DropdownMenuItem<String>> _regresarItems() {
    List<DropdownMenuItem<String>> lista = new List();

    this.poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }
}
