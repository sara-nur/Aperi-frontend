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
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text(
          'Face ID',
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Scan your Face to authenticate! ',
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
