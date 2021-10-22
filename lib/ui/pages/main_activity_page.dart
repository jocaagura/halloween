import 'package:flutter/material.dart';
import 'package:halloween/ui/pages/finish_activity_page.dart';

import '../../blocs/bloc_central.dart';
import '../../helpers.dart';
import '../widgets/image_asset_positioned_widget.dart';
import '../widgets/responsive_widget.dart';

class MainActivityPage extends StatelessWidget {
  const MainActivityPage({Key? key}) : super(key: key);

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
    return Center(
      child: Text(blocCentral.sesion.sesionEmail),
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

    /// sizes of assets
    final minBaseNumber = returnMinDouble(size.width, size.height);
    final sizeAsset = minBaseNumber * 0.4;
    final sizeAsset2 = sizeAsset * 0.5;
    const String assetImage = "assets/4.png";
    const String assetImage2 = "assets/3.png";
    final double top = size.height * 0.05;
    final double left = size.width * 0.5 - (sizeAsset * 0.5);
    final double left2 = size.width * 0.5 - (sizeAsset2 * 0.5);
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
            child: InkWell(
                onTap: () {
                  blocCentral.router
                      .routeTo(context, const FinishActivityPage());
                },
                child: const Text("Aqui reproducimos el video")),
          ),
        ),

        /// SpiderWeb
        ImageAssetPositionedWidget(
            sizeAsset: sizeAsset2,
            top: top,
            left: left2,
            assetImage: assetImage2),

        /// Spider
        ImageAssetPositionedWidget(
            sizeAsset: sizeAsset, top: top, left: left, assetImage: assetImage),
      ],
    );
  }
}
