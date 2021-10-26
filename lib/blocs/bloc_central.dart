import '../entities.dart';
import 'bloc_camera.dart';
import 'bloc_routing.dart';
import 'bloc_sesion.dart';
import 'bloc_size_screen.dart';
import 'bloc_theme.dart';
import 'bloc_video.dart';

class BlocCentral extends Injector {
  /// we use this bloc as dependency injector
  /// this [BlocCentral] only would be intanciated once in the app
  final theme = BlocTheme();
  final size = BlocSize();
  final sesion = BlocSesion();
  final router = BlocRouting();
  final camera = BlocCamera();
  final video = BlocVideo();
}

final blocCentral = BlocCentral();
