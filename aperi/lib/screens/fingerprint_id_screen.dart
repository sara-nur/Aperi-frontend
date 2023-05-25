import 'package:aperi/screens/successful_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:aperi/services/local_auth_custom.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FingerPrintID extends StatefulWidget {
  const FingerPrintID({super.key});

  Future<dynamic> postFingerprintAuth() async {
    final body = jsonEncode({'isAuthorized': true});
    final headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };

    var response = await http.post(
      Uri.parse('http://192.168.1.82:7004/api/fingerprint-auth'),
      headers: headers,
      body: body,
    );
  }

  @override
  State<FingerPrintID> createState() => _FingerPrintIDState();
}

class _FingerPrintIDState extends State<FingerPrintID> {
  bool authenticate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finger Print ID'),
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
            children: [
              ElevatedButton(
                onPressed: () async {
                  var authenticate =
                      await LocalAuthCustom.authenticateFingerprint();
                  setState(() {
                    authenticate = authenticate;
                  });
                  if (authenticate == true) {
                    await widget.postFingerprintAuth();
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessfulAuth(),
                      ),
                    );
                  }
                },
                child: const Text('Scan your fingerprint'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
