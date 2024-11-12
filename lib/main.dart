import 'package:flutter/material.dart';
import 'package:task1level1/views/wellcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wellcome(),
    );
  }
}
