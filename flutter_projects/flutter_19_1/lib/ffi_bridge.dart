import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;

typedef SimpleFunction = Int16 Function();
typedef SimpleFunctionDart = int Function();
typedef SimpleFunctionS = Int16 Function(Pointer<Utf8> s);
typedef SimpleFunctionDartS = int Function(Pointer<Utf8> s);

class FFIBridge {
  late SimpleFunctionDart _getCValue;
  late SimpleFunctionDartS _get_value_s;
  FFIBridge() {
    var libraryPath =
        path.join(Directory.current.path, 'simple_library', 'libsimple.so');

    if (Platform.isWindows) {
      libraryPath = path.join(
          Directory.current.path, 'simple_library', 'Debug', 'simple.dll');
    }
    final dl = DynamicLibrary.open(libraryPath);
    _getCValue =
        dl.lookupFunction<SimpleFunction, SimpleFunctionDart>("get_value");
    _get_value_s =
        dl.lookupFunction<SimpleFunctionS, SimpleFunctionDartS>("get_value_s");

    // _get_value_s =
    //     dl.lookup<NativeFunction<SimpleFunctionS>>('get_value_s').asFunction();
  }

  int getCValue() => _getCValue();
  int get_value_s(String s) {
    var sc = s.toNativeUtf8();
    return _get_value_s(sc);
  }
}
