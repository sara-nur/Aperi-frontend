import 'package:aperi/screens/successful_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CodeID extends StatefulWidget {
  String? apiCode;
  String email;

  CodeID({Key? key, required this.email, apiCode}) : super(key: key) {
    email = email;

    getEmailCode(email);
  }

  Future<dynamic> postCodeAuth() async {
    final body = jsonEncode({'isAuthorized': true});
    final headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };

    var response = await http.post(
      Uri.parse(
          'http://192.168.1.82:7004/api/code-auth'), //TODO: ssl certificate validation
      headers: headers,
      body: body,
    );
  }

  Future<dynamic> getEmailCode(String email) async {
    final body = jsonEncode({'email': email});

    final headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json',
    };
    final response = await http.post(
      Uri.parse(
          'http://192.168.1.82:7004/api/get-code'), //TODO: ssl certificate validation
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      apiCode = jsonDecode(response.body)['oneTimeCode'];
    } else {
      throw Exception("Failed to fetch code!");
    }
  }

  @override
  State<CodeID> createState() => _CodeIDState();
}

class _CodeIDState extends State<CodeID> {
  String displayMessage = "Enter the 4-digit code";
  String localCode = "";
  final TextEditingController pin1Controller = TextEditingController();
  final TextEditingController pin2Controller = TextEditingController();
  final TextEditingController pin3Controller = TextEditingController();
  final TextEditingController pin4Controller = TextEditingController();

  @override
  void dispose() {
    pin1Controller.dispose();
    pin2Controller.dispose();
    pin3Controller.dispose();
    pin4Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '4-digit-code',
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
          child: Form(
            child: SizedBox(
              width: 270,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Check your inbox, we sent you the code :)',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    displayMessage,
                    style: TextStyle(
                      color: displayMessage == "Enter the 4-digit code"
                          ? Colors.white
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 60.0,
                        height: 60.0,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            pin1Controller.text = value.toString();
                          },
                          onSaved: (pin1) {},
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 210, 198, 198),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          style: Theme.of(context).textTheme.headlineSmall,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 60.0,
                        height: 60.0,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            pin2Controller.text = value.toString();
                          },
                          onSaved: (pin2) {},
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 210, 198, 198),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          style: Theme.of(context).textTheme.headlineSmall,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 60.0,
                        height: 60.0,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            pin3Controller.text = value.toString();
                          },
                          onSaved: (pin3) {},
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 210, 198, 198),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          style: Theme.of(context).textTheme.headlineSmall,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 60.0,
                        height: 60.0,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            pin4Controller.text = value.toString();
                          },
                          onSaved: (pin4) {},
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 210, 198, 198),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          style: Theme.of(context).textTheme.headlineSmall,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: const Size(100, 30),
                      backgroundColor: const Color.fromARGB(90, 234, 230, 240),
                    ),
                    onPressed: () async {
                      String concatenatedCode = pin1Controller.text +
                          pin2Controller.text +
                          pin3Controller.text +
                          pin4Controller.text;
                      setState(
                        () {
                          localCode = concatenatedCode;
                        },
                      );

                      if (localCode == widget.apiCode) {
                        await widget.postCodeAuth();
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SuccessfulAuth(),
                          ),
                        );
                      } else {
                        displayMessage = 'Code incorrect! Try again';
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
