import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Rays extends StatelessWidget {

  final double size;
  Rays({this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            height: size / 2.5,
            width: size / 8,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 249, 161, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size / 16),
                topRight: Radius.circular(size / 16),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size * 1.1,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            height: size / 2.5,
            width: size / 8,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 249, 161, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(size / 16),
                bottomRight: Radius.circular(size / 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
