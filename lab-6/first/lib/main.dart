import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Product("Computer", Icon(Icons.computer), 20000),
          SizedBox(height: 20),
          Product("Keyboard", Icon(Icons.keyboard), 2000),
        ],
      ),
    );
  }
}

class Product extends StatelessWidget {
  final String name;
  final Icon icon;
  final double price;

  const Product(this.name, this.icon, this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.loose(Size(300, 300)),
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: 20),
          Text(name, style: TextStyle(color: Colors.black, fontSize: 14.0)),
          SizedBox(width: 20),
          Text(
            "Rs: $price",
            style: TextStyle(color: Colors.deepPurple, fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
