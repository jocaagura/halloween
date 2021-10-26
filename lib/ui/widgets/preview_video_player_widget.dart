import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../blocs/bloc_central.dart';

class PreviewVideoPlayerWidget extends StatefulWidget {
  const PreviewVideoPlayerWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  State<PreviewVideoPlayerWidget> createState() =>
      _PreviewVideoPlayerWidgetState();
}

class _PreviewVideoPlayerWidgetState extends State<PreviewVideoPlayerWidget> {
  VideoPlayerController? videoController;
  late StreamSubscription videoListener;

  @override
  void dispose() {
    videoController?.dispose();
    videoListener.cancel();
    super.dispose();
  }

  @override
  void initState() {
    if (blocCentral.camera.isRecording) {
      blocCentral.camera.stopVideoRecording();
    }
    super.initState();
    videoListener = blocCentral.video.videoStream.listen((event) {
      final xfile = event;
      if (xfile?.url != null) {
        _startVideoNetwork(xfile!.url!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: blocCentral.theme.kColors.last)),
      width: widget.width,
      height: widget.height,
      alignment: Alignment.center,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: (videoController?.value.isInitialized == true)
              ? VideoPlayer(videoController!)
              : const CircularProgressIndicator()),
    );
  }

  Future<void> _startVideoNetwork(String url) async {
    videoController = VideoPlayerController.network(url)
      ..initialize().then((_) async {
        // Ensure the first frame is shown after the video is initialized,
        // even before the play button has been pressed.
        setState(() {
          _playVideo();
        });
      });
  }

  _playVideo() async {
    if (videoController?.value.isInitialized != true) {
      await Future.delayed(const Duration(seconds: 1));
    }
    await videoController!.play();

    if (videoController?.value.isInitialized == true) {
      setState(() {});
      await videoController!.play();
    }
  }
}
