import '../entities.dart';
import '../helpers.dart';

class BlocSesion extends Bloc {
  static const _kEmail = "sesionEmail";

  BlocSesion() {
    addStreamController<String, String>(_kEmail, "");
  }

  Stream<String>? get sesionEmailStream =>
      getStream<String>(_kEmail) as Stream<String>?;

  set sesionEmail(String email) {
    if (validarEmail(email)) {
      setValue(_kEmail, email);
    } else {
      setError("Error:", "Correo invalido");
    }
  }

  String get sesionEmail => getValue(_kEmail) as String;

  String? get errorStream => getError(_kEmail);
}
