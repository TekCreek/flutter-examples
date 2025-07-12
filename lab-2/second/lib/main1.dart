import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp(); // Good idea!

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(children: [Text("Hello"), Text("World"), Text("!!")]),
    );
  }
}


/**
 * Column works in the vertical axis. It tries to totally cover the available 
 * vertical space; you can make sure that it shrinks to fit the height 
 * of its content using 
     Column(
        mainAxisSize: MainAxisSize.min,
     ),
 * And you can place widgets in different ways using mainAxisAlignment property.
     mainAxisAlignment: MainAxisAlignment.center     
   Possible values - 
     start  - aligns components to the start like [ABC      ] (assume vertically)
     center - aligns components to the center like [    ABC   ]
     end    - aligns components to the end  like [      ABC]
     between - aligns components with space in between like  [A   B   C]
     around - aligns components with space around like [  A   B   C  ]

   Similar is the case with Row in the coming example.     
 */