

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'package:my_notes/utilities/snackbar.dart';
enum MenuAction {logout}
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
        actions:[
          PopupMenuButton(onSelected: (value) async{
            if (value ==MenuAction.logout) {
             await FirebaseAuth.instance.signOut();
             final user = FirebaseAuth.instance.currentUser;
             if(!context.mounted) return;
             if (user ==null) {
              showCustomSnackBar(context, "signed out successfully");
             }

              if(!context.mounted)return;
              Navigator.pushNamedAndRemoveUntil(context, "/login", (_) => false,);
            }
          } , itemBuilder: (context) => [
            const PopupMenuItem<MenuAction>(
              value: MenuAction.logout,
              child: Text("log out"),

            ),
          ],),
        ]
      ),
      body: Center(child: Column(
        children: [
          const Text("no notes yet!"),
        ],
      )),
    );
  }
}