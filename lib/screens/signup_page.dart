import 'package:flutter/material.dart';
import 'shop_page.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Save the outer context for safe navigation
      final outerContext = context;

      showDialog(
        context: outerContext,
        builder: (dialogContext) => AlertDialog(
          title: const Text("Success",
          ),
          content: const Text("Account created successfully"
          ),
          actions: [
            TextButton(
              onPressed: () {
                // 1. Close the dialog
                Navigator.of(dialogContext).pop();
                // 2. Navigate using the outer context
                Navigator.pushReplacement(
                  outerContext,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 600),
                    pageBuilder: (_, __, ___) =>  MainShoppingScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: const Text("Close"
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account",
          style: TextStyle(color: Color(0xFF724BA1))),
          centerTitle: true,
      ),
      backgroundColor: Color(0xFF724BA1),
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            height: 520,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  // Full Name
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: "Full Name",
                    labelStyle: TextStyle(
                    fontSize: 16
                    )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your full name";
                      }
                      if (!RegExp(r'^[A-Z]').hasMatch(value)) {
                        return "First letter must be uppercase";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
              
                  // Email
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: "Email"
                    , labelStyle: TextStyle(
                    fontSize: 16
                    )),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      if (!value.contains("@")) {
                        return "Email must contain '@'";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
              
                  // Password
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: "Password"
                    , labelStyle: TextStyle(
                    fontSize: 16
                    )),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a password";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
              
                  // Confirm Password
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(labelText: "Confirm Password",
                    labelStyle: TextStyle(
                    fontSize: 16
                    )),
                    obscureText: true,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
              
                  // Submit Button
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF724BA1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    child: const Text("Create Account"
                    , style: TextStyle(
                     color: Colors.white, fontWeight: FontWeight.bold)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
