import 'package:flutter/material.dart';
import 'package:s6_componentes_flutter/src/pages/alert_page.dart';
import 'package:s6_componentes_flutter/src/pages/animated_container.dart';
import 'package:s6_componentes_flutter/src/pages/avatar_page.dart';
import 'package:s6_componentes_flutter/src/pages/cards_page.dart';
import 'package:s6_componentes_flutter/src/pages/home_page.dart';
import 'package:s6_componentes_flutter/src/pages/input_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "home": (BuildContext context) => HomePage(),
    "alert": (BuildContext context) => AlertPage(),
    "avatar": (BuildContext context) => AvatarPage(),
    "cards": (BuildContext context) => CardsPage(),
    "animatedContainer": (BuildContext context) => AnimatedContainerPage(),
    "input": (BuildContext context) => InputPage()
  };
}
