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
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> createAccount() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
    } catch (e) {
      e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Container(
            padding: const EdgeInsets.all(15),
            height: 350,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: 100,
                            child: TextFormField(
                              decoration:
                                  const InputDecoration(hintText: "First name"),
                              controller: firstNameController,
                              validator: (value) {
                                if (value!.isNotEmpty && value.length >= 2) {
                                  return null;
                                } else {
                                  return "Error";
                                }
                              },
                            )),
                        SizedBox(
                            width: 100,
                            child: TextFormField(
                              decoration:
                                  const InputDecoration(hintText: "Last Name"),
                              controller: lastNameController,
                              validator: (value) {
                                if (value!.isNotEmpty && value.length > 3) {
                                  return null;
                                } else {
                                  return "Error";
                                }
                              },
                            )),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Email'),
                      controller: emailController,
                      validator: (value) {
                        if (value!.isNotEmpty && value.length > 5) {
                          return null;
                        } else {
                          return "Error";
                        }
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(hintText: 'Password'),
                      controller: passwordController,
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
                          createAccount();
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
