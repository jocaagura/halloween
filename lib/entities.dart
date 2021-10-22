import 'package:rxdart/rxdart.dart';

abstract class Bloc {
  final Map<String, BehaviorSubject<dynamic>> _streamControllers = {};

  addStreamController<String, T>(key, T initialData) {
    final type = initialData.runtimeType;
    if (_streamControllers[key] == null && type == T) {
      final behaviorSubject = BehaviorSubject<T>()..sink.add(initialData);
      _streamControllers[key] = behaviorSubject;
    }
  }

  removeStreamController(String key) {
    if (_streamControllers[key] == null) {
      _streamControllers[key]?.close();
      _streamControllers.remove(key);
    }
  }

  Stream<dynamic>? getStream<T>(String key) {
    return _streamControllers[key] as Stream<T>?;
  }

  dynamic getValue(String key) {
    _streamControllers[key]?.valueOrNull;
  }

  setValue<T>(String key, T value) {
    if(!_streamControllers.containsKey(key)){
      addStreamController(key, value);
    }else if (_streamControllers[key] != null) {
      _streamControllers[key]?.sink.add(value);
    }
  }
  setError(String key, String errorMessage) {
    if (_streamControllers[key] != null) {
      _streamControllers[key]?.addError(errorMessage);
    }
  }

  String? getError(String key){
    return _streamControllers[key]?.error.toString();
  }
  dispose() {
    if (_streamControllers.isNotEmpty) {
      _streamControllers.forEach((key, value) {
        _streamControllers[key]?.close();
      });
    }
  }
}

abstract class Injector {}
