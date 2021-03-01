import 'dart:async';
import 'dart:html';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:elya_site/icons/custom_icons_icons.dart';
import 'package:elya_site/scroll/scrollConfig.dart';
import 'package:elya_site/widgets/cloud/cloud.dart';
import 'package:elya_site/widgets/sun/sun.dart';
import 'package:elya_site/widgets/moon.dart';

import 'package:smooth_scroll_web/smooth_scroll_web.dart';

void main() {
  runApp(MaterialApp(
    title: 'Electron',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Color.fromRGBO(250, 250, 250, 1)),
    home: Home(),
    builder: (context, child) {
      return ScrollConfiguration(
        behavior: Behavior(),
        child: child,
      );
    },
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  ScrollController _listController = ScrollController();

  AnimationController _todController;
  Animation _todAnimation;
  Animation _topColorAnimation;
  Animation _bottomColorAnimation;
  Animation _sunAngleAnimation;
  Animation _moonAngleAnimation;

  bool mobile = false;
  bool tablet = false;
  bool desktop = true;
  bool fixed = false;
  bool animation = false;
  bool dayNight = true;
  bool dayNightWidgets = true;
  bool hint = true;

  double sunOp = 1;
  double moonOp = 0;
  double offset = 0;
  double sunX = 0.95;
  double sunY = 0.12;
  double moonX = 1.2;
  double moonY = 0.2;

  void initState() {
    super.initState();

    _todController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _todAnimation = Tween<double>(begin: 0.0, end: 1.5).animate(
        CurvedAnimation(parent: _todController, curve: Curves.easeInOutQuad));
    _topColorAnimation = ColorTween(
            begin: Color.fromRGBO(149, 219, 255, 1),
            end: Color.fromRGBO(80, 80, 80, 1))
        .animate(CurvedAnimation(
            parent: _todController, curve: Curves.easeInOutQuad));
    _bottomColorAnimation = ColorTween(
            begin: Color.fromRGBO(119, 169, 255, 1),
            end: Color.fromRGBO(30, 30, 30, 1))
        .animate(CurvedAnimation(
            parent: _todController, curve: Curves.easeInOutQuad));
    _sunAngleAnimation = Tween<double>(begin: math.pi, end: math.pi / 2)
        .animate(CurvedAnimation(
            parent: _todController, curve: Curves.easeInOutQuad));
    _moonAngleAnimation = Tween<double>(begin: math.pi / 2, end: math.pi)
        .animate(CurvedAnimation(
            parent: _todController, curve: Curves.easeInOutQuad));

    Future.delayed(Duration(milliseconds: 1), () {
      if (MediaQuery.of(context).size.height < 800) {
        setState(() {
          fixed = true;
        });
      } else {
        setState(() {
          fixed = false;
        });
      }
      if (MediaQuery.of(context).size.width < 700) {
        setState(() {
          mobile = true;
          tablet = false;
          desktop = false;
        });
      } else if (MediaQuery.of(context).size.width < 1100) {
        setState(() {
          mobile = false;
          tablet = true;
          desktop = false;
        });
      } else {
        setState(() {
          mobile = false;
          tablet = false;
          desktop = true;
        });
      }

      setState(() {
        sunX = mobile ? 0.9 : 0.95;
        sunY = mobile
            ? 0.18
            : tablet
                ? 0.18
                : 0.12;
        moonX = mobile ? 1.3 : 1.2;
      });
    });

    Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (MediaQuery.of(context).size.height < 800) {
        setState(() {
          fixed = true;
        });
      } else {
        setState(() {
          fixed = false;
        });
      }
      if (MediaQuery.of(context).size.width < 700) {
        setState(() {
          mobile = true;
          tablet = false;
          desktop = false;
          if (!animation) {
            if (dayNight) {
              sunX = 0.9;
              sunY = 0.18;
            } else {
              moonX = 0.9;
              moonY = 0.18;
            }
          }
        });
      } else if (MediaQuery.of(context).size.width < 1100) {
        setState(() {
          mobile = false;
          tablet = true;
          desktop = false;
          if (!animation) {
            if (dayNight) {
              sunX = 0.95;
              sunY = 0.18;
            } else {
              moonX = 0.95;
              moonY = 0.18;
            }
          }
        });
      } else {
        setState(() {
          mobile = false;
          tablet = false;
          desktop = true;
          if (!animation) {
            if (dayNight) {
              sunX = 0.95;
              sunY = 0.12;
            } else {
              moonX = 0.95;
              moonY = 0.12;
            }
          }
        });
      }
    });

    Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (!animation) {
        setState(() {
          offset = dayNight
              ? _listController.position.pixels / 1000
              : _listController.position.pixels / 1000 + 1.5;
        });
      }
    });

    Future.delayed(Duration(seconds: 10), (){
      setState(() {
        hint = false;
      });
    });
  }

  void animate() {
    setState(() {
      hint = false;
      dayNight = !dayNight;
      sunOp = 1;
      moonOp = 1;
    });
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        offset = _todAnimation.value;
        if (!dayNight) {
          sunX = 7 * math.cos(_sunAngleAnimation.value);
          sunY = 25 * math.sin(_sunAngleAnimation.value);
          moonX = mobile ? 0.9 : 0.95;
          moonY = mobile
              ? 0.18
              : tablet
                  ? 0.18
                  : 0.12;
        } else {
          moonX = 7 * math.cos(_moonAngleAnimation.value);
          moonY = 25 * math.sin(_moonAngleAnimation.value);
          sunX = mobile ? 0.9 : 0.95;
          sunY = mobile
              ? 0.18
              : tablet
                  ? 0.18
                  : 0.12;
        }
      });
      if (!animation) {
        timer.cancel();
        setState(() {
          sunOp = dayNight ? 1 : 0;
          moonOp = dayNight ? 0 : 1;
          sunX = dayNight
              ? mobile
                  ? 0.9
                  : 0.95
              : 0.8;
          sunY = dayNight
              ? mobile
                  ? 0.18
                  : tablet
                      ? 0.18
                      : 0.12
              : 1.45;
          moonX = dayNight
              ? mobile
                  ? 1.3
                  : 1.2
              : mobile
                  ? 0.9
                  : 0.95;
          moonY = dayNight
              ? 0.2
              : mobile
                  ? 0.18
                  : tablet
                      ? 0.18
                      : 0.12;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size1 = MediaQuery.of(context).size;

    return Scaffold(
      body: SmoothScrollWeb(
        controller: _listController,
        child: ListView(
          physics: desktop
              ? NeverScrollableScrollPhysics()
              : AlwaysScrollableScrollPhysics(),
          controller: _listController,
          children: [
            Container(
              alignment: Alignment.center,
              height: mobile
                  ? fixed
                      ? 800 / 1.1
                      : size1.height / 1.1
                  : tablet
                      ? fixed
                          ? 800 / 1.3
                          : size1.height / 1.3
                      : fixed
                          ? 800
                          : size1.height,
              width: size1.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    _topColorAnimation.value,
                    _bottomColorAnimation.value,
                  ],
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration(
                        milliseconds: (sunOp == 1 && animation) ? 2000 : 0),
                    curve: Curves.easeInOutSine,
                    height: 1000,
                    width: size1.width,
                    alignment: FractionalOffset(sunX, sunY),
                    child: Transform.rotate(
                      angle: math.pi * offset,
                      child: GestureDetector(
                        onTap: () {
                          animation = true;

                          dayNight
                              ? _todController.forward(from: 0.0)
                              : _todController.reverse(from: 1.0);
                          animate();

                          Future.delayed(
                              Duration(milliseconds: dayNight ? 650 : 1350),
                              () {
                            setState(() {
                              dayNightWidgets = !dayNightWidgets;
                            });
                          });

                          Future.delayed(Duration(milliseconds: 2000), () {
                            setState(() {
                              animation = false;
                            });
                          });
                        },
                        child: Opacity(
                          opacity: sunOp,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Sun(
                                size: mobile
                                    ? 70
                                    : tablet
                                        ? 100
                                        : 170,
                              ),
                              AnimatedOpacity(
                                duration: Duration(milliseconds: 2000),
                                opacity: hint ? 1 : 0,
                                child: Text(
                                  'HIT ME',
                                  style: TextStyle(
                                    fontSize: mobile
                                        ? 15
                                        : tablet
                                            ? 20
                                            : 35,
                                    color: Colors.white,
                                    fontFamily: 'nevis',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(
                        milliseconds: (moonOp == 1 && animation) ? 2000 : 0),
                    curve: Curves.easeInOutSine,
                    height: 1000,
                    width: size1.width,
                    alignment: FractionalOffset(moonX, moonY),
                    child: Transform.rotate(
                      angle: math.pi * offset + 1.4,
                      child: GestureDetector(
                        onTap: () {
                          animation = true;

                          dayNight
                              ? _todController.forward(from: 0.0)
                              : _todController.reverse(from: 1.0);
                          animate();

                          Future.delayed(
                              Duration(milliseconds: dayNight ? 650 : 1350),
                              () {
                            setState(() {
                              dayNightWidgets = !dayNightWidgets;
                            });
                          });

                          Future.delayed(Duration(milliseconds: 2000), () {
                            setState(() {
                              animation = false;
                            });
                          });
                        },
                        child: Opacity(
                          opacity: moonOp,
                          child: Moon(
                            size: mobile
                                ? 70
                                : tablet
                                    ? 100
                                    : 170,
                          ),
                        ),
                      ),
                    ),
                  ),
                  dayNightWidgets
                      ? Container(
                          height: 1000,
                          width: size1.width,
                          alignment: FractionalOffset(
                              mobile
                                  ? 0.9 - offset
                                  : animation
                                      ? 0.95 - offset
                                      : 0.95 - offset / 2,
                              mobile
                                  ? 0.25
                                  : tablet
                                      ? 0.3
                                      : 0.34),
                          child: Cloud(
                            size: mobile
                                ? 70
                                : tablet
                                    ? 100
                                    : 170,
                          ),
                        )
                      : Container(
                          height: 1000,
                          width: size1.width,
                          alignment: FractionalOffset(
                              mobile
                                  ? 2.4 - offset
                                  : animation
                                      ? 2.45 - offset
                                      : 2.45 - offset,
                              mobile
                                  ? 0.25
                                  : tablet
                                      ? 0.3
                                      : 0.34),
                          child: Cloud(
                            size: mobile
                                ? 70
                                : tablet
                                    ? 100
                                    : 170,
                          ),
                        ),
                  dayNightWidgets
                      ? Container(
                          height: 1000,
                          width: size1.width,
                          alignment: FractionalOffset(
                              mobile
                                  ? animation
                                      ? 0.1 + offset
                                      : 0.1 + offset / 2
                                  : 0.1 + offset,
                              mobile ? 0.55 : 0.1),
                          child: Cloud(
                            size: mobile
                                ? 70
                                : tablet
                                    ? 100
                                    : 170,
                          ),
                        )
                      : Container(
                          height: 1000,
                          width: size1.width,
                          alignment: FractionalOffset(
                              mobile
                                  ? animation
                                      ? -1.4 + offset
                                      : -1.4 + offset
                                  : -1.4 + offset,
                              mobile ? 0.55 : 0.1),
                          child: Cloud(
                            size: mobile
                                ? 70
                                : tablet
                                    ? 100
                                    : 170,
                          ),
                        ),
                  AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeInOutQuad,
                      height: mobile
                          ? fixed
                              ? 800 / 1.1
                              : size1.height / 1.1
                          : tablet
                              ? fixed
                                  ? 800 / 1.3
                                  : size1.height / 1.3
                              : fixed
                                  ? 800
                                  : size1.height,
                      width: size1.width,
                      alignment: FractionalOffset(mobile ? 0.3 : 0.1, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Electron',
                            style: TextStyle(
                              fontSize: mobile
                                  ? 70
                                  : tablet
                                      ? 100
                                      : 170,
                              fontFamily: 'nevis',
                              color: Colors.white,
                              letterSpacing: mobile ? 2 : 7,
                            ),
                          ),
                          Text(
                            mobile
                                ? 'I am developing beautiful\ncross-platform mobile apps\nadaptive and modern websites\nusing Flutter and more'
                                : 'I am developing beautiful cross-platform\nmobile apps, adaptive and modern websites\nusing Flutter and more',
                            style: TextStyle(
                              fontSize: mobile
                                  ? 25
                                  : tablet
                                      ? 30
                                      : 45,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(
                            height: mobile ? 70 : 100,
                          )
                        ],
                      )),
                ],
              ),
            ),
            Container(
              height: mobile
                  ? 1000 / 1.1
                  : tablet
                      ? 1000 / 1.3
                      : 1000,
              width: size1.width,
              color: Color.fromRGBO(250, 250, 250, 1),
              alignment: Alignment.center,
              child: Text(
                'Soon...',
                style: TextStyle(
                    fontSize: mobile
                        ? 40
                        : tablet
                            ? 60
                            : 100,
                    fontFamily: 'nevis',
                    color: Color.fromRGBO(80, 80, 80, 1)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
