import 'package:flutter/material.dart';
import 'package:aperi/screens/face_id_screen.dart';
import 'package:aperi/screens/fingerprint_id_screen.dart';
import 'package:aperi/screens/code_id_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    IconData? icon;
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Aperi!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FaceID()),
                );
              },
              icon: const Icon(Icons.tag_faces_sharp),
              label: const Text('Face ID'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FingerPrintID()),
                  );
                },
                icon: const Icon(Icons.fingerprint),
                label: (const Text('Finger Print ID'))),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CodeID()),
                  );
                },
                icon: Icon(Icons.numbers),
                label: const Text('Code')),
          ],
        ),
      ),
    );
  }
}
