import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'test.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _keyForm = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _createAccount() {
    if (_keyForm.currentState!.validate()) {
      Database.username = _usernameController.text.trim();
      Database.password = _passwordController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Account created, please login"),
        ),
      );

      context.pop();
    }
  }

  @override
  void initState() {
    super.initState();
    print("SIGNUP PAGE OPENED");
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    print("SIGNUP PAGE CLOSED");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _keyForm,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                ),
                validator: (value) {
                  if (value == null || value.trim().length < 3) {
                    return "Username must be at least 3 characters";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
                validator: (value) {
                  if (value == null ||
                      !value.contains("@") ||
                      !value.contains(".")) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                ),
                validator: (value) {
                  if (value != _passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: _createAccount,
                child: const Text("Create Account"),
              ),

              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text("Back to Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}