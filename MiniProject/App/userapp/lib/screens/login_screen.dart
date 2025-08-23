// ignore_for_file: sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:userapp/routes/app_routes.dart';
import 'package:userapp/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool loading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 320,
                  ), // ~20 chars at default font
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                    validator: (val) => val!.isEmpty ? "Enter username" : null,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 320),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (val) => val!.isEmpty ? "Enter password" : null,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text('Signup'),
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRoutes.signup),
                    ),
                    SizedBox(width: 24),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        child: loading
                            ? CircularProgressIndicator()
                            : Text('Login'),
                        onPressed: loading
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() => loading = true);
                                  bool success = false;
                                  try {
                                    success = await AuthService().login(
                                      _usernameController.text,
                                      _passwordController.text,
                                    );
                                  } catch (e) {
                                    debugPrint(e.toString());
                                    success = false;
                                  }
                                  setState(() => loading = false);
                                  if (success) {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      AppRoutes.posts,
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Login failed")),
                                    );
                                  }
                                }
                              },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
