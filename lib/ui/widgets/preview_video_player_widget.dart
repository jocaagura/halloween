import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:halloween/models/model_storage.dart';
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

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ModelStorage?>(
        stream: blocCentral.video.videoStream,
        builder: (context, snapshot) {
          final xfile = snapshot.data;
          if (xfile?.url == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            _startVideoNetwork(xfile!.url!);
          }
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: blocCentral.theme.kColors.last)),
            width: widget.width,
            height: widget.height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: VideoPlayer(videoController!)
            ),
          );
        });
  }

  Future<void> _startVideoPlayer(XFile xfile) async {
    if (kIsWeb) {
      videoController = VideoPlayerController.network(xfile.path);
    } else {
      videoController = VideoPlayerController.file(File(xfile.path));
    }

    await videoController!.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized,
      // even before the play button has been pressed.
      setState(() {});
    });
    await videoController!.play();
  }

  Future<void> _startVideoNetwork(String url) async {
    videoController = VideoPlayerController.network(url);
    videoController!.initialize().then((_) async {
      // Ensure the first frame is shown after the video is initialized,
      // even before the play button has been pressed.
      setState(() {});
      await videoController!.play();
    });
  }
}
