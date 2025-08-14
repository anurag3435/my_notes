
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'package:my_notes/views/login_view.dart';
import 'package:my_notes/views/register_view.dart';




// havent added option how to do it ??
void main() {
  Firebase.initializeApp(
    // options: 
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "my notes",
    home: RegisterView(),
  ));
}