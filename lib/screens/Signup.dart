import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Container(
            padding: const EdgeInsets.all(15),
            height: 300,
            width: 300,
            color: const Color.fromARGB(31, 159, 158, 158),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
                      'Sign up',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 30,
                          letterSpacing: 2.0),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Email'),
                      validator: (value) {
                        if (value!.isNotEmpty && value.length > 5) {
                          return null;
                          FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: email, password: password);
                        } else {
                          return "Error";
                        }
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(hintText: 'Password'),
                      validator: (value) {
                        if (value!.isNotEmpty && value.length > 5) {
                          return null;
                        } else {
                          return "Error";
                        }
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        } else {
                          Navigator.pushNamed(context, '/home');
                        }
                      },
                      child: const Text('Submit'),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
