import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Column and Row sample')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('1')),
                ElevatedButton(onPressed: () {}, child: Text('2')),
                ElevatedButton(onPressed: () {}, child: Text('3')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(onPressed: () {}, child: Text('4')),
                OutlinedButton(onPressed: () {}, child: Text('5')),
                OutlinedButton(onPressed: () {}, child: Text('6')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: () {}, child: Text('7')),
                TextButton(onPressed: () {}, child: Text('8')),
                TextButton(onPressed: () {}, child: Text('9')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
