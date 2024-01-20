import 'package:flutter/material.dart';
import 'package:note_app/screen/home_screen.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Note_app",
      home: HomeScreen(),
    );
  }
}
