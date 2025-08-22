import 'package:flutter/material.dart';
import 'package:my_notes/constants/routes.dart';

List<String> notes = [];

class CreateNotesView extends StatefulWidget {
  final int? noteIndex;
  const CreateNotesView({super.key, this.noteIndex});

  @override
  State<CreateNotesView> createState() => _CreateNotesViewState();
}

class _CreateNotesViewState extends State<CreateNotesView> {
  final _noteController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.noteIndex != null) {
      _noteController.text = notes[widget.noteIndex!]; // load note text
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[50],
        title: const Text("create a note!"),
        leading: IconButton(
          onPressed: () async {
            Navigator.pushReplacementNamed(context, notesRoute);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.purpleAccent),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (widget.noteIndex == null) {
                notes.add(_noteController.text);
              } else {
                notes[widget.noteIndex!] = _noteController.text;
              }
              Navigator.pushReplacementNamed(context, notesRoute);
            },
            icon: Icon(Icons.save, color: Colors.purpleAccent),
          ),
        ],
      ),
      body: ListView(
        children: [
          TextField(
            style: TextStyle(fontSize: 24),
            controller: _noteController,
            decoration: InputDecoration(
              hintText: "what's on your mind!",
              border: InputBorder.none,
            ),
            maxLines: null,
          ),
        ],
      ),
      backgroundColor: Colors.purple[50],
    );
  }
}
