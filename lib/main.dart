import 'package:flutter/material.dart';
import "dart:developer" as devtool;

import 'package:my_notes/views/login_view.dart';
//understanding basics of dart!!
//extensions 




void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "my notes",
    home: LoginView(),
  ));
}