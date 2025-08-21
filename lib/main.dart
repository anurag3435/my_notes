import 'package:flutter/material.dart';
import 'package:my_notes/constants/routes.dart';
import 'package:my_notes/services/auth/auth_service.dart';
import 'package:my_notes/views/notes_view.dart';
import 'package:my_notes/views/verify_email.dart';

import 'package:my_notes/views/login_view.dart';
import 'package:my_notes/views/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // to make sure engine is ready
  await AuthService.firebase().initialize();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "my notes", //where is this displayed?
      home: LoginView(),
      routes: {
        loginRoute: (context) => LoginView(),
        registerRoute: (context) => RegisterView(),
        emailVerifyRoute: (context) => VerifyEmail(),
        notesRoute: (context) => NotesView(),
      },
    ),
  );
}
// i have skipped unit testing for now and has move forward