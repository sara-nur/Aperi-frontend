import 'package:aperi/screens/code_id_screen.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:aperi/widgets/ButtonWidget.dart';
import 'package:http/http.dart' as http;

class Email extends StatefulWidget {
  String apiCode = "";

  Email({Key? key}) : super(key: key);

  Future<dynamic> getEmailCode(String email) async {
    dynamic body = {email: email};
    final response = await http.post(
      Uri.parse('https://192.168.1.184:7004/api/get-code'),
      body: body,
    );
    if (response.statusCode == 200) {
      apiCode = response.body;
      print(apiCode);
    } else {
      throw Exception("Failed to fetch code!");
    }
  }

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Code',
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
        )),
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                      width: 300.0,
                      height: 70.0,
                      child: EmailFieldWidget(controller: emailController)),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 150.0,
                    height: 40.0,
                    child: buildButton(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton() => ButtonWidget(
        text: 'Submit',
        onClicked: () {
          final form = formKey.currentState!;

          if (form.validate()) {
            final email = emailController.text;
            widget.getEmailCode(email);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CodeID(apiCode: widget.apiCode)),
            );

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Your email is $email'),
              ));
          }
        },
      );
}

class EmailFieldWidget extends StatefulWidget {
  final TextEditingController controller;

  const EmailFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<EmailFieldWidget> createState() => _EmailFieldWidgetState();
}

class _EmailFieldWidgetState extends State<EmailFieldWidget> {
  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        decoration: const InputDecoration(
          hintText: 'Enter your email',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          prefixIcon: Icon(Icons.email_outlined),
        ),
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? 'Enter a valid email'
            : null,
      );
}
