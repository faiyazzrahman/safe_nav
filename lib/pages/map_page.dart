import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int _currentIndex = 1;
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
      appBar: AppBar(title: Text('Map')),
      body: Center(child: Text('Map with crime locations')),
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
