import 'package:aperi/screens/successful_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:aperi/services/local_auth_faceID.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FaceID extends StatefulWidget {
  const FaceID({Key? key}) : super(key: key);

  Future<dynamic> postFaceIDauth() async {
    final body = jsonEncode({'isAuthorized': true});
    final headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };

    var response = await http.post(
      Uri.parse('http://192.168.0.66:7004/api/face-id-auth'),
      headers: headers,
      body: body,
    );
  }

  @override
  State<FaceID> createState() => _FaceIDState();
}

class _FaceIDState extends State<FaceID> {
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
    var authResult = await LocalAuthCustom.authenticateFaceID(context);
    setState(() {
      authenticate = authResult;
      widget.postFaceIDauth();
    });
    if (authResult == true) {
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
      ),
    );
  }
}
