import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  bool digitalSwitch = false;

  DateTime dateTime = DateTime.now();

  int hour = 0;
  int minute = 0;
  int second = 0;

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
                trailing: Switch(
                  value: digitalSwitch,
                  onChanged: (val) {
                    log("Switch Value $val");
                    digitalSwitch = val;
                    setState(() {});
                  },
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
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
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
                    height: h * 0.18,
                    width: w * 0.7,
                    margin: EdgeInsets.all(
                      textScaler.scale(20),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      color: const Color(0xff2d2f41),
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 8,
                          blurRadius: 20,
                          offset: Offset(-10, -2),
                          color: Colors.blue,
                        ),
                        BoxShadow(
                          spreadRadius: 8,
                          blurRadius: 20,
                          offset: Offset(10, 2),
                          color: Colors.purpleAccent,
                        ),
                        BoxShadow(
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(-10, 10),
                          color: Colors.blueAccent,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$hour",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: textScaler.scale(40),
                              ),
                            ),
                            Text(
                              ":",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: textScaler.scale(40),
                              ),
                            ),
                            Text(
                              "$minute",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: textScaler.scale(40),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black //Color(0xff2e2e44),
        );
  }
}
