import 'package:flutter/material.dart';

import '../../blocs/bloc_central.dart';
import '../../helpers.dart';
import '../widgets/image_asset_positioned_widget.dart';
import '../widgets/info_tab_widget.dart';
import '../widgets/preview_video_player_widget.dart';
import '../widgets/responsive_widget.dart';
import '../widgets/shared_video_button_widget.dart';

class FinishActivityPage extends StatelessWidget {
  const FinishActivityPage({Key? key}) : super(key: key);

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
    final double width = (size.width).clamp(100, 400);
    final double height = size.height * 0.7;
    final double sizeFont = (size.width * 0.026).clamp(8, 26);
    final double sizeFont2 = (size.width * 0.016).clamp(8, 14);

    /// sizes of assets
    final minBaseNumber = returnMinDouble(size.width, size.height);
    final sizeAsset = minBaseNumber * 0.3;
    const String assetImage = "assets/9.png";
    final double top = size.height * 0.025;
    final double top2 = size.height * 0.075;
    final double left = size.width * 0.5 - (sizeAsset * 0.5);
    final TextStyle styleTitle =
        TextStyle(fontSize: sizeFont, color: blocCentral.theme.kColors[5]);
    final TextStyle style =
        TextStyle(fontSize: sizeFont2, color: blocCentral.theme.kColors.last);
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(top: top2, left: (size.width - width) * 0.5),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: height * 0.125,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: blocCentral.theme.kColors.last)),
                width: width * 0.9,
                alignment: Alignment.center,
                height: height * 0.45,
                child: const Text(
                  "Reproducir",
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: width * 0.9,
                height: height * 0.3,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: sizeFont * 1.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoTabWidget(
                        text: "¡Tu reacción fue increible!", style: styleTitle),
                    const SizedBox(
                      height: 5.0,
                    ),
                    InfoTabWidget(
                        text: "Mirala de nuevo para reirte con nosotros.",
                        style: style),
                    const SizedBox(
                      height: 5.0,
                    ),
                    InfoTabWidget(
                      text:
                          "Para participar por el bono, debes publicar el video de tu susto en el grupo Somos Pragma en Workplace con la etiqueta #MiSustoValeLaPena.",
                      style: style,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    InfoTabWidget(
                      text: "Las 2 publicaciones con más likes.",
                      style:
                          style.copyWith(color: blocCentral.theme.kColors[5]),
                    ),
                    InfoTabWidget(
                      text: "serán las ganadoras.",
                      style: style,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: blocCentral.theme.kColors[0],
                          borderRadius: BorderRadius.circular(5.0)),
                      child: ElevatedButton(
                          onPressed: () {
                            /// todo funcion de compartir con el copy designado
                            debugPrint('Compartir');
                          },
                          child: Text(
                            "Compartir",
                            style: style,
                          )),
                    ),
                    const SizedBox(
                      height: 5.0,
                    )
                  ],
                ),
              ),
            ]),
      ),
      Container(
        width: size.width * 0.8,
        height: height * 0.3,
        margin: EdgeInsets.only(left: size.width * 0.1, top: height * 1.1),
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            InfoTabWidget(
              text: "Descubre los ganadores.",
              style: style.copyWith(color: blocCentral.theme.kColors[5]),
            ),
            InfoTabWidget(
              text: "Viernes 29 de octubre.",
              style: style,
            ),
            InfoTabWidget(
              text: "Workplace LIVE",
              style: style,
            ),
            InfoTabWidget(
              text: "1:30 p.m.",
              style: style,
            ),
          ],
        ),
      ),

      /// pumpkin head
      Container(
          decoration: BoxDecoration(
              color: blocCentral.theme.kColors[0],
              borderRadius: BorderRadius.circular(10.0)),
          width: sizeAsset,
          padding: const EdgeInsets.all(10.0),
          margin: EdgeInsets.only(left: left, top: top),
          child: Image.asset(
            assetImage,
            fit: BoxFit.cover,
          ))
    ]);
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
    final double sizeFont = (size.width * 0.02).clamp(8, 22);
    final double sizeFont2 = (size.width * 0.012).clamp(8, 12);

    /// sizes of assets
    final minBaseNumber = returnMinDouble(size.width, size.height);
    final sizeAsset = minBaseNumber * 0.3;
    const String assetImage = "assets/5.png";
    final double top = size.height * 0.105;
    final double left = size.width * 0.5 - (sizeAsset * 0.5);
    final TextStyle styleTitle =
        TextStyle(fontSize: sizeFont, color: blocCentral.theme.kColors[5]);
    final TextStyle style =
        TextStyle(fontSize: sizeFont2, color: blocCentral.theme.kColors.last);
    return Stack(children: [
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              width: width * 0.49,
              height: height * 0.9,
              alignment: Alignment.center,
              padding: EdgeInsets.all(sizeFont * 0.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PreviewVideoPlayerWidget(
                      width: width * 0.49, height: height * 0.4),
                  SizedBox(
                    width: width * 0.49,
                    height: height * 0.25,
                    child: Image.asset(
                      "assets/9.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width * 0.49,
              height: height * 0.9,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: sizeFont * 1.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoTabWidget(
                      text: "¡Tu reacción fue increible!", style: styleTitle),
                  const SizedBox(
                    height: 5.0,
                  ),
                  InfoTabWidget(
                      text: "Mirala de nuevo para reirte con nosotros.",
                      style: style),
                  const SizedBox(
                    height: 5.0,
                  ),
                  InfoTabWidget(
                    text:
                        "Para participar por el bono, debes publicar el video de tu susto en el grupo Somos Pragma en Workplace con la etiqueta #MiSustoValeLaPena.",
                    style: style,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  InfoTabWidget(
                    text: "Las 2 publicaciones con más likes.",
                    style: style.copyWith(color: blocCentral.theme.kColors[5]),
                  ),
                  InfoTabWidget(
                    text: "serán las ganadoras.",
                    style: style,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SharedVideoButtonWidget(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  InfoTabWidget(
                    text: "Descubre los ganadores.",
                    style: style.copyWith(color: blocCentral.theme.kColors[5]),
                  ),
                  InfoTabWidget(
                    text: "Viernes 29 de octubre.",
                    style: style,
                  ),
                  InfoTabWidget(
                    text: "Workplace LIVE",
                    style: style,
                  ),
                  InfoTabWidget(
                    text: "1:30 p.m.",
                    style: style,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),

      /// pumpkin head
      ImageAssetPositionedWidget(
          sizeAsset: sizeAsset, top: top, left: left, assetImage: assetImage)
    ]);
  }
}
