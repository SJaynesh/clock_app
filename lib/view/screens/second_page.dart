import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      progress += 0.005;
      setState(() {});
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // LinearProgressIndicator(
            //   color: Colors.green,
            //   backgroundColor: Colors.grey.withOpacity(0.4),
            //   minHeight: 12,
            //   // value: progress,
            //   borderRadius: const BorderRadius.all(
            //     Radius.circular(50),
            //   ),
            // ),
            //  CircularProgressIndicator(
            //   color: Colors.blue,
            //   backgroundColor: Colors.white,
            //   strokeWidth: 4,
            //   value: progress,
            // ),
            // Transform.scale(
            //   // scale: 1.5,
            //   scaleX: 1,
            //   scaleY: 1.5,
            //   child: CircularProgressIndicator(),
            // ),
            // Transform.translate(
            //   offset: const Offset(150, -300),
            //   child: Container(
            //     height: 50,
            //     width: 50,
            //     color: Colors.blue,
            //   ),
            // ),
            Transform.rotate(
              angle: pi /5,
              child: Text(
                "Hello World",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
