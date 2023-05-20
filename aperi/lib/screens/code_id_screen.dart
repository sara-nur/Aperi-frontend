import 'dart:html';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:aperi/widgets/ButtonWidget.dart';

class CodeID extends StatefulWidget {
  const CodeID({super.key});

  @override
  State<CodeID> createState() => _CodeIDState();
}

class _CodeIDState extends State<CodeID> {
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
          '4-digit code',
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
            Color.fromARGB(255, 67, 144, 207),
            Color.fromARGB(223, 183, 144, 54),
          ],
        )),
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  EmailFieldWidget(controller: emailController),
                  const SizedBox(
                    height: 16,
                  ),
                  buildButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton() => ButtonWidget(
        text: 'SUBMIT',
        onClicked: () {
          final form = formKey.currentState!;

          if (form.validate()) {
            final email = emailController.text;

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
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
