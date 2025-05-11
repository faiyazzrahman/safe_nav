import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostCrimePage extends StatefulWidget {
  @override
  _PostCrimePageState createState() => _PostCrimePageState();
}

class _PostCrimePageState extends State<PostCrimePage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _submitPost() async {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      await FirebaseFirestore.instance.collection('crimes').add({
        'title': _titleController.text,
        'description': _descriptionController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill in both fields')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post a Crime')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Crime Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Crime Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _submitPost, child: Text('Submit Crime')),
          ],
        ),
      ),
    );
  }
}
