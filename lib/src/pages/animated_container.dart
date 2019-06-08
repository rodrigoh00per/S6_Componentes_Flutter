import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double height = 50.0;
  double width = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
          child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        height: this.height,
        width: this.width,
        decoration:
            BoxDecoration(borderRadius: this._borderRadius, color: this._color),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.extension),
        onPressed: () {
          setState(() {
            final randomNumber = Random();
            this.height = randomNumber.nextInt(300).toDouble();
            this.width = randomNumber.nextInt(300).toDouble();
            this._color = Color.fromRGBO(randomNumber.nextInt(255),
                randomNumber.nextInt(255), randomNumber.nextInt(255), 1);
            this._borderRadius =
                BorderRadius.circular(randomNumber.nextInt(100).toDouble());
          });
        },
      ),
    );
  }
}
