import 'package:flutter/services.dart';
import 'package:flutter_19_1/ffi_bridge.dart';

class PlatformServiceImpl implements PlatformService {
  static const stream = EventChannel("Call_Events");
  final _bridge = FFIBridge();

  int getValue() {
    try {
      return _bridge.getCValue();
    } on PlatformException catch (e) {
      print("Failed to get value: '${e.message}'.");
      return 0;
    }
  }

  @override
  Stream<int> getStream() =>
      stream.receiveBroadcastStream().map((event) => event as int);

  @override
  int getValue_s(String s) {
    try {
      return _bridge.get_value_s(s);
    } on PlatformException catch (e) {
      print("Failed to get value: '${e.message}'.");
      return 0;
    }
  }
}

abstract class PlatformService {
  int getValue();
  int getValue_s(String s);
  Stream<int> getStream();
}

PlatformService getService() {
  return PlatformServiceImpl();
}
