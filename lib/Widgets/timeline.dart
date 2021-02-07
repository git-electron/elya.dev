import 'dart:async';

import 'package:elya_site/vars.dart';
import 'package:flutter/material.dart';

class TimeLine extends StatefulWidget {
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  bool increment = true;
  bool show = false;

  double division = 0;
  double containerWidth = size.height * 0.01;
  int i = 7;

  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 10), (timer) {
      if (i == 7) {
        setState(() {
          i = 0;
        });
        Future.delayed(Duration(milliseconds: 400), () {
          setState(() {
            show = true;
          });
        });
      }
      division = MediaQuery.of(context).size.width * 0.9 / (dates.length - 1);
      setState(() {
        containerWidth = division * i;
      });
      if (increment) {
        setState(() {
          i++;
        });
        if (i >= dates.length) {
          setState(() {
            i = 0;
          });
        }
      } else {
        setState(() {
          increment = true;
        });
      }
    });
  }

  List<String> dates = [
    'Autumn 2019',
    'Winter 2020',
    'Spring 2020',
    'Summer 2020',
    'Autumn 2020',
    'Winter 2021',
  ];

  @override
  Widget build(BuildContext context) {
    Size size1 = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.topCenter,
      height: height * 0.6,
      width: size1.width,
      child: Column(
        children: [
          Container(
            width: size1.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Projects timeline',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (size1.width * 2 > 3000)
                        ? width * 0.035
                        : (size1.width * 2 > 2000)
                            ? width * 0.025
                            : (size1.width > 750)
                                ? width * 0.020
                                : size1.width * 0.08,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                    letterSpacing: 1.3,
                  ),
                ),
                SizedBox(),
              ],
            ),
          ),
          Container(
            width: size1.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size1.width * 0.9,
                  child: Text(
                    'Click on the colored lines on the timeline to explore more about the project',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: (size1.width > 750)
                          ? width * 0.012
                          : size1.width * 0.03,
                      fontWeight: FontWeight.w300,
                      height: 1.15,
                      letterSpacing: 1.3,
                    ),
                  ),
                ),
                SizedBox(),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            height: height * 0.2,
            width: size1.width * 0.93,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dates[0],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: (size1.width > 750)
                            ? width * 0.008
                            : size1.width * 0.024,
                      ),
                    ),
                    Text(
                      dates[1],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: (size1.width > 750)
                            ? width * 0.008
                            : size1.width * 0.024,
                      ),
                    ),
                    Text(
                      dates[2],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: (size1.width > 750)
                            ? width * 0.008
                            : size1.width * 0.024,
                      ),
                    ),
                    Text(
                      dates[3],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: (size1.width > 750)
                            ? width * 0.008
                            : size1.width * 0.024,
                      ),
                    ),
                    Text(
                      dates[4],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: (size1.width > 750)
                            ? width * 0.008
                            : size1.width * 0.024,
                      ),
                    ),
                    Text(
                      dates[5],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: (size1.width > 750)
                            ? width * 0.008
                            : size1.width * 0.024,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.005,
                ),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      height: height * 0.01,
                      width: size1.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius:
                              BorderRadius.circular(height * 0.25)),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: (i == 1) ? 0 : 10000),
                      height: height * 0.01,
                      width: containerWidth,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(height * 0.25)),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.008,
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: show ? 1 : 0,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeOutBack,
                    height: (i >= 2 && i <= 5)
                        ? height * 0.037
                        : height * 0.017,
                    width: size1.width * 0.9,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: AnimatedContainer(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(
                                left: width * 0.003,
                                top: width * 0.001,
                                right: width * 0.005),
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeOutBack,
                            height: (i >= 2 && i <= 5)
                                    ? height * 0.03
                                    : height * 0.01,
                            width: division * 4,
                            decoration: BoxDecoration(
                                color: (i >= 2 && i <= 5)
                                    ? Colors.redAccent
                                    : Colors.white.withOpacity(0.2),
                                borderRadius:
                                    BorderRadius.circular(height * 0.008)),
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              opacity: (i >= 2 && i <= 5)
                                  ? 1
                                  : 0,
                              child: Text('SafeTY (Old version)',
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: height * 0.015,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: show ? 1 : 0,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeOutBack,
                    height: (i >= 5 && i <= 5 || i == 0)
                            ? height * 0.037
                            : height * 0.017,
                    width: size1.width * 0.9,
                    child: Row(
                      children: [
                        SizedBox(
                          width: division * 3,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: AnimatedContainer(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(
                                left: width * 0.003,
                                top: width * 0.001,
                                right: width * 0.005),
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeOutBack,
                            height: (i >= 5 && i <= 6 || i == 0)
                                    ? height * 0.03
                                    : height * 0.01,
                            width: division * 2,
                            decoration: BoxDecoration(
                                color: (i >= 5 && i <= 6 || i == 0)
                                    ? Colors.deepPurpleAccent
                                    : Colors.white.withOpacity(0.2),
                                borderRadius:
                                    BorderRadius.circular(height * 0.008)),
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              opacity: (i >= 5 && i <= 6 || i == 0)
                                  ? 1
                                  : 0,
                              child: Text('SafeTY NEW',
                                softWrap: true,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: height * 0.015,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: show ? 1 : 0,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeOutBack,
                    height: (i >= 3 && i <= 3 || i >= 5 && i <= 5)
                            ? height * 0.037
                            : height * 0.017,
                    width: size1.width * 0.9,
                    child: Row(
                      children: [
                        SizedBox(
                          width: division * 1,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: AnimatedContainer(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(
                                left: width * 0.003,
                                top: width * 0.001,
                                right: width * 0.005),
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeOutBack,
                            height: (i >= 3 && i <= 3)
                                    ? height * 0.03
                                    : height * 0.01,
                            width: division * 1,
                            decoration: BoxDecoration(
                                color: (i >= 3 && i <= 3)
                                    ? Colors.greenAccent
                                    : Colors.white.withOpacity(0.2),
                                borderRadius:
                                    BorderRadius.circular(height * 0.008)),
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              opacity: (i >= 3 && i <= 3)
                                  ? 1
                                  : 0,
                              child: Text('Quanto - Discord Bot',
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: height * 0.015,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeOutBack,
                          width: division * 1,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: AnimatedContainer(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(
                                left: width * 0.003,
                                top: width * 0.001,
                                right: width * 0.005),
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeOutBack,
                            height: (i >= 5 && i <= 5)
                                    ? height * 0.03
                                    : height * 0.01,
                            width: division * 1,
                            decoration: BoxDecoration(
                                color: (i >= 5 && i <= 5)
                                    ? Colors.greenAccent
                                    : Colors.white.withOpacity(0.2),
                                borderRadius:
                                    BorderRadius.circular(height * 0.008)),
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              opacity: (i >= 5 && i <= 5)
                                  ? 1
                                  : 0,
                              child: Text('Quanto - Discord Bot',
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: height * 0.015,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: show ? 1 : 0,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeOutBack,
                    height: (i >= 3 && i <= 4)
                            ? height * 0.037
                            : height * 0.017,
                    width: size1.width * 0.9,
                    child: Row(
                      children: [
                        SizedBox(
                          width: division * 1,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: AnimatedContainer(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(
                                left: width * 0.003,
                                top: width * 0.001,
                                right: width * 0.005),
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeOutBack,
                            height: (i >= 3 && i <= 4)
                                    ? height * 0.03
                                    : height * 0.01,
                            width: division * 2,
                            decoration: BoxDecoration(
                                color: (i >= 3 && i <= 4)
                                    ? Colors.orangeAccent
                                    : Colors.white.withOpacity(0.2),
                                borderRadius:
                                    BorderRadius.circular(height * 0.008)),
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              opacity: (i >= 3 && i <= 4)
                                  ? 1
                                  : 0,
                              child: Text('inFlow',
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: height * 0.015,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
