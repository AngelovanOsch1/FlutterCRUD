import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginAccount() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
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
            height: 300,
            width: 300,
            color: const Color.fromARGB(31, 159, 158, 158),
            child: Form(
                key: _formKeyLogin,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
                      'Login',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 30,
                          letterSpacing: 2.0),
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
                        if (!_formKeyLogin.currentState!.validate()) {
                          return;
                        } else {
                          loginAccount();
                          Navigator.pushNamed(context, '/home');
                        }
                      },
                      child: const Text('Login'),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
