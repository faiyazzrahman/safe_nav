// lib/auth_page.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message = '';

  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      setState(() => message = 'Signed up successfully!');
    } catch (e) {
      setState(() => message = 'Error: ${e.toString()}');
    }
  }

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      setState(() => message = 'Logged in successfully!');
    } catch (e) {
      setState(() => message = 'Error: ${e.toString()}');
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    setState(() => message = 'Signed out.');
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Auth')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (user != null) Text('Logged in as: ${user.email}'),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: signUp, child: const Text('Sign Up')),
                ElevatedButton(onPressed: signIn, child: const Text('Login')),
                ElevatedButton(onPressed: signOut, child: const Text('Logout')),
              ],
            ),
            const SizedBox(height: 16),
            Text(message, style: const TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
