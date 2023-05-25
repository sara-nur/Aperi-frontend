import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthCustom {
  static final auth = LocalAuthentication();

  static Future<bool> _canAuthenticate() async =>
      await auth.canCheckBiometrics || await auth.isDeviceSupported();

  static Future<bool> authenticateFaceID() async {
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
        return false;
      }
    } catch (e) {
      debugPrint('error $e');
      return false;
    }
  }
}
