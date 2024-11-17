import 'package:flutter/material.dart';
import 'note.dart';
import 'noteeditscreen.dart';
import 'noteviewscreen.dart';

class NotesListScreen extends StatefulWidget {
  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  List<Note> _notes = [];

  void _navigateToEdit(Note? note) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteEditScreen(note: note),
      ),
    );

    if (result != null && result is Note) {
      setState(() {
        if (note == null) {
          // Add a new note
          _notes.add(result);
        } else {
          // Update an existing note
          int index = _notes.indexOf(note);
          _notes[index] = result;
        }
      });
    }
  }

  void _navigateToView(Note note) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteViewScreen(note: note),
      ),
    );
  }

  void _deleteNote(Note note) {
    setState(() {
      _notes.remove(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MySimpleNote'),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final note = _notes[index];
          return ListTile(
            title: Text(note.title.isNotEmpty ? note.title : 'Untitled'),
            subtitle: Text(note.content.isNotEmpty ? note.content : 'No content'),
            onTap: () => _navigateToView(note), // Navigate to view note
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _navigateToEdit(note),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteNote(note),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToEdit(null),
        child: Icon(Icons.add),
      ),
    );
  }
}
