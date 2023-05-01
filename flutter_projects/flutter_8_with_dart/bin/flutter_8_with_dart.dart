import 'package:flutter_8_with_dart/flutter_8_with_dart.dart'
    as flutter_8_with_dart;

void main(List<String> arguments) {
  return asyncApi();
}

void asyncApi() async {
  print("START PROGRAMM");
  try {
    var data = await getData(3);
    print(data);
  } catch (e) {
    print(e);
  } finally {
    print("Еууууууу !!");
  }
  print("FINISH PROGRAMM");
}

void futureApi() {
  print("START PROGRAMM");

  getData(1).then((value) {
    print(value);
  }).catchError((error) {
    print(error);
  }).whenComplete(() {
    print('Еу я тут');
  });

  print("FINISH PROGRAMM");
}

Future<List<String>> getData([int delay = 1]) {
  return Future.delayed(
    Duration(seconds: delay),
    () {
      if (delay > 2) return Future.error("Задержка больше 2 секунд");
      return ['Superman', 'Batman', 'Spiderman'];
    },
  );
}
