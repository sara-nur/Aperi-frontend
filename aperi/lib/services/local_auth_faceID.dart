// ignore: file_names
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:aperi/screens/home_page.dart';

class LocalAuthCustom {
  static final auth = LocalAuthentication();

  static Future<bool> _canAuthenticate() async =>
      await auth.canCheckBiometrics || await auth.isDeviceSupported();

  static Future<bool> authenticateFaceID(BuildContext context) async {
    try {
      if (!await _canAuthenticate()) return false;

      final availableBiometrics = await auth.getAvailableBiometrics();
      if (availableBiometrics.contains(BiometricType.face)) {
        return await auth.authenticate(
            localizedReason: 'Use Face ID to authenticate',
            options: const AuthenticationOptions(
              useErrorDialogs: true,
              stickyAuth: true,
            ));
      } else {
        debugPrint('face id not available');
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                title: const Center(
                    child: Text('Face ID is not available for this device')),
                content: const Text(
                    'Use another way of authentification, click ok to go back to homescreen'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: const Center(child: Text('Ok')),
                  )
                ],
              );
            }));
        return false;
      }
    } catch (e) {
      debugPrint('error $e');
      return false;
    }
  }
}
