import 'package:flutter/material.dart';

import '../entities.dart';

class BlocTheme extends Bloc {
    final ThemeData _themeData = ThemeData(primarySwatch: Colors.purple);


    BlocTheme(){
    addStreamController<String, ThemeData>("theme", _themeData);
  }


  Stream<ThemeData>? get themeStream => getStream<ThemeData>("theme") as Stream<ThemeData>?;
}



