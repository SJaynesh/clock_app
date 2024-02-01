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

  startLiveDigitalTime() {
    Future.delayed(
      const Duration(microseconds: 1),
      () {
       setState(() {
         hour = DateTime.now().hour;
         minute = DateTime.now().minute;
         second = DateTime.now().second;

         log("$hour : $minute : $second");
       });

        startLiveDigitalTime();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startLiveDigitalTime();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextScaler scaler = MediaQuery.of(context).textScaler;
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
                  fontSize: scaler.scale(20),
                ),
              ),
              title: Text(
                "Digital Clock",
                style: TextStyle(
                  fontSize: scaler.scale(22),
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
        title: Text(
          "Clock App",
          style: TextStyle(
            fontSize: scaler.scale(25),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "0${dateTime.day} / 0${dateTime.month} / ${dateTime.year}",
              style: TextStyle(
                fontSize: scaler.scale(25),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${hour%12} : $minute : $second",
              style: TextStyle(
                fontSize: scaler.scale(25),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
