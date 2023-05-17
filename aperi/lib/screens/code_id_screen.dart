import 'package:flutter/material.dart';

class CodeID extends StatefulWidget {
  const CodeID({super.key});

  @override
  State<CodeID> createState() => _CodeIDState();
}

class _CodeIDState extends State<CodeID> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('4-digit code')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
