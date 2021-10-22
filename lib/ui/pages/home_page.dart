import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';
import '../../helpers.dart';
import '../widgets/image_asset_positioned_widget.dart';
import '../widgets/input_email_widget.dart';
import '../widgets/responsive_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
        mobileWidget: _MobileVersion(), desktopWidget: _DesktopVersion());
  }
}

class _DesktopVersion extends StatelessWidget {
  const _DesktopVersion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = (size.width).clamp(400, 800);
    final double height = size.height * 0.5;
    final double sizeFont = (size.width * 0.035).clamp(8, 32);

    /// sizes of assets
    final minBaseNumber = returnMinDouble(size.width, size.height);
    final sizeMoon = minBaseNumber * 0.3;
    const String assetMoon = "assets/2.png";
    final double top = size.height * 0.105;
    final double left = size.width * 0.5 - (sizeMoon * 0.5);
    return Stack(
      children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Theme.of(context).canvasColor,
                  width: 2.0,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width * 0.49,
                      height: height * 0.9,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(sizeFont * 0.8),
                      child: Text(
                        "Debes verificar tu identidad para continuar",
                        style: TextStyle(
                          fontSize: sizeFont,
                          color: blocCentral.theme.kColors.last,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                        width: width * 0.49,
                        height: height * 0.9,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: sizeFont *1.8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const InputEmailWidget(),
                            const SizedBox(
                              height: 10.0,
                            ),
                            StreamBuilder<String>(
                                stream: blocCentral.sesion.sesionEmailStream,
                                builder: (context, snapshot) {
                                  String _email = snapshot.data ?? "";
                                  return ElevatedButton(
                                      onPressed: validarEmail(_email)
                                          ? () {
                                              print(_email);
                                            }
                                          : null,
                                      child: const Text("Siguiente"));
                                })
                          ],
                        )),
                  ],
                )
              ],
            ),
          ),
        ),

        /// murcielago uno
        ImageAssetPositionedWidget(
            sizeAsset: sizeMoon, top: top, left: left, assetImage: assetMoon)
      ],
    );
  }
}

class _MobileVersion extends StatelessWidget {
  const _MobileVersion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Movil"),
    );
  }
}
