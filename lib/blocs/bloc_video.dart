import 'dart:async';

import 'package:flutter/material.dart';
import 'package:halloween/ui/pages/finish_activity_page.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../entities.dart';
import 'bloc_central.dart';

class BlocVideo extends Bloc {
  final ytController = YoutubePlayerController(
    initialVideoId: 'COd37qgfwcc',
    params: const YoutubePlayerParams(
      autoPlay: true,
      desktopMode: true,
      enableKeyboard: false,
      showControls: false,
      showVideoAnnotations: false,
    ),
  );

  VideoPlayerController? _fileVideoController;
  StreamSubscription<dynamic>? _subscription;
  Future<void>? _fileVideoInitialized;

  Future<void>? get fileVideoInitialized => _fileVideoInitialized;

  void listenPlayerState(BuildContext context) {
    _subscription?.cancel();

    _subscription = ytController.stream.listen((event) async {
      if (event.playerState == PlayerState.playing &&
          !blocCentral.camera.isRecording) {
        blocCentral.camera.startVideoRecording();
      }

      if (event.playerState == PlayerState.ended &&
          blocCentral.camera.isRecording) {
        final xFile = await blocCentral.camera.stopVideoRecording();
        // no se puse usar el VideoPlayerController con el file del
        // video de la cámar
        // _fileVideoController = VideoPlayerController.network(xFile.path);
        // _fileVideoInitialized = _fileVideoController?.initialize();
        debugPrint('''BlocVideo/stopVideoRecording:
        Recorded video from camera
        path: ${xFile.path}
        mimeType: ${xFile.mimeType}
        name: ${xFile.name}
        ''');
        blocCentral.router.routeTo(context, const FinishActivityPage());
      }
    });
  }
}
