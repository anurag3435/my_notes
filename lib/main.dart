
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/views/notes_view.dart';
import 'package:my_notes/views/verify_email.dart';
import 'firebase_options.dart';
import 'package:my_notes/views/login_view.dart';
import 'package:my_notes/views/register_view.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // to make sure engine is ready 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "my notes", //where is this displayed?
    home: LoginView(),
    routes: {
      "/login" : (context) => LoginView(),
      "/register" : (context) =>RegisterView(),
      "/emailVerify" : (context) =>VerifyEmail(),
      "/notes" : (context) => NotesView(),
    }
    
  ));
}