import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Jaynesh Sarkar"),
              accountEmail: Text("jayenesh@gmail.com"),
              decoration: BoxDecoration(
                color: Colors.black,
                // borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.orange,
                    Colors.white,
                    Colors.green,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                foregroundImage: NetworkImage(
                    "https://freepngimg.com/save/22850-man-transparent-image/1600x1219"),
              ),
            ),
            Text("Home"),
            Text("Home"),
            Text("Home"),
            Text("Home"),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Clock App"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.tealAccent),
                side: MaterialStateProperty.all(
                  const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              child: const Text("ElevatedButton"),
            ),
            Theme(
              data: ThemeData(
                useMaterial3: false,
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Click"),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Add Items"),
            ),
            OutlinedButton(
              onPressed: () {},
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all(Colors.green),
              // ),
              child: const Text('Outlined Button'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.video_call),
              label: const Text("Video Call"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Text Button"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt),
              label: const Text("Camera"),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.watch_later),
            ),
            IconButton.filledTonal(
              onPressed: () {},
              // color: Colors.green,
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all(Colors.green)
              // ),
              icon: Icon(Icons.watch_later_outlined),
            ),
            FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.ac_unit),
              label: const Text("Cold"),
            ),
          ],
        ),
      ),
    );
  }
}
