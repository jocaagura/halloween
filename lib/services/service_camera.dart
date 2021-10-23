import 'package:camera/camera.dart';

class ServiceCamera {
  CameraController? _controller;

  Future<bool> requestPermission() async {
    try {
      final cameras = await availableCameras();

      if (cameras.isEmpty) {
        throw CameraException('404', 'Camera not found');
      }

      _controller = CameraController(cameras[0], ResolutionPreset.max);
      await _controller!.initialize();
      return true;
    } on CameraException {
      return false;
    }
  }

  Future<void> startVideoRecording() async {
    await _controller!.prepareForVideoRecording();
    await _controller!.startVideoRecording();
  }

  Future<XFile> stopVideoRecording() async {
    final xFile = await _controller!.stopVideoRecording();
    await _controller!.dispose();
    return xFile;
  }
}
