import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String nombre = "";
  String email = "";
  String password = "";
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

  Widget _crearPersona() {
    return ListTile(
      title: Text("Tu nombre es ${this.nombre}"),
      subtitle: Text("Tu email es ${this.email}"),
    );
  }
}
