import 'dart:math' as math;
import 'package:elya_site/widgets/sun/rays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Sun extends StatelessWidget {
  final double size;
  Sun({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size / 2.5 * 2 + size * 1.1,
      width: size / 2.5 * 2 + size * 1.1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 249, 161, 1),
                borderRadius: BorderRadius.circular(size / 2),
              ),
            ),
          ),
          Rays(
            size: size,
          ),
          Transform.rotate(
            angle: math.pi / 3,
            child: Rays(
              size: size,
            ),
          ),
          Transform.rotate(
            angle: 2 * math.pi / 3,
            child: Rays(
              size: size,
            ),
          ),
        ],
      ),
    );
  }
}
