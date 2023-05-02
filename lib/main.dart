import 'package:flutter/material.dart';
import 'package:weather/slide/waiting.dart';

void main() {
  runApp(const start());
}

class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
    return Front();
  }
}
