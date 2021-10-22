import 'package:flutter/material.dart';

import 'blocs/bloc_central.dart';
import 'ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late BlocCentral _blocCentral;

  @override
  void initState() {
    super.initState();
    _blocCentral = blocCentral;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _blocCentral.theme.themeStream,
        builder: (context, AsyncSnapshot snapshot) {
          ThemeData themeData = ThemeData(primarySwatch: Colors.orange);
          if (snapshot.data.runtimeType == ThemeData) {
            themeData = snapshot.data;
          }

          return MaterialApp(
            title: 'Halloween app',
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: const MyHomePage(),
          );
        });
  }
}
