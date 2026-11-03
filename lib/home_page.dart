
/*
Part 2: const

const makes widgets immutable compile-time constants.
Flutter can reuse constant widget instances during
rebuilds instead of creating new instances repeatedly.

This can reduce unnecessary object creation and
improve performance.
*/

/*
Part 3: Private State Classes

In Dart, an underscore (_) makes a variable, method,
or class private to its library (file).

State classes should be private because they are
implementation details of their widgets and do not
need to be accessed from other files.
*/

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'test.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print("start Home");
  }

  @override
  void dispose() {
    print("finish Home");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to Home Page"),
            ElevatedButton(
              onPressed: () {
                context.push("/home/products");
              },
              child: const Text("Go to Products"),
            ),
            ElevatedButton(
              onPressed: () {
                Database.isLoggedIn = false;
                context.go("/login");
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
