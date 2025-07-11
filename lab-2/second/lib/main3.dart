import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp(); // Good idea!

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(color: Colors.red),
          ),
          const Text("Hello"),
        ],
      ),
    );
  }
}
