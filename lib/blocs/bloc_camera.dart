import '../entities.dart';

class BlocCamera extends Bloc {
  BlocCamera() {
    setValue('cameraPermission', false);
  }

  Stream<bool> get isCameraGrantedStream =>
      getStream('cameraPermission') as Stream<bool>;

  bool get isCameraGranted => getValue('cameraPermission');

  set isCameraGranted(bool isGranted) {
    setValue<bool>('cameraPermission', isGranted);
  }


  requestCameraPermission(){
    /// todo request user camera permission

  }
}
