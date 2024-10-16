import 'dart:math';

import 'package:flutter/material.dart';

enum CameraType {
  general,
  idCard,
  selfie,
  selfieIdCard,
  selfieGeneral,
  qrCode,
}

class DottedEllipsePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    const dashWidth = 5; // Width of each dash
    const dashSpace = 5; // Space between dashes

    double angle = 0;
    while (angle < 360) {
      final startX =
          size.width / 2 + size.width / 2 * cos(_degreesToRadians(angle));
      final startY =
          size.height / 2 + size.height / 2 * sin(_degreesToRadians(angle));
      final endX = size.width / 2 +
          (size.width / 2 + dashWidth) * cos(_degreesToRadians(angle));
      final endY = size.height / 2 +
          (size.height / 2 + dashWidth) * sin(_degreesToRadians(angle));

      canvas.drawLine(
        Offset(startX, startY),
        Offset(endX, endY),
        paint,
      );
      angle += dashWidth + dashSpace;
    }
  }

  double _degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class SolidEllipsePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final ellipse =
        RRect.fromRectAndRadius(rect, Radius.circular(size.height / 2));

    canvas.drawRRect(ellipse, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class OvalBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final oval = RRect.fromRectAndRadius(rect, Radius.zero);

    canvas.drawOval(oval.outerRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
