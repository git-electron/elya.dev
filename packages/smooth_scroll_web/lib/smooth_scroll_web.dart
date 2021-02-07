library smooth_scroll_web;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:elya_site/vars.dart';

const int DEFAULT_NORMAL_SCROLL_ANIMATION_LENGTH_MS = 250;
const int DEFAULT_SCROLL_SPEED = 130;

class SmoothScrollWeb extends StatelessWidget {
  ///Same ScrollController as the child widget's.
  final ScrollController controller;

  ///Child scrollable widget.
  final Widget child;

  ///Scroll speed px/scroll.
  final int scrollSpeed;

  ///Scroll animation length in milliseconds.
  final int scrollAnimationLength;

  ///Curve of the animation.
  final Curve curve;

  SmoothScrollWeb({
    @required this.controller,
    @required this.child,
    this.scrollSpeed = DEFAULT_SCROLL_SPEED,
    this.scrollAnimationLength = DEFAULT_NORMAL_SCROLL_ANIMATION_LENGTH_MS,
    this.curve = Curves.ease,
  });

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      if (controller.position.activity is IdleScrollActivity) {
        scroll = controller.position.extentBefore;
      }
    });

    return Listener(
      onPointerSignal: (pointerSignal) {
        int millis = scrollAnimationLength;
        if (pointerSignal is PointerScrollEvent) {
          if (pointerSignal.scrollDelta.dy > 0) {
            scroll += scrollSpeed;
          } else {
            scroll -= scrollSpeed;
          }
          if (scroll > controller.position.maxScrollExtent) {
            scroll = controller.position.maxScrollExtent;
            millis = scrollAnimationLength ~/ 2;
          }
          if (scroll < 0) {
            scroll = 0;
            millis = scrollAnimationLength ~/ 2;
          }

          controller.animateTo(
            scroll,
            duration: Duration(milliseconds: millis),
            curve: curve,
          );
        }
      },
      child: child,
    );
  }
}
