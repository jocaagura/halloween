import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../entities.dart';
import '../services/service_camera.dart';
import '../ui/pages/main_activity_page.dart';
import 'bloc_central.dart';

class BlocCamera extends Bloc {
  final _serviceCamera = ServiceCamera();
  final key = 'cameraPermission';
  final _fileKey = 'file';

  BlocCamera() {
    setValue(key, false);
    setValue<XFile?>(_fileKey, null);
  }

  bool _isRecording = false;

  bool get isRecording => _isRecording;

  Stream<bool> get isCameraGrantedStream => getStream(key) as Stream<bool>;

  Stream<XFile?> get xFileStream => getStream(_fileKey) as Stream<XFile?>;

  Future<bool> _isCameraGranted() async {
    bool isCameraGrantedTmp = await _serviceCamera.requestPermission();
    setValue(key, isCameraGrantedTmp);
    return isCameraGrantedTmp;
  }

  Future<void> requestCameraPermission(BuildContext context) async {
    if (await _isCameraGranted()) {
      blocCentral.video.initializeYTPlayerController();
      blocCentral.video.listenPlayerState(context);
      blocCentral.router.routeTo(context, const MainActivityPage());
    }
  }

  Future<void> startVideoRecording() async {
    _isRecording = true;
    await _serviceCamera.startVideoRecording();
  }

  Future<XFile> stopVideoRecording() async {
    _isRecording = false;
    final xFile = await _serviceCamera.stopVideoRecording();
    setValue(_fileKey, xFile);
    return xFile;
  }
}
