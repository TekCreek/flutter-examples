import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed:
            Colors.blue, // Changed color scheme for Flutter examples
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Widget demo')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello, Flutter!'),
            const Text(
              'Styled Text',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Image.network(
              'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(20.0),
              color: Colors.lightBlue[100],
              child: const Text('Padded & Margined container'),
            ),
          ],
        ),
      ),
    ),
  );
}
