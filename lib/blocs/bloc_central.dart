import '../entities.dart';
import 'bloc_size_screen.dart';
import 'bloc_theme.dart';

class BlocCentral extends Bloc {
  /// we use this bloc as dependency injector
  /// this bloc only can be intanciated once in the app
  final theme = BlocTheme();
  final size = BlocSize();
}

final blocCentral = BlocCentral();
