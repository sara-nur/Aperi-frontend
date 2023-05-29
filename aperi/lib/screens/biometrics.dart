import 'package:aperi/screens/successful_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:aperi/services/local_auth_custom.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Biometrics extends StatefulWidget {
  const Biometrics({Key? key});

  Future<dynamic> postBiometricsAuth() async {
    final body = jsonEncode({'isAuthorized': true});
    final headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };
    var response = await http.post(
      Uri.parse('http://192.168.1.161:7004/api/biometrics-auth'),
      headers: headers,
      body: body,
    );
  }

  @override
  State<Biometrics> createState() => _BiometricsState();
}

class _BiometricsState extends State<Biometrics> {
  bool authenticate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(microseconds: 10),
      () {
        userAuthenticate();
      },
    );
  }

  void userAuthenticate() async {
    var authResult = await LocalAuthCustom.authenticateBiometrics();
    setState(() {
      authenticate = authResult;
      widget.postBiometricsAuth();
    });
    if (authResult == true) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const SuccessfulAuth(), // Remove 'const' keyword here
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometrics'),
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
      ),
    );
  }
}
