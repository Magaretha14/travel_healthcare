import 'package:flutter/material.dart';

class PredictPage extends StatefulWidget {
  const PredictPage({super.key});

  @override
  State<PredictPage> createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Text(
      'Halaman Pra Travel',
      style: TextStyle(color: Colors.black),
    ));
  }
}
