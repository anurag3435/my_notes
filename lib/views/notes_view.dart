import 'package:flutter/material.dart';
import 'package:my_notes/constants/routes.dart';
import 'package:my_notes/services/auth/auth_service.dart';

import 'package:my_notes/utilities/snackbar.dart';
import 'package:my_notes/views/notes/create_notes_view.dart';
import 'package:path/path.dart';

enum MenuAction { logout }

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: const Text("notes"),
        backgroundColor: Colors.blueGrey,
        actions: [
          PopupMenuButton(
            onSelected: (value) async {
              if (value == MenuAction.logout) {
                await AuthService.firebase().logout();
                final user = AuthService.firebase().currentUser;
                if (!context.mounted) return;
                if (user == null) {
                  showCustomSnackBar(context, "signed out successfully");
                }

                if (!context.mounted) return;
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  loginRoute,
                  (_) => false,
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem<MenuAction>(
                value: MenuAction.logout,
                child: Text("log out"),
              ),
            ],
          ),
        ],
      ),
      body: Center(child: const Text("no notes yet!")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, createNotes);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
