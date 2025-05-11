import 'package:flutter/material.dart';
import 'post_crime_page.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Crime Posts will be displayed here.'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostCrimePage()),
                );
              },
              child: Text('Post a Crime'),
            ),
          ],
        ),
      ),
    );
  }
}
