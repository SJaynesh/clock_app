import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  bool digitalSwitch = false;
  bool analogSwitch = false;

  DateTime dateTime = DateTime.now();

  int hour = 0;
  int minute = 0;
  int second = 0;

  List month = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "July",
    "Aug",
    "Sep",
    "Oct",
    "Nev",
    "Des",
  ];

  List weekday = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  // startLiveDigitalTime() {
  //   Future.delayed(
  //     const Duration(seconds: 1),
  //     () {
  //       setState(() {
  //         hour = DateTime.now().hour;
  //         minute = DateTime.now().minute;
  //         second = DateTime.now().second;
  //
  //         log("$hour : $minute : $second");
  //       });
  //
  //       startLiveDigitalTime();
  //     },
  //   );
  // }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        hour = DateTime.now().hour % 12;
        minute = DateTime.now().minute;
        second = DateTime.now().second;
      });
    });
    // startLiveDigitalTime();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextScaler textScaler = MediaQuery.of(context).textScaler;
    double h = size.height;
    double w = size.width;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/jaynesh.JPG"),
              ),
              accountName: Text("Jaynesh Sarkar"),
              accountEmail: Text("jayneshsarkar@gmail.com"),
            ),
            ListTile(
              leading: Text(
                "01.",
                style: TextStyle(
                  fontSize: textScaler.scale(20),
                ),
              ),
              title: Text(
                "Digital Clock",
                style: TextStyle(
                  fontSize: textScaler.scale(22),
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: const Text("Clock"),
              trailing: Theme(
                data: ThemeData(
                  useMaterial3: true,
                ),
                child: Switch(
                  value: digitalSwitch,
                  onChanged: (val) {
                    digitalSwitch = val;
                    setState(() {});
                  },
                ),
              ),
            ),
            ListTile(
              leading: Text(
                "02.",
                style: TextStyle(
                  fontSize: textScaler.scale(20),
                ),
              ),
              title: Text(
                "Analog Clock",
                style: TextStyle(
                  fontSize: textScaler.scale(22),
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: const Text("Clock"),
              trailing: Theme(
                data: ThemeData(
                  useMaterial3: true,
                ),
                child: Switch(
                  value: analogSwitch,
                  onChanged: (val) {
                    analogSwitch = val;
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Clock App",
          style: TextStyle(
            fontSize: textScaler.scale(25),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff2e2e44),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: (!digitalSwitch && !analogSwitch)
              ? Image.asset("assets/images/clock.png")
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    Visibility(
                      visible: digitalSwitch,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(
                          //   "${dateTime.day} / ${dateTime.month} / ${dateTime.year}",
                          //   style: TextStyle(
                          //     fontSize: textScaler.scale(25),
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          // Text(
                          //   "$hour : $minute : $second",
                          //   style: TextStyle(
                          //     fontSize: textScaler.scale(25),
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          Text(
                            "Digital Clock",
                            style: TextStyle(
                              fontSize: textScaler.scale(48),
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: h * 0.2,
                            width: w * 0.78,
                            margin: EdgeInsets.all(
                              textScaler.scale(20),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w * 0.03),
                              color: const Color(0xff2d2f41),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 8,
                                  blurRadius: 22,
                                  offset: const Offset(-10, -2),
                                  color: Colors.blue.withOpacity(0.4),
                                ),
                                BoxShadow(
                                  spreadRadius: 10,
                                  blurRadius: 30,
                                  offset: const Offset(10, 2),
                                  color: Colors.purpleAccent.withOpacity(0.4),
                                ),
                                BoxShadow(
                                  spreadRadius: 5,
                                  blurRadius: 20,
                                  offset: const Offset(-10, 10),
                                  color: Colors.blueAccent.withOpacity(0.4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: GradientText(
                                          hour.toString().padLeft(2, '0'),
                                          style: TextStyle(
                                            fontSize: textScaler.scale(70),
                                            fontWeight: FontWeight.w800,
                                          ),
                                          gradientDirection:
                                              GradientDirection.ttb,
                                          stops: const [0.4, 0.6],
                                          colors: const [
                                            Color(0xff5fb8ff),
                                            Color(0xff6171ff),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          ":",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: textScaler.scale(75),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: GradientText(
                                          minute.toString().padLeft(2, '0'),
                                          style: TextStyle(
                                            fontSize: textScaler.scale(70),
                                            fontWeight: FontWeight.w800,
                                          ),
                                          gradientDirection:
                                              GradientDirection.ttb,
                                          stops: const [0.4, 0.6],
                                          colors: const [
                                            Color(0xffffa46c),
                                            Color(0xffff748d),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            GradientText(
                                              "PM",
                                              style: TextStyle(
                                                fontSize: textScaler.scale(18),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              gradientDirection:
                                                  GradientDirection.ttb,
                                              colors: const [
                                                Colors.yellow,
                                                Colors.amber,
                                              ],
                                            ),
                                            SizedBox(
                                              height: h * 0.02,
                                            ),
                                            GradientText(
                                              second.toString().padLeft(2, '0'),
                                              style: TextStyle(
                                                fontSize: textScaler.scale(18),
                                                fontWeight: FontWeight.w500,
                                              ),
                                              gradientDirection:
                                                  GradientDirection.ttb,
                                              colors: const [
                                                Colors.greenAccent,
                                                Colors.lightGreenAccent,
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                GradientText(
                                  "${month[dateTime.month - 1]}, ${weekday[dateTime.weekday - 1]} ${dateTime.day.toString().padLeft(2, '0')}",
                                  style: TextStyle(
                                    fontSize: textScaler.scale(20),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  gradientDirection: GradientDirection.ttb,
                                  colors: const [
                                    Colors.purpleAccent,
                                    Colors.purple,
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Divider(
                    //   color: Colors.yellow,
                    //   thickness: 5,
                    //   indent: w * 0.01,
                    //   endIndent: w * 0.05,
                    // ),

                    // 60 Divider
                    ...List.generate(
                      60,
                      (index) => Transform.rotate(
                        angle: (index * (pi * 2)) / 60,
                        child: Divider(
                          color: (index % 5 == 0) ? Colors.red : Colors.white,
                          thickness: (index % 5 == 0) ? 5 : 2,
                          endIndent: (index % 5 == 0) ? w * 0.85 : w * 0.88,
                        ),
                      ),
                    ),

                    // Second
                    Divider(
                      thickness: 4,
                      color: Colors.green,
                      indent: w * 0.088,
                      endIndent: w * 0.38,
                    ),

                    // Minutes
                    Transform.rotate(
                      angle: pi * 2,
                      child: Divider(
                        thickness: 6,
                        color: Colors.yellow,
                        indent: w * 0.2,
                        endIndent: w * 0.48,
                      ),
                    ),

                    // Hour
                    Transform.rotate(
                      angle: pi * 2,
                      child: Divider(
                        thickness: 6,
                        color: Colors.red,
                        indent: w * 0.3,
                        endIndent: w * 0.48,
                      ),
                    ),

                    // Dot
                    CircleAvatar(
                      radius: w * 0.02,
                    ),
                  ],
                ),
        ),
      ),
      backgroundColor: const Color(0xff2e2e44),
      // (!digitalSwitch) ? Colors.white : const Color(0xff2e2e44),
    );
  }
}
