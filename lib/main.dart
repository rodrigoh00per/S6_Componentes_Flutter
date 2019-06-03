import 'package:flutter/material.dart';
import 'package:s6_componentes_flutter/src/pages/alert_page.dart';
import 'package:s6_componentes_flutter/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      /* home: HomePageTemp()); */
      /*     home: HomePage(), */
      initialRoute: "home",
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => AlertPage());
      },
    );
  }
}
