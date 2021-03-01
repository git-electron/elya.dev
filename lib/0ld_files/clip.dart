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

class Lightning extends CustomClipper<Path>{
  final double height;
  final double width;
  final double offset;
  Lightning({this.height, this.width, this.offset});

  double x = (1/13);
  double y = (1/23);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(width * (0.5*x) + offset, height * (12*y));
    path.quadraticBezierTo(width * (-0.45*x) + offset, height * (13.9*y), width * (1.3*x) + offset, height * (14*y));
    path.lineTo(width * (4*x) + offset, height * (14*y));
    path.lineTo(width * (4*x) + offset, height * (22*y));
    path.quadraticBezierTo(width * (4.1*x) + offset, height * (23*y), width * (5*x) + offset, height * (23*y));
    path.quadraticBezierTo(width * (5.7*x) + offset, height * (23*y), width * (6*x) + offset, height * (22.5*y));
    path.lineTo(width * (12.5*x) + offset, height * (11*y));
    path.quadraticBezierTo(width * (13.45*x) + offset, height * (9.1*y), width * (11.7*x) + offset, height * (9*y));
    path.lineTo(width * (9*x) + offset, height * (9*y));
    path.lineTo(width * (9*x) + offset, height * (1*y));
    path.quadraticBezierTo(width * (8.9*x) + offset, 0, width * (8*x) + offset, 0);
    path.quadraticBezierTo(width * (7.3*x) + offset, 0, width * (7*x) + offset, height * (0.5*y));
    path.lineTo(width * (0.5*x) + offset, height * (12*y));
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

}