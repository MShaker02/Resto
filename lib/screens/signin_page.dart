import 'package:flutter/material.dart';

import 'shop_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final outerContext = context;

      showDialog(
        context: outerContext,
        builder: (dialogContext) => AlertDialog(
          title: const Text("Success"
          ),
          content: const Text("Login successful"
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Close dialog
                Navigator.of(dialogContext).pop();
                // Navigate to shopping screen
                Navigator.pushReplacement(
                  outerContext,
                  MaterialPageRoute(
                    builder: (_) =>  MainShoppingScreen(),
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
      appBar: AppBar(title: const Text("Sign In"
      , style: TextStyle(color: Color(0xFF724BA1)))
      , centerTitle: true
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
            height: 300,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  // Email field
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: "Email",
                    labelStyle: TextStyle(fontSize: 16)
                    ),
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
                  const SizedBox(height: 15),
                    
                  // Password field
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: "Password"
                    , labelStyle: TextStyle(fontSize: 16)
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                    
                  // Sign In Button
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
                    child: const Text("Sign In"
                    , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
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


