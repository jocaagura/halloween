import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';
import '../../helpers.dart';
import '../widgets/image_asset_positioned_widget.dart';
import '../widgets/responsive_widget.dart';

class InstructionsPage extends StatelessWidget {
  const InstructionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
        mobileWidget: _MobileVersion(), desktopWidget: _DesktopVersion());
  }
}

class _MobileVersion extends StatelessWidget {
  const _MobileVersion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = (size.width).clamp(100, 320);
    final double width2 = width * 0.65;
    final double height = size.height * 0.7;
    final double sizeFont = (size.width * 0.035).clamp(8, 30);
    final double sizeFont2 = (size.width * 0.025).clamp(8, 26);

    /// sizes of assets
    final minBaseNumber = returnMinDouble(size.width, size.height);
    final sizeAsset = minBaseNumber * 0.35;
    const String assetImage = "assets/5.png";
    final double top = size.height * 0.0075;
    final double left = size.width * 0.5 - (sizeAsset * 0.5);
    final TextStyle style =
        TextStyle(fontSize: sizeFont2, color: blocCentral.theme.kColors.last);
    return Stack(
      children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            width: width,
            height: height,
            padding: EdgeInsets.all(sizeFont * 0.8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Theme.of(context).canvasColor,
                  width: 2.0,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(),
                Container(
                  width: width * 0.7,
                  height: height * 0.35,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/9.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: width2,
                  child: Text(
                    "1. Asegurate de darnos los permisos de camára en tu navegador para poder jugar.",
                    style: style,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  width: width2,
                  child: Text(
                    "2. Cuando estes listo presiona continuar.",
                    style: style,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  width: width2,
                  child: Text(
                    "3. No necesitas más instrucciones solo sigue tu instinto.",
                    style: style,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const _ContinueButtonWidget(),
              ],
            ),
          ),
        ),

        /// pumpkin head
        ImageAssetPositionedWidget(
            sizeAsset: sizeAsset, top: top, left: left, assetImage: assetImage)
      ],
    );
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
    final double sizeFont2 = (size.width * 0.015).clamp(8, 16);

    /// sizes of assets
    final minBaseNumber = returnMinDouble(size.width, size.height);
    final sizeAsset = minBaseNumber * 0.3;
    const String assetImage = "assets/5.png";
    final double top = size.height * 0.105;
    final double left = size.width * 0.5 - (sizeAsset * 0.5);
    final TextStyle style =
        TextStyle(fontSize: sizeFont2, color: blocCentral.theme.kColors.last);
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
                      child: Image.asset(
                        "assets/9.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        width: width * 0.49,
                        height: height * 0.9,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: sizeFont * 1.8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "1. Asegurate de darnos los permisos de camára en tu navegador para poder jugar.",
                              style: style,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "2. Cuando estes listo presiona continuar.",
                              style: style,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "3. Ponte tus audífonos y asegúrate de que el sonido esté funcionando bien.",
                              style: style,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "4. No necesitas más instrucciones solo sigue tu instinto.",
                              style: style,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const _ContinueButtonWidget()
                          ],
                        )),
                  ],
                )
              ],
            ),
          ),
        ),

        /// pumpkin head
        ImageAssetPositionedWidget(
            sizeAsset: sizeAsset, top: top, left: left, assetImage: assetImage)
      ],
    );
  }
}

class _ContinueButtonWidget extends StatelessWidget {
  const _ContinueButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: blocCentral.sesion.sesionEmailStream,
        builder: (context, snapshot) {
          String _email = snapshot.data ?? "";
          return ElevatedButton(
              onPressed: validarEmail(_email)
                  ? () {
                      blocCentral.camera
                          .requestCameraPermission(
                              context);
                    }
                  : null,
              child: const Text("Continuar"));
        });
  }
}
