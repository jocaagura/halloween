import 'dart:async';
import 'dart:math';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:halloween/models/model_storage.dart';
import 'package:halloween/services/service_storage.dart';
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
  static const _kStorageModel = "video";

  BlocVideo() {
    addStreamController<String, ModelStorage>(_kStorageModel, ModelStorage());
    ytController = YoutubePlayerController(
      initialVideoId: 'COd37qgfwcc',
      params: const YoutubePlayerParams(
        autoPlay: true,
        desktopMode: true,
        enableKeyboard: false,
        showControls: false,
        showVideoAnnotations: false,
      ),
    );
  }

  Stream<ModelStorage?> get videoStream =>
      getStream(_kStorageModel) as Stream<ModelStorage?>;


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
        // Creamos el modelo para guardado en la base de datos

        final ModelStorage videoStorage = ModelStorage(
          file: File(xFile.path),
          fileName: blocCentral.sesion.sesionEmail,
          fileType: "video",
          propietario: "pragma_sa",
          size: 1000,
        );

        debugPrint("${videoStorage.toJson()}");
        setValue<ModelStorage>(_kStorageModel, videoStorage);

        ServiceStorage.saveVideo(xFile, blocCentral.sesion.sesionEmail)
            .then((value) {
          debugPrint("Salvado en firebase");
          setValue<ModelStorage>(_kStorageModel, value);
        });

        blocCentral.router.routeTo(context, const FinishActivityPage());
      }
    });
  }
}
