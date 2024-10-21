import 'package:flutter/material.dart';

// Text : widget
var afficheText = const Text(
  "Hello",
  //TextStyle : widget
  style: TextStyle(
    fontSize: 20.0,
    color: Colors.blue,
  ),
);

void main() {
  runApp(
    MaterialApp(
      home: afficheText,
    ),
  );
}
