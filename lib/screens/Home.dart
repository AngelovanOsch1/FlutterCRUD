import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    String? email;

    email = currentUser?.email;

    return Scaffold(
      body: SizedBox(
        height: (MediaQuery.of(context).size.height),
        width: (MediaQuery.of(context).size.width),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(email ?? ''),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text("Login")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text("Sign up")),
            ElevatedButton(
                onPressed: () {
                  logout();
                },
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    setState(() {});
  }
}
