import 'package:flutter/material.dart';
import 'package:aperi/screens/biometrics.dart';
import 'package:aperi/screens/email_address_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        //elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.primary,
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
            children: [
              const Text(
                'Welcome to Aperi!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Please choose your prefered way to unlock your doors',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fixedSize: const Size(200, 50),
                    backgroundColor: const Color.fromARGB(90, 194, 185, 204),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Biometrics()),
                    );
                  },
                  icon: const Icon(Icons.fingerprint),
                  label: (const Text('Biometrics'))),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fixedSize: const Size(200, 50),
                  backgroundColor: const Color.fromARGB(90, 194, 185, 204),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Email()),
                  );
                },
                icon: const Icon(Icons.numbers),
                label: const Text('Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
