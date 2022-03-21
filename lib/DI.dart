import 'package:injector/injector.dart';
import 'package:marketko_app/api/api_implementation.dart';
import 'package:marketko_app/api/api_interface.dart';

const _useStubs = true;

void _setStubs() {
  final injector = Injector.appInstance;
  injector.registerSingleton<IApi>(() => ApiStubs());
}

void _setRealDependencies() {}

void setDependencies() {
  if (_useStubs) {
    _setStubs();
  } else {
    _setRealDependencies();
  }
}
