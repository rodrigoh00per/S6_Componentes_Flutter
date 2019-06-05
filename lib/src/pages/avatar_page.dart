import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8),
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp6kmTNEXaDa_r3pQ9NiQOpbZcy0G_ekyzC28QwyIVh5QYfx8FAw"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 8),
            child: CircleAvatar(
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI2bB7JWGVSBBuj37GGS_XRY0Rv_wT5J1fqxQn5MQIkjWgZVAHnw"),
          placeholder: AssetImage("assets/jar-loading.gif"),
        ),
      ),
    );
  }
}
