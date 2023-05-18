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
      appBar: AppBar(
        title: const Text(
          '4-digit code',
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 229, 99, 90),
            Color.fromARGB(255, 67, 144, 207),
            Color.fromARGB(223, 183, 144, 54),
          ],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Enter your code to continue',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
