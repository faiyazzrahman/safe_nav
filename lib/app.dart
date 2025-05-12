import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/map_page.dart';
import 'pages/post_crime_page.dart';
import 'pages/inbox_page.dart';
import 'pages/settings_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      title: 'SafeNav',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: user != null ? DashboardPage() : LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/dashboard': (context) => DashboardPage(),
        '/map': (context) => MapPage(),
        '/post': (context) => PostCrimePage(),
        '/inbox': (context) => InboxPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
