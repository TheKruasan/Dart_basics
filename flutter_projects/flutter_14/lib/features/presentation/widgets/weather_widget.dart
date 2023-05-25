import 'package:flutter/material.dart';
// import 'package:flutter_14/features/domain/entities/weather_entity.dart';

class WeatherPainter extends CustomPainter {
  double state;

  WeatherPainter({required this.state});

  @override
  void paint(Canvas canvas, Size size) {
    final sunPainter = Paint()
      ..color = Colors.yellow.withOpacity(_getSunOpacity(state))
      ..style = PaintingStyle.fill;
    final cloudPainter = Paint()
      ..color = _getCloudColor(state).withOpacity(_getCloudOpacity(state))
      ..style = PaintingStyle.fill;
    final raindropsPainter = Paint()
      ..color = Colors.blue.withOpacity(_getRaindropOpacity(state))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double x = 300;
    double y = 80;
    canvas.drawCircle(Offset(x, y), _getSunRadius(state), sunPainter);

    canvas.drawCircle(Offset(x - 50, y + 30), 30, cloudPainter);
    canvas.drawCircle(Offset(x - 10, y + 30), 40, cloudPainter);
    canvas.drawCircle(Offset(x + 30, y + 30), 30, cloudPainter);

    canvas.drawLine(
        Offset(x + 30, y + 80), Offset(x + 20, y + 100), raindropsPainter);
    canvas.drawLine(
        Offset(x + 10, y + 80), Offset(x, y + 100), raindropsPainter);
    canvas.drawLine(
        Offset(x - 10, y + 80), Offset(x - 20, y + 100), raindropsPainter);
    canvas.drawLine(
        Offset(x - 30, y + 80), Offset(x - 40, y + 100), raindropsPainter);
    canvas.drawLine(
        Offset(x - 50, y + 80), Offset(x - 60, y + 100), raindropsPainter);
  }

  @override
  bool shouldRepaint(WeatherPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(WeatherPainter oldDelegate) => false;

  double _getSunRadius(double state) {
    if (state == 0) {
      return 60;
    }
    if (state == 0.1) {
      return 55;
    }
    if (state == 0.2) {
      return 50;
    }
    return 45;
  }

  double _getSunOpacity(double state) {
    if (state < 1) {
      return 1;
    } else {
      return 0;
    }
  }

  Color _getCloudColor(state) {
    if (state == 0.3) {
      return const Color.fromARGB(0, 178, 172, 172);
    }
    if (state == 0.4) {
      return const Color.fromARGB(0, 153, 149, 149);
    }
    if (state == 0.5) {
      return const Color.fromARGB(0, 125, 120, 120);
    }
    if (state == 0.6) {
      return const Color.fromARGB(0, 90, 87, 87);
    }
    if (state == 0.7) {
      return const Color.fromARGB(0, 81, 77, 77);
    }
    if (state == 0.8) {
      return const Color.fromARGB(0, 73, 71, 71);
    }
    if (state == 0.9) {
      return const Color.fromARGB(0, 60, 58, 58);
    }
    if (state == 1) {
      return const Color.fromARGB(0, 33, 32, 32);
    }
    return const Color(0x00000000);
  }

  double _getCloudOpacity(double state) {
    if (state <= 0.2) {
      return 0;
    } else {
      return 1;
    }
  }

  double _getRaindropOpacity(double state) {
    if (state < 1) {
      return 0;
    } else {
      return 1;
    }
  }
}

class WeatherPainterBig extends CustomPainter {
  double state;

  WeatherPainterBig({required this.state});

  @override
  void paint(Canvas canvas, Size size) {
    final sunPainter = Paint()
      ..color = Colors.yellow.withOpacity(_getSunOpacityB(state))
      ..style = PaintingStyle.fill;
    final cloudPainter = Paint()
      ..color = _getCloudColorB(state).withOpacity(_getCloudOpacityB(state))
      ..style = PaintingStyle.fill;
    final raindropsPainter = Paint()
      ..color = Colors.blue.withOpacity(_getRaindropOpacityB(state))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double x = 300;
    double y = 80;
    double dx = -70;
    double dy = 80;
    canvas.drawCircle(
        Offset(x + dx, y + dy), _getSunRadiusB(state), sunPainter);

    canvas.drawCircle(Offset(x - 70 + dx, y + 50 + dy), 55, cloudPainter);
    canvas.drawCircle(Offset(x - 10 + dx, y + 50 + dy), 70, cloudPainter);
    canvas.drawCircle(Offset(x + 50 + dx, y + 50 + dy), 55, cloudPainter);

    canvas.drawLine(Offset(x + 30 + dx, y + 140 + dy),
        Offset(x + 20 + dx, y + 160 + dy), raindropsPainter);
    canvas.drawLine(Offset(x + 10 + dx, y + 140 + dy),
        Offset(x + dx, y + 160 + dy), raindropsPainter);
    canvas.drawLine(Offset(x - 10 + dx, y + 140 + dy),
        Offset(x - 20 + dx, y + 160 + dy), raindropsPainter);
    canvas.drawLine(Offset(x - 30 + dx, y + 140 + dy),
        Offset(x - 40 + dx, y + 160 + dy), raindropsPainter);
    canvas.drawLine(Offset(x - 50 + dx, y + 140 + dy),
        Offset(x - 60 + dx, y + 160 + dy), raindropsPainter);
    canvas.drawLine(Offset(x - 70 + dx, y + 140 + dy),
        Offset(x - 80 + dx, y + 160 + dy), raindropsPainter);

    canvas.drawLine(Offset(x + 50 + dx, y + 140 + dy),
        Offset(x + 40 + dx, y + 160 + dy), raindropsPainter);
  }

  @override
  bool shouldRepaint(WeatherPainterBig oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(WeatherPainterBig oldDelegate) => false;

  double _getSunRadiusB(double state) {
    if (state == 0) {
      return 100;
    }
    if (state == 0.1) {
      return 90;
    }
    if (state == 0.2) {
      return 85;
    }
    return 80;
  }

  double _getSunOpacityB(double state) {
    if (state < 1) {
      return 1;
    } else {
      return 0;
    }
  }

  Color _getCloudColorB(state) {
    if (state == 0.3) {
      return const Color.fromARGB(0, 178, 172, 172);
    }
    if (state == 0.4) {
      return const Color.fromARGB(0, 153, 149, 149);
    }
    if (state == 0.5) {
      return const Color.fromARGB(0, 125, 120, 120);
    }
    if (state == 0.6) {
      return const Color.fromARGB(0, 90, 87, 87);
    }
    if (state == 0.7) {
      return const Color.fromARGB(0, 81, 77, 77);
    }
    if (state == 0.8) {
      return const Color.fromARGB(0, 73, 71, 71);
    }
    if (state == 0.9) {
      return const Color.fromARGB(0, 60, 58, 58);
    }
    if (state == 1) {
      return const Color.fromARGB(0, 33, 32, 32);
    }
    return const Color(0x00000000);
  }

  double _getCloudOpacityB(double state) {
    if (state <= 0.2) {
      return 0;
    } else {
      return 1;
    }
  }

  double _getRaindropOpacityB(double state) {
    if (state < 1) {
      return 0;
    } else {
      return 1;
    }
  }
}
