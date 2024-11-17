import 'package:flutter/material.dart';
import 'noteslistscreen.dart';

void main() {
  runApp(MySimpleNoteApp());
}

class MySimpleNoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MySimpleNote',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotesListScreen(),
    );
  }
}

