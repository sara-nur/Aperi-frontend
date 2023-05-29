import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthCustom {
  static final auth = LocalAuthentication();

  static Future<bool> _canAuthenticate() async =>
      await auth.canCheckBiometrics || await auth.isDeviceSupported();

  static Future<bool> authenticateBiometrics() async {
    try {
      if (!await _canAuthenticate()) return false;

      return await auth.authenticate(
        //authMessages: const [],
        localizedReason: 'Use fingerprint to authenticate',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      debugPrint('error $e');
      return false;
    }
  }
}
