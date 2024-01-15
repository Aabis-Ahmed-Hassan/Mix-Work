
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  mySubmitButton() {
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
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(label: Text('Email')),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter something';
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        controller: _password,
                        decoration: InputDecoration(label: Text('Password')),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the password';
                          }
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: mySubmitButton,
                      child: Container(
                        height: 50,
                        width: 150,
                        color: Colors.blue,
                        child: Center(
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
