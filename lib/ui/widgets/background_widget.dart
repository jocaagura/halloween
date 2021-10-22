import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      alignment: Alignment.center,
      color: blocCentral.theme.kColors[0],
      child: Stack(
        children: [
          Image.asset(
            'assets/background.jpg',
            alignment: Alignment.center,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
