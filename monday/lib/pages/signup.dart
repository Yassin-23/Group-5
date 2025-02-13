import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _signup() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signup Successful!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth > 600 ? 400 : screenWidth * 0.9, 
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(64, 235, 230, 230),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 5),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: "Name", border: OutlineInputBorder()),
                    validator: (value) => value!.isEmpty ? "Please enter your name" : null,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) return "Please enter your email";
                      if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) return "Please enter a password";
                      if (value.length < 6) return "Password must be at least 6 characters";
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(labelText: "Confirm Password", border: OutlineInputBorder()),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) return "Please confirm your password";
                      if (value != _passwordController.text) return "Passwords do not match";
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _signup,
                      child: Text("Sign Up", style: TextStyle(fontSize: 30)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                      },
                      child: Text(
                        "Already have an account? Login",
                        style: TextStyle(color: const Color.fromARGB(255, 68, 84, 97), fontSize: 16),
                      ),
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
