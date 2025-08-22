import 'package:flutter/material.dart';
import 'package:my_notes/constants/routes.dart';
import 'package:my_notes/services/auth/auth_service.dart';
import 'package:my_notes/views/notes/create_notes_view.dart';
import 'package:my_notes/utilities/snackbar.dart';

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
      body: notes.isEmpty
          ? const Center(child: Text("no notes yet!"))
          : ListView.separated(
              itemCount: notes.length,
              separatorBuilder: (context, index) => const Divider(
                // 👈 adds separation
                color: Colors.grey,
                thickness: 1,
                height: 10,
              ),
              itemBuilder: (context, index) {
                return Card(
                  // 👈 gives nice background + spacing
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: ListTile(
                    title: Text(
                      notes[index],
                      style: const TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CreateNotesView(
                            noteIndex: index,
                          ), // 👈 pass index
                        ),
                      );
                    },
                    onLongPress: () {
                      final deletedNote = notes[index];
                      setState(() {
                        notes.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("Note deleted"),
                          action: SnackBarAction(
                            label: "UNDO",
                            onPressed: () {
                              // Restore note
                              setState(() {
                                notes.insert(index, deletedNote);
                              });
                            },
                          ),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, createNotes);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
