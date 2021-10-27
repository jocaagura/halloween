import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
    final size = MediaQuery.of(context).size;
    final double width = (size.width).clamp(100, 400);
    final double height = size.height * 0.5;

    /// sizes of assets
    final minBaseNumber = returnMinDouble(size.width, size.height);
    final sizeAsset = minBaseNumber * 0.25;
    final sizeAsset2 = sizeAsset * 1.45;
    const String assetImage = "assets/4.png";
    const String assetImage2 = "assets/3.png";
    final double top = size.height * 0.015;
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
            child: _VideoYoutubePlayer(width: width, height: height),
          ),
        ),

        /// SpiderWeb
        ImageAssetPositionedWidget(
            sizeAsset: sizeAsset,
            top: top,
            left: left,
            assetImage: assetImage2),

        /// Spider
        ImageAssetPositionedWidget(
            sizeAsset: sizeAsset2,
            top: top,
            left: left2,
            assetImage: assetImage),
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
              ),
            ),
            child: _VideoYoutubePlayer(width: width, height: height),
          ),
        ),

        /// SpiderWeb
        Bounce(
          duration: const Duration(milliseconds: 2250),
          infinite: true,
          from: 10.0,
          child: ImageAssetPositionedWidget(
            sizeAsset: sizeAsset2,
            top: top,
            left: left2,
            assetImage: assetImage2,
          ),
        ),

        /// Spider
        ZoomIn(
          duration: const Duration(milliseconds: 250),
          child: ImageAssetPositionedWidget(
            sizeAsset: sizeAsset,
            top: top * 2,
            left: left,
            assetImage: assetImage,
          ),
        ),
      ],
    );
  }
}

class _VideoYoutubePlayer extends StatelessWidget {
  const _VideoYoutubePlayer({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: YoutubePlayerIFrame(
        controller: blocCentral.video.ytController,
        aspectRatio: width / height,
      ),
    );
  }
}
