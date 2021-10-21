import 'package:flutter/material.dart';
import '../../data_types.dart';

import '../../blocs/bloc_central.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget(
      {Key? key, required this.mobileWidget, required this.desktopWidget})
      : super(key: key);

  final Widget mobileWidget, desktopWidget;

  @override
  Widget build(BuildContext context) {
    /// set the size of screen to another responsive widgets

    return Scaffold(
      body: blocCentral.size.screenType(MediaQuery.of(context).size.width) == ScreenType.mobile
          ? mobileWidget
          : desktopWidget,
    );
  }
}
