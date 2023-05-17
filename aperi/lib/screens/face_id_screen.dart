import 'package:flutter/material.dart';

class FaceID extends StatefulWidget {
  const FaceID({super.key});

  @override
  State<FaceID> createState() => _FaceIDState();
}

class _FaceIDState extends State<FaceID> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face ID'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
