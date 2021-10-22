import '../entities.dart';
import 'bloc_camera.dart';
import 'bloc_routing.dart';
import 'bloc_sesion.dart';
import 'bloc_size_screen.dart';
import 'bloc_theme.dart';

class BlocCentral extends Bloc {
  /// we use this bloc as dependency injector
  /// this bloc only can be intanciated once in the app
  final theme = BlocTheme();
  final size = BlocSize();
  final sesion = BlocSesion();
  final router = BlocRouting();
  final camera = BlocCamera();
}

final blocCentral = BlocCentral();
