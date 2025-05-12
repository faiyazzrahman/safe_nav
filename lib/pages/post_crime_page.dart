import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class PostCrimePage extends StatefulWidget {
  @override
  _PostCrimePageState createState() => _PostCrimePageState();
}

class _PostCrimePageState extends State<PostCrimePage> {
  int _currentIndex = 2;
  void _onTabSelected(int index) {
    if (index == 0) Navigator.pushReplacementNamed(context, '/dashboard');
    if (index == 1) Navigator.pushReplacementNamed(context, '/map');
    if (index == 2) Navigator.pushReplacementNamed(context, '/post');
    if (index == 3) Navigator.pushReplacementNamed(context, '/inbox');
    if (index == 4) Navigator.pushReplacementNamed(context, '/settings');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Crime')),
      body: Center(child: Text('Post a crime incident here')),
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
