import 'package:flutter/material.dart';
import 'package:halloween/data_types.dart';

import '../../blocs/bloc_central.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return blocCentral.size.screenType(size.width) == ScreenType.desktop
        ? Container(
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
          )
        : Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: blocCentral.theme.kColors[1],
            ),
            child: FittedBox(
              child: Image.asset(
                'assets/background.jpg',
              ),
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
            ),
          );
  }
}
