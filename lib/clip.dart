import 'package:flutter/material.dart';

class TimeLineClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {

    Path path = Path();

    path.lineTo(0, size.height);

    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;

}

class FadeLineClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {

    Path path = Path();

    path.lineTo(0, size.height);

    var firstStart = Offset(size.width - (size.width / 3.24), size.height - 105);
    var firstEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width / 5, size.height);
    var secondEnd = Offset(size.width / 2.25, size.height - 50.0);
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;

}