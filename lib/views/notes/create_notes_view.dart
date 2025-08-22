import 'package:flutter/material.dart';
import 'package:my_notes/constants/routes.dart';

class CreateNotesView extends StatefulWidget {
  const CreateNotesView({super.key});

  @override
  State<CreateNotesView> createState() => _CreateNotesViewState();
}

class _CreateNotesViewState extends State<CreateNotesView> {
  final _noteController = TextEditingController();
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
