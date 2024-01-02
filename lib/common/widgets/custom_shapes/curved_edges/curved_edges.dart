import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurveStartPoint = Offset(0, size.height - 20);
    final firstCurveEndPoint = Offset(30, size.height - 20);
    path.quadraticBezierTo(firstCurveStartPoint.dx, firstCurveStartPoint.dy,
        firstCurveEndPoint.dx, firstCurveEndPoint.dy);

    final secondCurveStartPoint = Offset(0, size.height - 20);
    final secondCurveEndPoint = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondCurveStartPoint.dx, secondCurveStartPoint.dy,
        secondCurveEndPoint.dx, secondCurveEndPoint.dy);

    final thirdCurveStartPoint = Offset(size.width, size.height - 20);
    final thirdCurveEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdCurveStartPoint.dx, thirdCurveStartPoint.dy,
        thirdCurveEndPoint.dx, thirdCurveEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
