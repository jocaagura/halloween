import 'package:flutter/material.dart';

import '../entities.dart';

class BlocTheme extends Bloc {
  final ThemeData _themeData =
      ThemeData(primarySwatch: Colors.purple, fontFamily: "Poppins");
  final kColors = const <Color>[
    Color.fromRGBO(14, 6, 20, 1.0),
    Color.fromRGBO(47, 25, 79, 1.0),
    Color.fromRGBO(77, 36, 141, 1.0),
    Color.fromRGBO(97, 45, 173, 1.0),
    Color.fromRGBO(156, 82, 214, 1.0),
    Color.fromRGBO(196, 158, 255, 1.0),
    Color.fromRGBO(255, 255, 255, 1.0),
  ];

  BlocTheme() {
    addStreamController<String, ThemeData>("theme", _themeData);
  }

  Stream<ThemeData>? get themeStream =>
      getStream<ThemeData>("theme") as Stream<ThemeData>?;
}
