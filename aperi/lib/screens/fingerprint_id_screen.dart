import 'package:flutter/material.dart';

class FingerPrintID extends StatefulWidget {
  const FingerPrintID({super.key});

  @override
  State<FingerPrintID> createState() => _FingerPrintIDState();
}

class _FingerPrintIDState extends State<FingerPrintID> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finger Print ID'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
