import 'package:crud/classes/Database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Widget _loadedScreen(String name) {
    return Text(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Database().getUser(),
          builder: (context, snapshot) {
            Widget retVal;
            if (snapshot.connectionState == ConnectionState.done) {
              retVal = _loadedScreen(snapshot.data ?? '');
            } else {
              retVal = const CircularProgressIndicator();
            }
            return retVal;
          },
        ),
      ),
    );
  }
}
