import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:elya_site/scroll/scrollConfig.dart';
import 'file:///E:/Programs/Flutter/Projects/Developing/elya_site/lib/0ld_files/timeline.dart';
import 'file:///E:/Programs/Flutter/Projects/Developing/elya_site/lib/0ld_files/clip.dart';
import 'package:elya_site/vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';

void main() {
  runApp(MaterialApp(
    title: 'Electron',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Color.fromRGBO(250, 250, 250, 1)),
    home: HomePage(),
    builder: (context, child) {
      return ScrollConfiguration(
        behavior: Behavior(),
        child: child,
      );
    },
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool exploreButtonHovered = false;
  bool exploreButtonPressed = false;

  ScrollController _listController = ScrollController();
  ScrollController _noController = ScrollController();

  Offset circleOffset = Offset(0, 0);
  AnimationController animationController;
  Animation<double> animation;

  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    Future.delayed(Duration(milliseconds: 50), () {
      setState(() {
        fixedSize = MediaQuery.of(context).size;
        width = 1920;
        height = 1000;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size1 = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Container(
        height: size1.height * 1.5,
        width: size1.width,
        child: SmoothScrollWeb(
          controller: (size1.width > 750) ? _listController : _noController,
          child: //(size1.width > 750) ?
          ListView(
            physics: (size1.width > 750)
                ? NeverScrollableScrollPhysics()
                : AlwaysScrollableScrollPhysics(),
            controller: _listController,
            children: [
              Container(
                height: (size1.width < 750) ? height * 0.9 : height,
                width: size1.width,
                child: (size1.width > 750)
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: height,
                      width: (size1.width * 2 > 3000)
                          ? width * 0.35
                          : (size1.width * 2 > 2000)
                          ? width * 0.25
                          : width * 0.20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hey, I'm Electron, and I'm electrifying your electro device\n",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: (size1.width * 2 > 3000)
                                  ? width * 0.035
                                  : (size1.width * 2 > 2000)
                                  ? width * 0.025
                                  : width * 0.020,
                              fontWeight: FontWeight.w700,
                              height: 1.15,
                              letterSpacing: 1.3,
                            ),
                          ),
                          Text(
                            "A lonely web and mobile cross-platform Flutter developer",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: width * 0.012,
                              fontWeight: FontWeight.w300,
                              height: 1.15,
                              letterSpacing: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: height,
                      width: (size1.width * 2 > 3000)
                          ? width * 0.25
                          : (size1.width * 2 > 3000)
                          ? width * 0.2
                          : width * 0.15,
                      child: Container(
                        height: height * 0.7,
                        width: height * 0.7,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/lightning.png'),
                            )),
                      ),
                    ),
                  ],
                )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Text(
                      "Hey, I'm Electron,\nand I'm electrifying\nyour electro device\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: size1.width * 0.08,
                        fontWeight: FontWeight.w700,
                        height: 1.15,
                        letterSpacing: 1.3,
                      ),
                    ),
                    Text(
                      "A lonely web and mobile cross-platform\nFlutter developer",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: size1.width * 0.045,
                        fontWeight: FontWeight.w300,
                        height: 1.15,
                        letterSpacing: 1.3,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: height * 0.5,
                      width: size1.width * 0.5,
                      child: Container(
                        height: height * 0.7,
                        width: height * 0.7,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/lightning.png'),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: height * 0.8,
                width: size1.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: height * 0.7,
                      width: size1.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color.fromRGBO(100, 219, 255, 1),
                                Color.fromRGBO(168, 147, 255, 1)
                              ]),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 5,
                                blurRadius: 20)
                          ]),
                    ),
                    TimeLine(),
                    Container(
                      height: height * 0.5,
                      width: size1.width * 0.6,
                      alignment: FractionalOffset(0.5, 0.8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Learn more about my projects',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: (size1.width > 750)
                                  ? width * 0.012
                                  : size1.width * 0.05,
                              fontWeight: FontWeight.w300,
                              height: 1.15,
                              letterSpacing: 1.3,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onEnter: (event) {
                              setState(() {
                                if (!(size1.width < 750)) {
                                  exploreButtonHovered = true;
                                }
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                exploreButtonHovered = false;
                                exploreButtonPressed = false;
                                animationController.reverse();
                              });
                            },
                            onHover: (event) {
                              setState(() {
                                circleOffset = event.localPosition;
                              });
                            },
                            child: GestureDetector(
                              onTap: () {
                                if (size1.width < 750) {
                                  setState(() {
                                    exploreButtonHovered = true;
                                  });
                                  Future.delayed(Duration(milliseconds: 500),
                                          () {
                                        setState(() {
                                          exploreButtonHovered = false;
                                        });
                                      });
                                } else {
                                  setState(() {
                                    exploreButtonPressed = true;
                                    animationController.forward();
                                  });
                                  Future.delayed(Duration(milliseconds: 200),
                                          () {
                                        setState(() {
                                          exploreButtonPressed = false;
                                          exploreButtonHovered = false;
                                        });
                                      });
                                }
                              },
                              onTapDown: (details) {
                                if (size1.width < 750) {
                                  setState(() {
                                    exploreButtonHovered = true;
                                  });
                                } else {
                                  setState(() {
                                    exploreButtonPressed = true;
                                    animationController.forward();
                                  });
                                }
                              },
                              onLongPressEnd: (details) {
                                setState(() {
                                  exploreButtonPressed = false;
                                  if (size1.width < 750) {
                                    exploreButtonHovered = false;
                                  }
                                });
                              },
                              child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(milliseconds: 300),
                                height: (size1.width > 750)
                                    ? height * 0.05
                                    : height * 0.05,
                                width: (size1.width > 750)
                                    ? width * 0.07
                                    : size1.width * 0.4,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white,
                                        width: height * 0.003),
                                    borderRadius:
                                    BorderRadius.circular(height * 0.01),
                                    color: exploreButtonHovered
                                        ? Colors.white
                                        : Color.fromRGBO(134, 183, 255, 1),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 15.0,
                                          spreadRadius: 0.0,
                                          color: Colors.black.withOpacity(
                                              exploreButtonHovered ? 0.3 : 0),
                                          offset: Offset(
                                              0, exploreButtonHovered ? 10 : 0))
                                    ]),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircularRevealAnimation(
                                      animation: animation,
                                      centerOffset: (size1.width > 750)
                                          ? circleOffset
                                          : circleOffset * 0.4,
                                      child: Container(
                                        height: height * 0.05,
                                        width: (size1.width > 750)
                                            ? width * 0.07
                                            : size1.width * 0.4,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              height * 0.008),
                                          color:
                                          Color.fromRGBO(150, 200, 255, 1),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Explore ➲',
                                      style: TextStyle(
                                        color: exploreButtonHovered
                                            ? Color.fromRGBO(150, 200, 255, 1)
                                            : Colors.white,
                                        fontSize: (size1.width > 750)
                                            ? width * 0.01
                                            : size1.width * 0.04,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: height * 0.2,
                width: size1.width,
                child: Text(
                  'New content on this page will appear soon...\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: width * 0.01,
                    fontWeight: FontWeight.w300,
                    height: 1.15,
                    letterSpacing: 1.3,
                  ),
                ),
              ),
            ],
          )
          /*: Container()*/,
        ),
      ),
    );
  }
}
