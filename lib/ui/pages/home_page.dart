import 'package:flutter/material.dart';
import 'package:halloween/ui/widgets/responsive_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
        mobileWidget: Center(
          child: Text("Movil"),
        ),
        desktopWidget: Center(
          child: Text("Desktop"),
        ));
  }
}
