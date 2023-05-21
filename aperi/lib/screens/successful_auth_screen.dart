import 'package:flutter/material.dart';

class SuccessfulAuth extends StatefulWidget {
  const SuccessfulAuth({super.key});

  @override
  State<SuccessfulAuth> createState() => _SuccessfulAuthState();
}

class _SuccessfulAuthState extends State<SuccessfulAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Success',
          style: TextStyle(
            fontSize: 20,
          ),
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
              Color.fromARGB(255, 14, 131, 227),
              Color.fromARGB(224, 197, 138, 212),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'You have successfully authenticated! The doors will now open for you :)',
            )
          ],
        ),
      ),
    );
  }
}
