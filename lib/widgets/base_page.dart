import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool showAppBar;
  final Widget? bottomNavigationBar; // Add this parameter

  const BasePage({
    required this.child,
    this.title,
    this.showAppBar = true,
    this.bottomNavigationBar, // Add to constructor
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          showAppBar
              ? AppBar(
                title: Text(
                  title ?? '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
              )
              : null,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: child,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar, // Add this line
    );
  }
}
