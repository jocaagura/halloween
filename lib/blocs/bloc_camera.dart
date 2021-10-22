import 'package:halloween/services/service_camera.dart';

import '../entities.dart';

class BlocCamera extends Bloc {
  final _serviceCamera = ServiceCamera();
  final key = 'cameraPermission';

  BlocCamera() {
    setValue(key, false);
  }

  Stream<bool> get isCameraGrantedStream => getStream(key) as Stream<bool>;

  bool get isCameraGranted => _isCameraGranted();

  set isCameraGranted(bool isGranted) {
    setValue<bool>(key, isGranted);
  }

  bool _isCameraGranted() {
    bool isCameraGrantedTmp = _serviceCamera.isPermissionGranted();
    setValue(key, isCameraGrantedTmp);
    return isCameraGrantedTmp;
  }

  requestCameraPermission() {
    /// todo request user camera permission
  }
}
