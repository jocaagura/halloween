
import 'package:camera/camera.dart';
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

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<XFile?>(
        stream: blocCentral.camera.xFileStream,
        builder: (context, snapshot) {
          final xfile = snapshot.data;
          if (xfile == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          _startVideoPlayer(xfile);
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: blocCentral.theme.kColors.last)),
            width: widget.width,
            height: widget.height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
                child: VideoPlayer(videoController!),
            ),
          );
        });
  }

  Future<void> _startVideoPlayer(XFile xfile) async {

    videoController = VideoPlayerController.network(xfile.path);
    await videoController!.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized,
      // even before the play button has been pressed.
      setState(() {});
    });
    await videoController!.play();
  }
}
