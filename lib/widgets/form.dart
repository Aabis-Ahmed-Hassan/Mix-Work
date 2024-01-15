import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool submitButtonIsPressed =
      false; //responsible for not showing the error when the user is entering email for the first time.

  var showPassword = 0;

  @override
  void initState() {
    super.initState();
    submitButtonIsPressed = false;
    showPassword = 0;
  }

  mySubmitButton() {
    setState(() {
      submitButtonIsPressed = true;
    });

    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.green,
            body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _email,
                      decoration: const InputDecoration(
                        label: Text('Email'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field can not be empty';
                        } else if (!RegExp(
                                    r"^[a-zA-Z0-9_+-.]+[@][a-zA-Z0-9]+[.][a-z]+")
                                .hasMatch(value) &&
                            submitButtonIsPressed) {
                          return 'Invalid Email Syntax';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: showPassword % 2 == 0 ? true : false,
                        controller: _password,
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPassword++;
                                });
                              },
                              icon: Icon(showPassword % 2 == 0
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field can not be empty';
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: mySubmitButton,
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Text('Submit'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
