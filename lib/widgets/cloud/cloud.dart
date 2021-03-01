import 'package:elya_site/clippath/cloud.dart';
import 'package:flutter/material.dart';

class Cloud extends StatelessWidget {
  final double size;
  Cloud({this.size});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CloudClipper(),
      child: Container(
        height: size,
        width: size * 3,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(size / 2),
              ),
            ),
            Positioned(
              right: size * 1.7,
              child: Container(
                height: size / 1.6,
                width: size / 1.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(size / 1.6 / 2),
                ),
              ),
            ),
            Positioned(
              left: size * 1.7,
              child: Container(
                height: size / 1.3,
                width: size / 1.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(size / 1.3 / 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
