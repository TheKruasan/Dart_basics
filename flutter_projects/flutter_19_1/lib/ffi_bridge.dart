import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

typedef SimpleFunction = Int16 Function();
typedef SimpleFunctionDart = int Function();
typedef SimpleFunctionS = Int16 Function(Pointer<Utf8> s);
typedef SimpleFunctionDartS = int Function(Pointer<Utf8> s);

class FFIBridge {
  late SimpleFunctionDart _getCValue;
  late SimpleFunctionDartS _get_value_s;
  FFIBridge() {
    final dl = Platform.isAndroid
        ? DynamicLibrary.open('libsimple.so')
        : DynamicLibrary.process();
    _getCValue =
        dl.lookupFunction<SimpleFunction, SimpleFunctionDart>("get_value");
    _get_value_s =
        dl.lookupFunction<SimpleFunctionS, SimpleFunctionDartS>("get_value_s");
  }
  int getCValue() => _getCValue();
  int get_value_s(String s) {
    var sc = s.toNativeUtf8();
    return _get_value_s(sc);
  }
}
