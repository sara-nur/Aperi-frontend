import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:confetti/confetti.dart';

class SuccessfulAuth extends StatefulWidget {
  const SuccessfulAuth({super.key});

  @override
  State<SuccessfulAuth> createState() => _SuccessfulAuthState();
}

class _SuccessfulAuthState extends State<SuccessfulAuth> {
  final ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 6));

  @override
  void initState() {
    super.initState();
    _confettiController.play();
    Future.delayed(
      const Duration(seconds: 6),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 229, 99, 90),
                  Color.fromARGB(255, 14, 131, 227),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                Colors.red,
                Colors.blue,
                Colors.yellow,
                Colors.green,
              ],
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Successfull authentification! ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'The doors will now open for you :)',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
