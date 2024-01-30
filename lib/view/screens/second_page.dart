import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LinearProgressIndicator(
              color: Colors.green,
              backgroundColor: Colors.grey.withOpacity(0.4),
              minHeight: 10,
              // value: 0.5,
              borderRadius: const BorderRadius.all(
                Radius.circular(2),
              ),
            ),
            const CircularProgressIndicator(
              color: Colors.black,
              backgroundColor: Colors.white,
              // value: 0.5,
              strokeWidth: 4,
            ),
          ],
        ),
      ),
    );
  }
}
