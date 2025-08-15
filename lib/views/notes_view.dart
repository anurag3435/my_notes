import 'package:flutter/material.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("notes"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(child: Column(
        children: [
          const Text("no notes yet!"),
        ],
      )),
    );
  }
}