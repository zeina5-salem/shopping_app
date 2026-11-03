import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'test.dart';
/*push -> بتفتح الصفحه الجديده فوق الصفحه الحالية في stack  ومش بتعمل dispose ليها واقدر ارجعلها لما اعمل pop
go -> بت respect url بتنفذ ال url بالظبط ولو مثلا عامله "home/" هتروح للهوم علطول ولو عملت pop هيديني ايرور
*/
/*
Part 1: super.key

super.key passes the key received by the widget
constructor to the parent class (StatefulWidget).

The key is assigned to the widget itself and helps
Flutter identify widgets in the widget tree.

Difference between Key and GlobalKey<FormState>:

The key passed through super.key identifies the widget
in the widget tree.

GlobalKey<FormState> is used to access the FormState
and perform operations such as validate().
*/


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _inputCheck() {
    if (_keyForm.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;

      if (username == Database.username && password == Database.password) {
        Database.isLoggedIn = true;
        context.go("/home");
      } else {
        _usernameController.clear();
        _passwordController.clear();

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Wrong info")));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    print("start Login");
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

    print("finish Login");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: "Username"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter username";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _inputCheck,
                child: const Text("Go to home"),
              ),

/*
Difference between go() and push():

push() adds a new page on top of the navigation stack.
The previous page stays in the stack, so we can return
to it using pop().

go() navigates directly to a new location and changes
the navigation stack.
It does not necessarily keep the previous page,
so pop() may not work.
*/

              TextButton(
                onPressed: () {
                  context.push("/signup");
                },
                child: const Text("Don't have an account? Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
