import 'package:flutter/material.dart';

class InvertedClipper extends CustomClipper<Path> {
  final double borderRadius;
  final Rect rect;

  InvertedClipper(this.rect, this.borderRadius);

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..addRect(Rect.fromLTRB(0, 0, size.width, size.height))
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(borderRadius)))
      ..fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  bool shouldReclip(InvertedClipper oldClipper) => false;
}
