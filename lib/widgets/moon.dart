import 'package:elya_site/clippath/moon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Moon extends StatelessWidget {
  final double size;
  Moon({this.size});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MoonClipper(),
      child: Container(
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
          ],
        ),
      ),
    );
  }
}
