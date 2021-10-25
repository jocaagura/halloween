import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../entities.dart';
import '../ui/pages/finish_activity_page.dart';
import 'bloc_central.dart';

class BlocVideo extends Bloc {
  static const _videos = [
    'DRnVhi5fsIw',
    'HM-E5r6B_tU',
    '6tg_x9i6wR0',
  ];

  late YoutubePlayerController ytController;

  VideoPlayerController? _fileVideoController;
  StreamSubscription<dynamic>? _subscription;
  Future<void>? _fileVideoInitialized;
  final _random = Random();

  Future<void>? get fileVideoInitialized => _fileVideoInitialized;

  void initializeYTPlayerController() {
    final videoIndex = _random.nextInt(_videos.length);
    debugPrint('''BlocVideo/initializeYTPlayerController:
        Initializing random video: $videoIndex
        ''');
    ytController = YoutubePlayerController(
      initialVideoId: _videos[videoIndex],
      params: const YoutubePlayerParams(
        autoPlay: true,
        desktopMode: true,
        enableKeyboard: false,
        showControls: false,
        showVideoAnnotations: false,
      ),
    );
  }

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
